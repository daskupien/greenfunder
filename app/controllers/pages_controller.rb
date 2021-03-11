class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
    @projects = Project.all

    @markers = @projects.geocoded.map do |project|
      {
        lat: project.latitude,
        lng: project.longitude,
        image_url: helpers.asset_url('https://res.cloudinary.com/rentmylife/image/upload/v1614858978/assets/tree-1578_t6y8ak.png')
      }
    end
  end

  def about
  end
end
