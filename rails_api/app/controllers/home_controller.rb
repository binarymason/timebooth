class HomeController < ApplicationController
  def index
    render json: { thing_count: Thing.count, things: Thing.all }
  end
end
