class VisitorsController < ApplicationController
  def index
    if params[:sort] == 'alphabetical'
      @products = Product.alphabetical
    else
      @products = Product.all
    end
  end
end
