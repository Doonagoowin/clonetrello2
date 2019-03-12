class Card < ApplicationRecord
  belongs_to :board
  has_many :lists
end
