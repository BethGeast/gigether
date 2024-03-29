class SelectedArtistsController < ApplicationController
  def new
    @selected_artist = SelectedArtist.new
    authorize @selected_artist
  end

  def create
    @artist_ids = selected_artist_params[:artist]
    @profile = current_user.profile
    authorize @selected_artist
    @artist_ids.each do |artist_id|
      SelectedArtist.create(artist_id: artist_id, profile: @profile)
    end
    redirect_to artists_path
  end

  def index
    @selected_artists = SelectedArtist.where(profile_id: params[:profile_id])
    @list = []
    @selected_artists.each do |art_id|
      @list << Artist.find(art_id.artist_id)
    end
  end

  private

  def selected_artist_params
    params.require(:selected_artist).permit(artist: [])
  end
end
