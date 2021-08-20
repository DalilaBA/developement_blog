class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end 

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        # render plain: params[:article]
        @article =  Article.new(params.required(:article).permit(:title, :description))
        # render plain: @article.inspect
        if @article.save
        # redirect_to article_path(@article)#rails will automaticlly retreive the ID from the object article
          flash[:notice] = "Article was created successfully."
          redirect_to @article #will have the same effect that above
        else 
          render 'new'
        end
    end
end 