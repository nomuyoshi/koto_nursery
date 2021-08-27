class Capacity < ApplicationRecord
  belongs_to :nursery, primary_key: :code
end
