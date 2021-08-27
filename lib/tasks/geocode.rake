namespace :geocode do
  desc "緯度・経度更新"
  task update: :environment do
    total = Nursery.count
    progress = 0

    Nursery.find_each(batch_size: 100) do |n|
      results = Geocoder.search(n.address)
      n.latitude = results.first.latitude
      n.longitude = results.first.longitude

      n.save
      progress += 1
      if progress % 10 == 0
        puts "#{progress}/#{total}"
      end
    end
  end
end
