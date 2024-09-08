class VolunteerHoursController < ApplicationController
  def index
    @volunteer_hours = VolunteerHour.all
    render :index
  end
end
