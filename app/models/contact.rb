class Contact < ApplicationRecord
  belongs_to :locality
  belongs_to :publication
end
