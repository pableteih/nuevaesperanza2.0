class Publication < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :clients, through: :product
  has_many :contacts
  has_many_attached :images

end
