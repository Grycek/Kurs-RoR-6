class PlaylistsController < ApplicationController

    before_filter :authenticate_user!, :except => [:index, :search]
    attr_reader :per_page
    #@@per_page = 3
    
    
    def index
        @playlists  = Playlist.all
        @playlists  = @playlists.paginate(:page => params[:page], :per_page => 2)
    end
    
    def new
        @playlist = Playlist.new
    end
    
    def create
      @playlist = Playlist.new(params[:playlist])
      @playlist.update_attributes(:user_id => current_user.id)
      if @playlist.save
          redirect_to playlists_path
      else
          render :action => :new
      end
    end
    
    def search
        @playlists         = Playlist.search( params[:search] )
        #@playlists      = @search.paginate(:page => params[:page], :per_page => 2)
    end
    
    def show
    end
    
end
