class Staff::EstheMenusController < ApplicationController
    before_action :set_esthe_menu, only: [:show, :edit, :update, :destroy]

    def index
      @esthe_menus = EstheMenu.all
    end

    def show
    end

    def new
      @esthe_menu = EstheMenu.new
    end

    def edit
    end

    def create
      @esthe_menu = EstheMenu.new(esthe_menu_params)
      if @esthe_menu.save
        redirect_to staff_esthe_menu_path(@esthe_menu), notice: 'エステメニューは正常に作成されました。'
      else
        render :new
      end
    end

    def update
      if @esthe_menu.update(esthe_menu_params)
        redirect_to staff_esthe_menu_path(@esthe_menu), notice: 'エステメニューは正常に更新されました。'
      else
        render :edit
      end
    end

    def destroy
      if @esthe_menu.destroy
        redirect_to staff_esthe_menus_path, notice: 'エステメニューは正常に削除されました。'
      else
        redirect_to staff_esthe_menus_path, alert: '予約がはいっているため削除できません。'
      end
    end

    private

      def set_esthe_menu
        @esthe_menu = EstheMenu.find(params[:id])
      end

      def esthe_menu_params
        params.require(:esthe_menu).permit(:name, :time_frame, :description, :price)
      end

  end
