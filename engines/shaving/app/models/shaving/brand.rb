module Shaving
  class Brand < ActiveRecord::Base
    belongs_to :user, class_name: Shaving.user_class.to_s
    validates_presence_of :user

    has_many :products, dependent: :destroy

    validates :name, presence: true, uniqueness: true
  end
end
