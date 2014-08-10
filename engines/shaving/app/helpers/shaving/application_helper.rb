module Shaving
  module ApplicationHelper
    def updated_at mod
      mod.updated_at.to_s :short_12
    end

    def logged_in?
      true
    end

    def current_user
      "Josh"
    end
  end
end
