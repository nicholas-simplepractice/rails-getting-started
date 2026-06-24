class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index show ]

  def index
    @products = Product.all
  end

  def show
    # Implicit call to set_product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Implicit call to set_product
  end

  def update
    # Implicit call to set_product
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    # This private method 'expects' the product parameters to match the key literals
    #   and have the structure of a hash table/map
    def product_params
      # This is Rails 8's cleaner replacement for the older version below:
      # `params.require(:product).permit(:name, :description)`
      params.expect(product: [ :name, :description ])
    end
end
