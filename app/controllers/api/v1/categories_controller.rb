class Api::V1::CategoriesController < ApplicationController
  # GET /api/v1/categories
  def index
    @categories = Category.all.user(get_current_user.id)
  end

  # POST /api/v1/categories
  def create
  end

  # PUT /api/v1/categories/:id
  def update
  end

  # DELETE /api/v1/categories/:id
  def destroy
  end
end
