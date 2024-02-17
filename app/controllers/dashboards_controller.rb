class DashboardsController < ApplicationController
    def show
      @events = Event.all
    end
  end