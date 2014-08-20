module Shaving
  class ApplicationController < ActionController::Base
    layout 'shaving/application'

    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  end
end
