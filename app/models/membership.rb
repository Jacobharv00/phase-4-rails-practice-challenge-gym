class Membership < ApplicationRecord
  belongs_to :client
  belongs_to :gym
  validates :client, uniqueness: true 
end
