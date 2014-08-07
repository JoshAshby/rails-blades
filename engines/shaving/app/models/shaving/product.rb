module Shaving
  class Product < ActiveRecord::Base
    belongs_to :type
    belongs_to :brand
    has_many :reviews, dependent: :destroy

    validates :name, presence: true, uniqueness: true
    validates_presence_of :brand
    validates_presence_of :type
  end
end
