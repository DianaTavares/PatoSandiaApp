class Exercise < ApplicationRecord
  belongs_to :user
  has_many :texts
  has_many :inputs
end
