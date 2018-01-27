class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render :action => :new
    end
  end

  def show
    set_photo
  end

  def edit
    set_photo
  end

  def update
    set_photo
    if @photo.update(photo_params)
      redirect_to photo_path(@photo)
    else
      render :action => :edit
    end
  end

  def destroy
    set_photo
    @photo.destroy

    redirect_to photos_path
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :date, :description, :file_location)
  end
end
