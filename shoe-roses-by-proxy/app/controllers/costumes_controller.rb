class CostumesController < ApplicationController
  #before_action :set_painting, only: [:show, :new, :create, :edit, :update, :destroy]

 def new
   @costume = Costume.new
 end

 def index
   @costumes = Costume.all
 end

 def show
   @costume = Costume.find_by(id: params[:id])
 end

 def create
   @costume = Costume.create(costume_params)
   redirect_to costume_path(@costume)
 end

 def edit
   @costume = Costume.find_by(id: params[:id])
   #for our view we had to change from collection_check_boxes
   #to collection_radio_buttons simply to avoid a undefined method to_i error
   #unsure why this internal method within the collection_check_boxes is causing errors
 end

 def update
   @costume = Costume.find_by(id: params[:id])
   @costume.update(costume_params)
   #we have to use to_i on the gallery and artist because we are pretty sure
   #radio_buttons converts everything to a string and it wasn't updating id numbers
   #that were strings. this makes sense since we got a to_i error with check_boxes prior

   redirect_to painting_path(@costume)
 end

 def destroy
   @costume = Costume.find_by(id: params[:id])
   @gallery = @costume.gallery
   @costume.destroy
   redirect_to gallery_path(@gallery)
 end

 private

 def set_painting
   @costume = Costume.find_by(id: params[:id])
 end

  def costume_params
   params.require(:costume).permit(:period_id, :theater_id, :title, :num_pieces)
  end

  
end
