class Roommate < ActiveRecord::Base
  belongs_to :residence
  has_many :nomad_to_roommate_loans
  has_many :roommate_to_nomad_loans
end
