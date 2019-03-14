class NomadToRoommateLoan < ActiveRecord::Base
  belongs_to :nomad
  belongs_to :roommate
end
