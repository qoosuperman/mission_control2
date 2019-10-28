class MissionsController < ApplicationController
  before_action :find_mission, only: [:edit, :update, :destroy]

  def index
    #之後會用分頁處理，目前先用 all 跑出全部資料
    @missions = Mission.all
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    #因為還沒建後台，先建一個 user 把 mission 都丟給他
    @mission.user = User.first
    if @mission.save
      redirect_to root_path, notice: "新增任務成功！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @mission.update(mission_params)
      redirect_to root_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    if @mission.destroy
      redirect_to root_path, notice: "刪除成功"
    else
      redirect_to root_path, notice: "刪除失敗"
    end
  end


  private
  def find_mission
    @mission = Mission.find_by(id: params[:id])
  end
  def mission_params
    params.require(:mission).permit(:title, :priority, :category, :start_time)
  end
end
