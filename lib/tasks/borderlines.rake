require "csv"

namespace :borderlines do
  desc "CSVファイル作成"
  task :create_master_csv, [:year] => :environment do |task, args|
    year = args.year
    dirty_file = File.join(Rails.root, "db/seeds/dirty/", "borderline#{year}.csv")
    dirty_data = CSV.read(dirty_file, { headers: true })
    master_file = File.join(Rails.root, "db/seeds/", "borderline.csv")
    is_new = !File.exist?(master_file) 

    nurseriesHash = Nursery.pluck(:name, :code).to_h
    capacitiesHash = Capacity.select(:nursery_code, :age).group_by(&:nursery_code)
    ages = [0, 1, 2, 3, 4, 5]

    CSV.open(master_file, "ab") do |csv|
      if is_new
        csv << ["nursery_code", "age", "point", "priority_order", "undisclosed", "less_capacity", "year"]
      end

      dirty_data.each do |row|
        code = nurseriesHash[row["name"].unicode_normalize(:nfc)]
        unless code
          puts "Not Found. #{row["name"]}"
          next
        end

        master_row = []
        ages.each do |age|
          case row["#{age}"]
          when "ー"
            master_row = [code, age, nil, false, true, false, year]
          when "なし", /残/
            master_row = [code, age, nil, false, false, true, year]
          when nil
            # 定員がない（対応していない）年齢の場合はスキップ
            next unless capacitiesHash[code].find { |c| c.age == age }
            # 空きがなかった場合
            master_row = [code, age, nil, false, false, false, year]
          else
            priority_order = row["#{age}"].include?("【優】")
            point = row["#{age}"].gsub(/【優】/, "").to_i
            master_row = [code, age, point, priority_order, false, false, year]
          end

          csv << master_row
        end
      end
    end
  end

  # csv作成時のミスがないか確認したいので、存在しない保育園名がないかチェック
  desc "ras csv ファイルの保育園名がDBに存在するか確認する"
  task :check_dirty_csv_nursery_name_exists, [:year] => :environment do |task, args|
    dirty_file = File.join(Rails.root, "db/seeds/dirty/", "borderlines#{args.year}.csv")
    dirty_csv = CSV.read(dirty_file, { headers: true })
    # key: name, value: code のHash作成
    nursery_names_set = Set.new(Nursery.pluck(:name))
    dirty_csv.each_with_index do |row, i|
      dirty_name = row["name"].unicode_normalize(:nfc)
      next if nursery_names_set.include?(dirty_name)

      candidates = []
      nursery_names_set.each do |name|
        # 表記ゆれ、スペースの違い、改行コードが混ざっているなどの場合は先頭5文字で良い感じに引っかかるはず。
        candidates << name if name.start_with?(dirty_name[0..4])
      end
    
      puts "#{i+1}:#{row["name"]}, candidates = #{candidates}"
    end
  end
end
