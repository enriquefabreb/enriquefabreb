class StoresController < ApplicationController
  
  def index
    @stores = Store.all
  end

  def new
    @stores = Store.new
  end

  def create
    @stores= Store.new(store_params)
    if @stores.save
        redirect_to stores_path
    else
        render :new
    end
  end

  def destroy
    @stores = Store.find(params[:id])
    @stores.destroy
    redirect_to stores_path
  end

  def show
    @stores = Store.find(params[:id])
  end

  def edit
    @stores = Store.find(params[:id])
  end

  def update
    @stores = Store.find(params[:id])
      if @stores.update(store_params)
        redirect_to stores_path
      else
        render :edit
      end
  end

  private
    def store_params
      params.require(:store).permit(:name, :street, :number, :zip_code, :city, :country, product_ids:[])
    end
end
