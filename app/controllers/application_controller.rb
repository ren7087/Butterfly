class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # def self.render_with_signed_in_user(user, *args)
  #     ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
  #     proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
  #     renderer = self.renderer.new('warden' => proxy)
  #     renderer.render(*args)
  # end
  
  class << self
    def render_with_signed_in_user(user, *args)
      pp user
      pp args
      
      ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
      proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
      renderer = self.renderer.new('warden' => proxy)
      renderer.render(*args)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :self_introduction, :profile_image])
  end
end
