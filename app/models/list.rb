class List < ApplicationRecord
  belongs_to :card
  has_many :listitems
end
