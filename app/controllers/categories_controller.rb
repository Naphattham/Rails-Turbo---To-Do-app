class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to home_index_path, notice: 'Category created successfully.'
      else
        render :index
      end
    end
  
    def destroy
        @category = Category.find(params[:id])
        if @category.destroy
          redirect_to home_index_path, notice: 'Category deleted successfully.'
        else
          redirect_to categories_path, alert: 'Failed to delete category.'
        end
      end
      
    private
  
    def category_params
      params.require(:category).permit(:name)
    end
  end
  