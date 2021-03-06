module Shaving
  class Review < ActiveRecord::Base
    def self.table_name_prefix
      'shaving_'
    end

    belongs_to :user
    validates_presence_of :user

    belongs_to :product
    validates_presence_of :product

    validates :overall_rating, inclusion: { in: 0..10 }, presence: true
    validates :face_feel, inclusion: { in: 0..10 }, presence: true
    validates :shaving_feel, inclusion: { in: 0..10 }, presence: true
  end
end
