class TheatersController < ApplicationController
  # before_action :set_theater, only: [:show]


      def new
        @theater = Theater.new
      end

      def index
        @theaters = Theater.all
      end

      def show
        @theater = Theater.find_by(id: params[:id])
        @periods = Period.all
      end

      def create
        @theater = Theater.create(theater_params)
        respond_to do |f|
          f.html { redirect_to theaters_path}
          f.json {render json: {name: @theater.name, city: @theater.city}
        }
        end
      end

      def edit
        @theater = Theater.find_by(id: params[:id])
      end

      def update
        @theater = Theater.find_by(id: params[:id])
        @theater.update(theater_params)
        redirect_to theater_path(@theater)
      end

      def destroy
        @theater = Theater.find_by(id: params[:id])
        @theater.destroy

      end

      private

      def set_theater
        @theater = Theater.find(params[:id])
      end

      def theater_params
        params.require(:theater).permit(:name, :city)
      end

  end
