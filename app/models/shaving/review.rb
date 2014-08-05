class Shaving::Review < ActiveRecord::Base
  belongs_to :product, :class_name => 'Shaving::Product'

  validates_presence_of :product

  validates :overall_rating, inclusion: { in: 0..10 }, presence: true
  validates :face_feel, inclusion: { in: 0..10 }, presence: true
  validates :shaving_feel, inclusion: { in: 0..10 }, presence: true
end
