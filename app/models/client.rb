class Client < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :gyms, through: :memberships
  
  def membership_total
    memberships.sum {|membership| membership.charge}
  end

end
