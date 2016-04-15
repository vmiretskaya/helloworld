class ColorsController < ApplicationController
  before_action :set_color, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate_user!
  respond_to :json, :html

  def index
  	@colors = Color.all;
  end

  def edit
  end

  def new
  	@color = Color.new 
  end

   def create
    @color = Color.new(color_params)

    respond_to do |format|
      if @color.save
        format.html { redirect_to @color, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @color }
      else
        format.html { render :new }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  	@color = Color.find(params[:id]);
  end

 def update
    respond_to do |format|
      if @color.update(color_params)
        format.html { redirect_to @color, notice: 'Color was successfully updated.' }
        format.json { render :show, status: :ok, location: @color }
      else
        format.html { render :edit }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_color
      @color = Color.find(params[:id])
    end
  def color_params
    params.require(:color).permit(:hexcolor)
  end

end
