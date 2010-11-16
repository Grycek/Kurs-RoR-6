require 'spec_helper'

describe Playlist, "when creating playlist" do
  it "should be valid with name and user_id" do
      playlist = Playlist.new(:name => 'Temporary', :user_id => 6)
      playlist.should be_valid
  end
  
  it "should not be valid without name" do
      playlist = Playlist.new(:user_id => 6)
      playlist.should_not be_valid
  end
  
  it "should not be valid without user_id" do
      playlist = Playlist.new(:name => 'Temporary')
      playlist.should_not be_valid
  end
  
  it "should create playlists" do
      playlist = Playlist.new
      my_mock  = mock("Nazwa", :id => 1)
      playlist.save(:user_id => my_mock.id, :name => 'tmp')
  end
end
