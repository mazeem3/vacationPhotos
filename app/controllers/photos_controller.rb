class PhotosController < ApplicationController
  def loc_iq
    response = Http.get("http://locationiq.org/v1/search.php?key=d1e024fcce6322e1a702&format=json&q=#{@photo.location}")
  end


    def new
        @photo = Photo.new
    end

    def create
        @photo = Photo.new
        @photo.vacation_id = params[:vacation_id]

        @photo.location = params[:photo][:location]
        @photo.user_id = @current_user.id

        response = loc_iq
        results = JSON.parse(response.body)

        @photo.latitude = results.first['lat']
        @photo.longitude = results.first['lon']

        @photo.photo = params[:photo][:photo]

        if @photo.save
            redirect_to user_path(id: @current_user.id)
        else
            render :new
        end
    end

    def edit
        @vacation = Vacation.find_by id: params[:id]
        @photo = Photo.find_by vacation_id: params[:vacation_id]
    end

    def update
        @photo = Photo.find_by vacation_id: params[:vacation_id]
        @photo.location = params[:photo][:location]
        @photo.user_id = @current_user.id

        response = loc_iq
        results = JSON.parse(response.body)

        @photo.latitude = results.first['lat']
        @photo.longitude = results.first['lon']
        @photo.photo = params[:photo][:photo]
        if @photo.save
            redirect_to user_path(id: @current_user.id)
        else
            render :edit
      end
    end

    def delete
        Photo.find_by vacation_id: params[:vacation_id].delete
        redirect_to user_path(id: @current_user.id)
      end
end
