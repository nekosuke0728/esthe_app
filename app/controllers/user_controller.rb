class UserController < ApplicationController
  def top
  end

  def access
    @salon = Salon.find(1)
    @hash = Gmaps4rails.build_markers(@salon) do |salon, marker|
      marker.lat salon.latitude
      marker.lng salon.longitude
      marker.infowindow salon.name
    end
  end
end
