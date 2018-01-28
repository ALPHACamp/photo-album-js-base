class Api::V1::PhotosController < ApiController

  # GET http://localhost:3000/api/v1/photos
  def index
    @photos = Photo.all
    render json: {
      data: @photos.map do |photo|
        {
          title: photo.title,
          date: photo.date,
          description: photo.description
        }
      end
    }
  end

  # GET http://localhost:3000/api/v1/photos/:id
  def show
    @photo = Photo.find_by(id: params[:id])
    if !@photo
      render json: {
        message: "Can't find the photo!",
        status: 400
      }
    else
      render json: {
        title: @photo.title,
        date: @photo.date,
        description: @photo.description
      }
    end
  end

  # POST http://localhost:3000/api/v1/photos
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      render json: {
        message: "Photo created successfully!",
        result: @photo
      }
    else
      render json: {
        errors: @photo.errors
      }
    end
  end

  # PATCH http://localhost:3000/api/v1/photos/:id
  def update
    @photo = Photo.find_by(id: params[:id])
    if @photo.update(photo_params)
      render json: {
        message: "Photo updated successfully!",
        result: @photo
      }
    else
      render json: {
        errors: @photo.errors
      }
    end
  end

  # DELETE http://localhost:3000/api/v1/photos/:id
  def destroy
    @photo = Photo.find_by(id: params[:id])
    @photo.destroy
    render json: {
      message: "Photo destroy successfully!"
    }
  end

  private

  def photo_params
    params.permit(:title, :date, :description, :file_location)
  end

end
