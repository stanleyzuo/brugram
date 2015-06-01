class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id]) 
  end

  def update
      @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      redirect_to @photo
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
   @photo.destroy
    redirect_to photos_path
  end

  def create 
    @photo = Photo.create(photo_params)
       if @photo.save
        ## add method to parse for hashtags
        array = @photo.caption.split(//)
        value = ""
        string = ""
        array.each_with_index do |char, index|
          if value == "#" 
            
            string << char
          end
          if char == "#"
            value = "#"
            #create the hashtag
          elsif ((index == array.size - 1) || char == "." || char == "," || char == " " ) && value == "#"
            #if hashtag already exists, don't create a new hashtag
            hashtag = Hashtag.where(text: string).first_or_create()
            story = @photo
            story.hashtags << hashtag
            story.save

            string = ""
            value = ""
          end
    
        end

        redirect_to @photo
      else
        render 'new'
     end
  end

  def new 
    @photo = Photo.new
  end

  private
  def photo_params
      params.require(:photo).permit(:avatar, :caption)
  end
end
