class Shaving::Review < ActiveRecord::Base
  belongs_to :product, :class_name => 'Shaving::Product'

  validates_presence_of :product

  validates_inclusion_of :overall_rating, in: 0..10
  validates_inclusion_of :face_feel, in: 0..10
  validates_inclusion_of :shaving_feel, in: 0..10
end
