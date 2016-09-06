class PeriodsController < ApplicationController
  #before_action :set_period, only: [:show]

    def new
      @period = Period.new
    end

    def index
      @periods = Period.all
    end

    def show
      @period = Period.find_by(id: params[:id])
      @costumes = Costume.all
    end

    def create
      @period = Period.create(period_params)
      respond_to do |f|
        f.html { redirect_to periods_path}
        f.json {render json: {name: @period.name, time_period: @period.time_period}
      }
      end
    end

    def edit
      @period = Period.find_by(id: params[:id])
    end

    def update
      @period = Period.find_by(id: params[:id])
      @period.update(period_params)
      redirect_to period_path(@period)
    end

    def destroy
      @period = Period.find_by(id: params[:id])
      @period.destroy

    end

    private

    def set_artist
      @period = Period.find(params[:id])
    end

    def period_params
      params.require(:period).permit(:name, :time_period)
    end

end
