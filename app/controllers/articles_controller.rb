class ArticlesController < ApplicationController
  
   def show
     #byebug
     @article = Article.find(params[:id])
   end

   def index 
      @articles = Article.all
   end
  
   def new 
    @article = Article.new
   end
 
   def edit 
   # byebug
    @article = Article.find(params[:id])
   end


   def create
    #render plain: params[:article]
    #@article = Article.new(params[:article])
     @article = Article.new(params.require(:article).permit(:title, :description)) 
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
    @article = Article.find(params[:id])
                   #white liat it !
   if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Aricle was updated successfully"
      redirect_to @article
   else 
      render 'edit'
   end
  end

end    