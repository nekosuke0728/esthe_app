class User::EstheMenusController < ApplicationController

  def index
    @esthe_menus = EstheMenu.all
  end

end
