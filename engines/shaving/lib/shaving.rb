require "shaving/engine"

module Shaving
  mattr_accessor :user_class

  def self.user_class
    @@user_class.constantize
  end
end
