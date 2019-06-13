class HomeController < ApplicationController
  def index
    render plain: "meep\n"
  end
end
