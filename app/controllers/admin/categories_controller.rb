class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
    def index
      @categories = Category.all
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to [:admin, :categories], notice: 'Category created!'
      else
        render :new
      end
    end
  
    def show
      @category = Category.find(params[:id])
      @products = @category.products.order(created_at: :desc)
    end
  
    private
  
    def category_params
      params.require(:category).permit(
        :name
      )
    end
  end