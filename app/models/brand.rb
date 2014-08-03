class Brand < ActiveRecord::Base
  has_many :blades, dependent: :destroy
  has_many :soaps, dependent: :destroy

  validates :name, presence: true
end
