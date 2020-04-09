class CategoriesController < ApplicationController


  def index
      @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def new_release
    @category = Category.new
    @category.keywords.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @category= Category.new(category_params)
        if @category.save
          flash[:notice] = "Successfully created category and keywords"
          redirect_to categories_path
      else
          respond_to do |format|
            format.html
            format.js
          end
      end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end



  def update
    params[:category][:existing_keyword_attributes] ||= {}

    @category = Category.find(params[:id])
      if @category.update(category_params)
        flash[:notice] = "Successfully updated category and keywords"
        redirect_to categories_path
      else
        respond_to do |format|
          format.html
          format.js
        end
      end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name, existing_keyword_attributes: [:id, :description], new_keyword_attributes: [:description, :category_id])
    end
end
