class NurserySchool < ApplicationRecord
  enum kind: {
    public: 0,         # 区立
    public_private: 1, # 公設民営
    private: 2,        # 私立
    sho_a: 3,          # 小規模認可A型
    nintei_yo: 4,      # 認定こども園（幼保連携型）
    nintei_chi: 5,     # 認定こども園（地方裁量型）
  }

  has_many :borderlines
  has_one :capacity
end
