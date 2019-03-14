class Residence < ActiveRecord::Base
  belongs_to :landlord
  belongs_to :nomad
  has_many :roommates
end
