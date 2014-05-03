class Api::V1::TimeLogsController < ApplicationController
  def index
    @time_logs = TimeLog.all.user(get_current_user.id)
  end

  def create
    @time_log = TimeLog.new(params.permit(:user_id, :category_id, :description, :date, :rounded_minutes, :actual_seconds, :timer_enabled))

    if @time_log.save
      render json: @time_log, status: :created
    else
      render json: @time_log.errors, status: :unprocessable_entity
    end
  end

  def update
  end

  def delete
  end
end
