class Nomad < ActiveRecord::Base
  has_secure_password 
  has_many :residences
  has_many :nomad_to_roommate_loans
  has_many :roommate_to_nomad_loans
  has_many :landlords, through: :residences
  has_many :roommates, through: :residences
end
