class Shaving::Review < ActiveRecord::Base
  belongs_to :product, :class_name => 'Shaving::Product'
end
