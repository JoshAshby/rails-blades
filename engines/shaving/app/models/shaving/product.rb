module Shaving
  class Product < ActiveRecord::Base
    belongs_to :user, class_name: Shaving.user_class.to_s
    validates_presence_of :user

    belongs_to :type
    validates_presence_of :type

    belongs_to :brand
    validates_presence_of :brand

    has_many :reviews, dependent: :destroy

    validates :name, presence: true, uniqueness: true
  end
end
