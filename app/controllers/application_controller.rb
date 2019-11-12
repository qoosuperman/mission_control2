require 'active_support/concern'

class ApplicationController < ActionController::Base
  include MyDevise::Logable

  helper_method :current_user, :sign_in?
  # 把從模組拿到的這兩個方法給 view 使用
end
