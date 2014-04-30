class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:update]

  # GET /api/v1/categories
  def index
    @categories = Category.all.user(get_current_user.id)
  end

  # POST /api/v1/categories
  def create
  end

  # PUT /api/v1/categories/:id
  def update
    @category.update(params.permit(:title, :time_increment))
    @category
  end

  # DELETE /api/v1/categories/:id
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find_by! id: params[:id], user_id: get_current_user.id
    end
end
