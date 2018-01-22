class PairsController < ApplicationController
  def index
    @pairs = Pair.page(params[:page] || 1)
  end

  def show
    @pair = Pair.find(params[:id])
    @rates = @pair.ticks.last
  end

  def history
    @pair = Pair.find(params[:id])
    @day_rates = @pair.day_rates
  end
end
