class ArticlesController < ApplicationController
  
   before_action :set_article, only: [:show, :edit, :update, :destroy]


   def show
     #byebug
   end

   def index 
      @articles = Article.all
   end
  
   def new 
    @article = Article.new
   end
 
   def edit 
   # byebug
   end

   def create
    #render plain: params[:article]
    #@article = Article.new(params[:article])
     @article = Article.new(article_param) 
     #render plain: @article.inspect
     # redirect_to article_path(@article)
     if @article.save 
      flash[:notice] = "Article war created successfully."
      redirect_to @article 
     else
      render 'new'
     end 
    end

  def update
                   #white liat it !
   if @article.update(article_param)
      flash[:notice] = "Aricle was updated successfully"
      redirect_to @article
   else 
      render 'edit'
   end
  end

  def destroy 
  #  byebug
   @article.destroy
   redirect_to articles_path
  end


  private 

  def set_article
    @article = Article.find(params[:id])
  end

  def article_param
    params.require(:article).permit(:title, :description)
  end


end    