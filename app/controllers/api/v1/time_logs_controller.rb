class Api::V1::TimeLogsController < ApplicationController
  before_action :set_time_log, only: [:update, :destroy]

  def index
    @time_logs = TimeLog.all.user(get_current_user.id)
  end

  def create
    @time_log = TimeLog.new(time_log_params.merge!(
      :user_id => get_current_user.id
    ))

    if @time_log.save
      render json: @time_log, status: :created
    else
      render json: @time_log.errors, status: :unprocessable_entity
    end
  end

  def update
    if @time_log.update(time_log_params)
      render json: @time_log, status: :ok
    else
      render json: @time_log.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @time_log.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_log
      @time_log = TimeLog.find_by! id: params[:id], user_id: get_current_user.id
    end

    def time_log_params
      new_params = params.permit(
        :category_id,
        :description,
        :date,
        :rounded_minutes,
        :actual_seconds,
        :timer_enabled
      )
      new_params.merge!(
        :tags => params[:tags].collect do |tag_title|
          Tag.where(title: tag_title).first_or_create
        end
      )
      new_params
    end
end
