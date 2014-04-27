class Api::V1::TagsController < ApplicationController
  # GET /api/v1/users/:user_id/tags.json
  def index
    @tags = Tag.all.user(params[:user_id])
  end
end