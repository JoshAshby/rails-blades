class Blade < ActiveRecord::Base
  belongs_to :brand

  validates :name, presence: true
end
