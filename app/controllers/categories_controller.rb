class CategoriesController < ApplicationController
  before_action :set_category, only: [ :show, :edit, :update ]
  before_action :authorize_category, only: [ :show, :edit, :update ]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      redirect_to @category, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @category
  end

  def update
    authorize @category
    if @category.update(category_params)
      redirect_to @category, notice: "Category was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon, :color_class)
  end

  def authorize_category
    authorize @category
  end
end
