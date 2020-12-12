class GlamsController < ApplicationController
  before_action :set_glam, only: [:show, :update, :destroy]

  # GET /glams
  def index
    if params[:artist_id]
      @artist = Artist.find(params[:artist_id])
      @glams = @artist.glams
    else
      @glams = Glam.all
    end
  end

  # GET /glams/1
  def show
    render json: @glam
  end

  # POST /glams
  def create
    @glam = Glam.new(glam_params)

    if @glam.save
      render json: @glam, status: :created, location: @glam
    else
      render json: @glam.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /glams/1
  def update
    if @glam.update(glam_params)
      render json: @glam
    else
      render json: @glam.errors, status: :unprocessable_entity
    end
  end

  # DELETE /glams/1
  def destroy
    @glam.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glam
      @glam = Glam.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def glam_params
      params.require(:glam).permit(:glam_squad, :makeup, :hair, :wardrobe, :artist_id)
    end
end
