class Exercise < ApplicationRecord
  belongs_to :user
  has_many :texts, dependent: :delete_all
  has_many :inputs,  dependent: :delete_all
end
