class ProductsController < ApplicationController
  before_action :set_categories
  
  def index
    @products = Product.all
    @pagy, @records = pagy(@products, items: 10)
    @products = if @order && @order == 'Name: A to Z'
                  @products.title_a_to_z
                elsif @order && @order == 'Name: Z to A'
                  @products.title_z_to_a
                elsif @order && @order == 'Price: High to Low'
                  @products.price_high_to_low
                elsif @order && @order == 'Price: Low to High'
                  @products.price_low_to_high
                else
                  @products.order(title: :asc)
                end
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

  def search
    @products = Product.where('title LIKE?', "%" + params[:q] + "%")
    @pagy, @records = pagy(@products, items: 10)
  end

  def search_by_price
    @products = Product.where('price >= ?', params[:min])
    @products = Product.where('price <= ?', params[:max])
    @pagy, @records = pagy(@products, items: 10)
  end

  def search_by_category
    @category = Category.find(params[:id])
    @products = @category.products
  end

  private

  def product_params
    params.require(:product).permit(:title, :content, :image, :price, :category_id)
  end

  def set_categories
    @categories = Category.all
  end

end