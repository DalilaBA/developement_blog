class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end 

    def index
        @articles = Article.all
    end

    def new
        @article 
    end

    def create
        # render plain: params[:article]
        @article =  Article.new(params.required(:article).permit(:title, :description))
        # render plain: @article.inspect
        @article.save
        # redirect_to article_path(@article)#rails will automaticlly retreive the ID from the object article
        redirect_to @article #will have the same effect that above
    end
end 