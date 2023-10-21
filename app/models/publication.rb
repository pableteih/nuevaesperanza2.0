class Publication < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :clients, through: :product
end
