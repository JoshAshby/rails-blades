module Shaving
  class Product < ActiveRecord::Base
    def self.table_name_prefix
      'shaving_'
    end

    belongs_to :user
    validates_presence_of :user

    belongs_to :type
    validates_presence_of :type

    belongs_to :brand
    validates_presence_of :brand

    has_many :reviews, dependent: :destroy

    validates :name, presence: true, uniqueness: true
  end
end
