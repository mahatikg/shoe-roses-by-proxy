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
      @pcostumes = Costume.all
    end

    def create
      @period = Period.create(period_params)
      redirect_to new_period_path
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
      redirect_to welcome_path
    end

    private

    def set_artist
      @period = Period.find(params[:id])
    end

    def period_params
      params.require(:period).permit(:name, :life_span, :contemporary?)
    end

end
