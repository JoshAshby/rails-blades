class Shaving::Type < ActiveRecord::Base
  has_many :products, dependent: :destroy, :class_name => 'Shaving::Product'

  validates :name, presence: true
end
