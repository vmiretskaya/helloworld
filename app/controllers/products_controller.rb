class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate_user!
  respond_to :json, :html

  # GET /products
  # GET /products.json
  def index
    #@products = Product.all
    #@products = Product.limit(3)
    
    if params[:q]
      search_term = params[:q]
     # @products = Product.where("name LIKE ?", "%#{search_term}%")
     
     if Rails.env.development? #checks to see if in dev mode
        @products = Product.where("name LIKE ?", "%#{search_term}%").paginate(:page => params[:page], :per_page => 9)
      else
        @products = Product.where("name ilike ?", "%#{search_term}%").paginate(:page => params[:page], :per_page => 9)
      end

    else
     # @products = Product.all
      @products = Product.all.paginate(page: params[:page], per_page: 9)
    end
    respond_with @products
  end

  # GET /products/1
  # GET /products/1.json
  def show
    #@comments = @product.comments.order("created_at DESC")
    @comments = @product.comments.all.order("created_at DESC").paginate(page: params[:page], per_page: 3)
#byebug
    @colors = @product.colors;
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
     @all_colors = all_colors;
     @prod_colors = @product.colors;
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        update_create_prod_colors(@product.id, params[:selectedcolors]) 
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        #update products_colors table
        #byebug
        update_create_prod_colors(@product.id, params[:selectedcolors])  

        #
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
          params.require(:product).permit(:name, :description, :image_url, :color, :price)
    end

    def update_create_prod_colors(prod_id, new_sel_colors)      
      @product.colors.delete_all;
      new_sel_colors.each do |nsc|
       cur_color = all_colors.find(nsc);
       @product.colors<<(cur_color);
      end
    end  
end
