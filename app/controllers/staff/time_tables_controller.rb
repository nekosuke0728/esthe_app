class Staff::TimeTablesController < ApplicationController
    before_action :set_time_table, only: [:show, :edit, :update, :destroy]

    def index
      @time_tables = TimeTable.page(params[:page]).per(25)
                              .order({ select_date: :desc }, { time_frame: :desc })
    end

    def show
    end

    def new
      @time_table = TimeTable.new
    end

    def edit
    end

    def create
      @time_table = TimeTable.new(time_table_params)
      if @time_table.save
        redirect_to staff_time_tables_path, notice: 'タイムテーブルは正常に作成されました'
      else
        render :new
      end
    end

    def update
      if @time_table.update(time_table_params)
        redirect_to staff_time_tables_path, notice: 'タイムテーブルは正常に更新されました'
      else
        render :edit
      end
    end

    def destroy
      if @time_table.destroy
        redirect_to staff_time_tables_path, notice: 'タイムテーブルは正常に削除されました'
      else
        redirect_to staff_time_tables_path, alert: '予約があるため削除できません'
      end
    end

    private

      def set_time_table
        @time_table = TimeTable.find(params[:id])
      end

      def time_table_params
        params.require(:time_table).permit(:select_date, :time_frame)
      end

end
