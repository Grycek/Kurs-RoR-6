require "test_helper"
require "capybara/rails"
require 'factory_girl'

#Dir["#{File.dirname(__FILE__)}/factories/*.rb"].each {|f| require f} 
require "#{File.dirname(__FILE__)}/factories.rb"

module ActionController
  class IntegrationTest
    include Capybara
    
    def sign_in
      visit '/users/sign_in'
      @user = Factory( :user )
      fill_in 'user[email]', :with => @user.email
      fill_in 'user[password]', :with => @user.password
      click_button "Sign in"
      return @user
    end
  end
end
