class Product < ApplicationRecord
  belongs_to :type
  belongs_to :composition
  belongs_to :locality
  belongs_to :client
  has_many_attached :files
end
