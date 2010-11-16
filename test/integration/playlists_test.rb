require 'integration_test_helper' 

class PlaylistsTest < ActionController::IntegrationTest

  test "visit main page" do
    visit '/'
    assert page.has_content?('Wyszukaj')
  end
  

  test "visit search page" do
    visit '/'
    click_link "Wyszukaj"
    assert page.has_content?('List contains')
  end  
  
  test "log in" do
    sign_in   
  end

  test "logged user add playlist and search it" do
    @user = sign_in   
    visit '/playlists/new'    
    fill_in 'playlist[name]', :with => 'tmp_author'
    fill_in 'playlist[author]', :with => '#{@user.email}__tmp'
    fill_in 'playlist[list]', :with => 'The Beatles - LSD'
    click_button 'Dodaj'
    click_link 'Wyszukaj'
    fill_in 'search[list_contains]', :with => 'The Beatles - LSD'
    click_button 'Save Search'
    assert page.has_content?('tmp_author')
  end
  
end
