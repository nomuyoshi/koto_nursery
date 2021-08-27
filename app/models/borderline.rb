class Borderline < ApplicationRecord
  belongs_to :nursery, primary_key: :code
end
