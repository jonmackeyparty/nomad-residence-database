class Landlord < ActiveRecord::Base
  has_many :roommates, through: :residences
  has_many :nomads, through: :residences
  has_many :residences
end
