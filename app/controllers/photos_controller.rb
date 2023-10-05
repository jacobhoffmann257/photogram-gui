class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({created_at: :asc})
      render ({template: "photo_templates/index"})
  end
  def show
    id = params.fetch("path_id")
    @photo = Photo.where({id: id}).first
    render({template: "photo_templates/show"})
  end
  def delete
    id = params.fetch("path_id")
    photo = Photo.where({id: id}).first
    photo.destroy
    redirect_to("/photos")
  end
end
