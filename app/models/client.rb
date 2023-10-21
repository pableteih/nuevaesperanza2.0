class Client < ApplicationRecord
  belongs_to :locality
  has_many :products
end
