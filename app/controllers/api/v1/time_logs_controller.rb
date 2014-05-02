class Api::V1::TimeLogsController < ApplicationController
  def index
    @time_logs = TimeLog.all.user(get_current_user.id)
  end

  def create
  end

  def update
  end

  def delete
  end
end
