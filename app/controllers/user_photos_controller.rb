class UserPhotosController < ApplicationController
  def index
    @flickr = Flickr.new(
      Rails.application.credentials.dig(:flickr, :flickr_key),
      Rails.application.credentials.dig(:flickr, :flickr_secret)
    )

    @photos = @flickr.photos.getRecent
  end
end
