class UserPhotosController < ApplicationController
  def index
    @flickr = Flickr.new(
      Rails.application.credentials.dig(:flickr, :flickr_key),
      Rails.application.credentials.dig(:flickr, :flickr_secret)
    )
    @recent_photos = @flickr.photos.getRecent
    @user_id = params[:user_id] if params[:user_id]

    @user_photos = @flickr.people.getPhotos(user_id: @user_id) if @user_id
  end
end
