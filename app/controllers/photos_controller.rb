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
  def create
  input_image = params.fetch("query_image")
  input_caption= params.fetch("query_caption")
  input_owner_id = params.fetch("query_owner_id")
  new_photo = Photo.new
  new_photo.image = input_image
  new_photo.caption = input_caption
  new_photo.owner_id = input_owner_id
  new_photo.save
  redirect_to("/photos/"+new_photo.id.to_s)
  end
  def update
    update_image = params.fetch("query_image")
    update_caption = params.fetch("query_caption")
    update_id = params.fetch("modifiy_id")
    the_photo = Photo.where(id: update_id).first
    the_photo.image = update_image
    the_photo.caption = update_caption
    the_photo.save
    redirect_to("/photos/"+the_photo.id.to_s)
  end
  def comment
    photo_id = params.fetch("input_photo_id")
    puts photo_id
    author_id = params.fetch("input_author_id")
    body = params.fetch("input_comment")
    new_comment = Comment.new
    new_comment.photo_id = photo_id
    new_comment.author_id = author_id
    new_comment.body = body
    new_comment.save
    redirect_to("/photos/"+photo_id)
  end
end
