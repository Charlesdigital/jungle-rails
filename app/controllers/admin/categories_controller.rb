class Admin::CategoriesController < ApplicationController
    http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['PASSWORD'], except: :index

    def index
      @categories = Category.order(id: :asc).all

    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to [:admin, :categories], notice: 'Created!'
      else
        render :new
      end
    end

    def category_params
      params.require(:category).permit(
        :name
      )
    end

end