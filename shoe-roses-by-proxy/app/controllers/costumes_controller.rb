class CostumesController < ApplicationController
  #before_action :set_costume, only: [:show, :new, :create, :edit, :update, :destroy]

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
  #  redirect_to costume_path (@costume)
   respond_to do |f|
     f.html { redirect_to costume_path(@costume)}
     f.json {render json: {name: @costume.name, number_of_pieces: @costume.number_of_pieces, period: @costume.period, theater: @costume.theater}
   }
   end
 end

 def edit
   @costume = Costume.find_by(id: params[:id])

 end

 def update
   @costume = Costume.find_by(id: params[:id])
   @costume.update(costume_params)
   redirect_to costume_path(@costume)
 end

 def destroy
   @costume = Costume.find_by(id: params[:id])
   @costume.destroy
   redirect_to costume_path
 end

 private

 def set_painting
   @costume = Costume.find_by(id: params[:id])
 end

  def costume_params
   params.require(:costume).permit(:period_id, :theater_id, :name, :number_of_pieces)
  end


end
