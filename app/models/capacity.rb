class Capacity < ApplicationRecord
  belongs_to :nursery_school, primary_key: :code
end
