class VacationsController < ApplicationController
  class VacationsController < ApplicationController
   def new
     @vacation = Vacation.new
   end

   def show
     @user = User.find_by id: params[:id]
     @photo = Photo.find_by vacation_id: params[:id]
   end

   def create
     @vacation = Vacation.new
     @vacation.user_id = @current_user.id
     @vacation.name = params[:vacation][:name]
     if @vacation.save
       redirect_to new_vacation_photos_path(vacation_id: @vacation.id)
     else
       render :new
     end
   end

   def edit
   end
 
   def update
   end

 end
end
