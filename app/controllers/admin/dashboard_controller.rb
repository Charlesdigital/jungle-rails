class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['PASSWORD'], except: :index
  def show
    @product_total = Product.count
    @category_total = Category.count
  end
end
