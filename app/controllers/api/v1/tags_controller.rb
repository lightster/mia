class Api::V1::TagsController < ApplicationController
  # GET /api/v1/tags.json
  def index
    @tags = Tag.all.user(get_current_user.id)
  end
end