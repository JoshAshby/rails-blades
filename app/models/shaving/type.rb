module Shaving
  class Type < ActiveRecord::Base
    def self.table_name_prefix
      'shaving_'
    end

    has_many :products, dependent: :destroy

    validates :name, presence: true, uniqueness: true
  end
end
