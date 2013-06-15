class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all

    respond_to do |format|
      format.html
      format.json do
        render json: @schedules
      end
    end
  end

end