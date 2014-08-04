class Shaving::Review < ActiveRecord::Base
  belongs_to :product, :class_name => 'Shaving::Product'

  validates_presence_of :product
end
