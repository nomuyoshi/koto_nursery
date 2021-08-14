class NurserySchool < ApplicationRecord
  self.primary_key = :code
  enum kind: {
    kuritsu: 0,        # 区立
    kousetsu_minei: 1, # 公設民営
    watakushiritsu: 2, # 私立
    sho_a: 3,          # 小規模認可A型
    nintei_yo: 4,      # 認定こども園（幼保連携型）
    nintei_chi: 5,     # 認定こども園（地方裁量型）
  }
  enum min_acceptable_age_type: {
    fifty_seven_days: 0,
    four_months: 1,
    six_months: 2,
    one_year: 3,
    three_years: 4,
  }


  has_many :borderlines
  has_one :capacity
end
