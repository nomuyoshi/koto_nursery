class NurserySchool < ApplicationRecord
  self.primary_key = :code
  enum kind: {
    public: 0,        # 区立
    public_private: 1, # 公設民営
    private: 2, # 私立
    sho_a: 3,          # 小規模認可A型
    nintei_yo: 4,      # 認定こども園（幼保連携型）
    nintei_chi: 5,     # 認定こども園（地方裁量型）
  }, _prefix: true
  enum min_acceptable_age_type: {
    fifty_seven_days: 0,
    four_months: 1,
    six_months: 2,
    one_year: 3,
    three_years: 4,
  }

  enum overtime_condition_type: {
    one_year_old: 0,
    one_year_old_class: 1,
    zero_year_old_class: 2,
  }
  # 江東区の保育園のしおりのコードを利用
  enum opening_type: {
    a: 0,
    a2: 1,
    b: 2,
    b2: 3,
    c: 4,
    d: 5,
    d2: 6,
    e: 7,
    f: 8,
  }


  has_many :borderlines
  has_one :capacity

  geocoded_by :address
  def self.search(kinds, min_age_types, address, km)
    result = self.all
    result = result.where(kind: kinds) if kinds.present?
    result = result.where(min_acceptable_age_type: min_age_types) if min_age_types.present?
    result = result.near(address, km, unit: :km) if address.present? && km.present?

    result
  end
end
