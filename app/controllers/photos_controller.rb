class PhotosController < ApplicationController

  def index
    @list_of_photos = Photo.all.order({ :created_at => :desc})

    render({ :template => "photo_templates/index"})    
  end

  def show
    url_id = params.fetch("path_id")
    @the_photo = Photo.where({ :id => url_id}).at(0)

    if @the_photo == nil
      redirect_to("/404")
    else
      render({:template => "photo_templates/show"})
    end
  end

  def delete
    photo_id = params.fetch("photo_id")
    photo_delete = Photo.where({ :id => photo_id}).at(0)

    photo_delete.destroy

    redirect_to("/photos")
  end

  def update
    # {"input_image"=>"A", "input_caption"=>"B", "update_id"=>"785"}
    
  end

  def insert
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")

    new_photo = Photo.new

    new_photo.image = input_image
    new_photo.caption = input_caption
    new_photo.owner_id = input_owner_id

    new_photo.save

    redirect_to("/photos/" + new_photo.id.to_s)

  end

end
