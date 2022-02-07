class CategoriesController < ApplicationController
    def index
        @categories = Categories.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new
    end
end