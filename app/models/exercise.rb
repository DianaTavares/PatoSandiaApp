class Exercise < ApplicationRecord
  belongs_to :user
  # con dependent: :delete_all al elminar el ejercicio se elminaran sus inputs y texts
  # http://guides.rubyonrails.org/association_basics.html
  has_many :texts, dependent: :delete_all
  has_many :inputs,  dependent: :delete_all
end
