require 'spec_helper'

describe PlaylistsController do
  include Devise::TestHelpers
  context "logged user" do
    before do
      @user = Factory( :user )
      sign_in @user
    end
    
    it "should redirect after create" do    
      post 'create', :playlist => {:user_id => @user.id, :name => "Proba"}
      response.should redirect_to(playlists_path)
    end
  end

end
