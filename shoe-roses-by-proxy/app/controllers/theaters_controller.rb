class TheatersController < ApplicationController
  before_action :set_theater, only: [:show]

    def index
      @theaters = Theater.all
    end

    def show
      # binding.pry
      @theater = Theater.find_by(id: params[:id])
      @costumes = Costume.all
    end

    private

    def set_theater
      @theater = Theater.find(params[:id])
    end

end
