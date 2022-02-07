class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def show
        @product = Product.find(params[:id])
    end

    def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path(@product), notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

    private

    def product_params
      params.require(:product).permit(:title, :content, :image, :price, :category_id)
    end

    
end