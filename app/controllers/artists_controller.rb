class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update, :destroy]

  # GET /artists
  def index
    @artists = Artist.all

    render json: @artists.as_json(include: {glams: {only:[:id, :glam_squad, :makeup, :hair, :wardrobe, :artist_id]}})
  end

  # GET /artists/1
  def show
    render json: @artist.as_json(include: {glams: {only:[:id, :glam_squad, :makeup, :hair, :wardrobe, :artist_id]}})
  end

  # POST /artists
  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      render json: @artist.as_json(include: {glams: {only:[:id, :glam_squad, :makeup, :hair, :wardrobe]}}), status: :created, location: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artists/1
  def update
    if @artist.update(artist_params)
      render json: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artists/1
  def destroy
    @artist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artist_params
      params.require(:artist).permit(:name, :gender, :age, :height, :image, glams_attributes: [:glam_squad,:makeup, :hair, :wardrobe, :artist_name])
    end
end
