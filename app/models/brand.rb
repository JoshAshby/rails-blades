class Brand < ActiveRecord::Base
  has_many :blades
  has_many :soaps

  validates :name, presence: true
end
