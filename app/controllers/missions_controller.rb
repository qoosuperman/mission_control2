class MissionsController < ApplicationController
  before_action :find_mission, only: [:edit, :update, :destroy]
  before_action :check_login

  def index
    @q = Mission.ransack(params[:q])
    @missions = @q.result.where(user_id: current_user.id).order("#{order_params} desc").page(params[:page])
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = current_user.missions.build(mission_params)
    if @mission.save
      redirect_to root_path, notice: t("notice.create_mission_success")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @mission.update(mission_params)
      redirect_to root_path, notice: t("notice.update_success")
    else
      render :edit
    end
  end

  def destroy
    if @mission.destroy
      redirect_to root_path, notice: t("notice.delete_success")
    else
      redirect_to root_path, notice: t("notice.delete_fail")
    end
  end


  private
  def find_mission
    @mission = Mission.find_by(id: params[:id])
  end

  def mission_params
    params.require(:mission).permit(:title, :priority, :category, :start_time, :end_time, :user_id)
  end

  def order_params
    whitelist = %w[created_at end_time priority]
    if params[:order_by].in?(whitelist)
      params[:order_by]
    else
      "created_at"
    end 
  end

  def check_login
    redirect_to signin_path unless signed_in?
  end
end
