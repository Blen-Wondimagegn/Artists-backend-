class Artist < ApplicationRecord
  has_many :glams, dependent: :destroy  
  accepts_nested_attributes_for :glams 
end
