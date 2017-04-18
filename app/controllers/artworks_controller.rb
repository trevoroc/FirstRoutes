class ArtworksController < ApplicationController

  def index
    render json: Artwork.all
  end

  def show
    begin
      render json: Artwork.find(params[:id])
    rescue
      render text: 'Artwork not found', status: 404
    end
  end

  def create
    if User.exists?(artwork_params[:artist_id])
      @artwork = Artwork.new(artwork_params)
      if @artwork.save
        render json: @artwork
      else
        render json: @artwork.errors.full_messages, status: :unprocessable_entity
      end

    else
      render text: "User doesn't exist", status: 404
    end

  end

  def update
    artwork_args = artwork_params.reject { |k, _| k == "artist_id" }

    begin
      @artwork = Artwork.find(params[:id])
      @artwork.update(artwork_args)
      render json: @artwork
    rescue
      render text: "Artwork doesn't exist", status: 404
    end
  end

  def destroy
    begin
      artwork = Artwork.find(params[:id])
      artwork.destroy
      render json: artwork
    rescue
      render text: "Artwork doesn't exist", status: 404
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
