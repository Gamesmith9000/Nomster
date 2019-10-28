class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
  #  @place.photos.create(photo_params)
#above line was :     
@place.photos.create(photo_params.merge(user: current_user))
# but could not resolve error    
    redirect_to place_path(@place)
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :photo_id, :picture)
  end

end
