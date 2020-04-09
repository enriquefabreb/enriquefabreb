class KeywordsController < ApplicationController


  def index

  end

  def create
    @category = Category.find(params[:category_id])
      if  @category.keywords.exists?(:description =>params[:description])
        redirect_to categories_path
      else
        @keywords = @category.keywords.create(keyword_params)
        redirect_to category_path(@category)
      end
  end

  def update
    @category = Category.find(params[:category_id])
    @keywords = @category.keywords.find(params[:id])
      if @keywords.update(keyword_params)
        redirect_to edit_category_path(@category)
      else
        render :edit
      end
  end

  def add
    @keyword = Keyword.new
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @keyword = @category.keywords.find(params[:id])
    @keyword.destroy
    redirect_to categories_path
  end

  def show
    @category = Category.find(params[:category_id])
    @keyword = @category.keywords.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @keyword = @category.keywords.find(params[:id])
  end

  private
    def keyword_params
      params.require(:keyword).permit(:description, :category_id)
    end
end
