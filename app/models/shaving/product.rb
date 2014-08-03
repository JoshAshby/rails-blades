class Shaving::Product < ActiveRecord::Base
  belongs_to :type, :class_name => 'Shaving::Type'
  belongs_to :brand, :class_name => 'Shaving::Brand'
  has_many :reviews, dependent: :destroy, :class_name => 'Shaving::Review'

  validates :name, presence: true
end
