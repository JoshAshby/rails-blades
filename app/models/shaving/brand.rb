module Shaving
  class Brand < ActiveRecord::Base
    def self.table_name_prefix
      'shaving_'
    end

    belongs_to :user
    validates_presence_of :user

    has_many :products, dependent: :destroy

    validates :name, presence: true, uniqueness: true
  end
end
