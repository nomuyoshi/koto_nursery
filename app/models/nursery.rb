class Nursery < ApplicationRecord
  self.primary_key = :code
  enum kind: {
    public: 0,        # 区立
    public_private: 1, # 公設民営
    private: 2, # 私立
    sho_a: 3,          # 小規模認可A型
    nintei_yo: 4,      # 認定こども園（幼保連携型）
    nintei_chi: 5,     # 認定こども園（地方裁量型）
  }, _prefix: true

  # TODO: enumではなくintで月齢を入れる
  # 生後57日〜を生後2ヶ月から入園というのが一般的。
  enum min_age_type: {
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
  has_many :capacities, foreign_key: :nursery_code

  geocoded_by :address

  def self.search(kinds, min_age_type, address, km = 1.0)
    result = self.all
    result = result.where(kind: kinds) if kinds.present?
    result = result.where(min_age_type: self.under_age_types(min_age_type)) if min_age_type.present?
    result = result.near(address, km, unit: :km) if address.present?

    result
  end

  def self.under_age_types(min_age_type)
    reference_value = min_age_types[min_age_type]

    under_age_types = min_age_types.filter { |_, v| reference_value >= v }
    under_age_types.keys
  end
end
