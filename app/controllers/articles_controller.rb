class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :reqire_user, except: [:show, :index, :destroy]
  before_action :require_own_user, only: [:edit, :update, :destroy]

    def show
    end 

    def index
        # @articles = Article.all
        @articles = Article.paginate(page: params[:page], per_page: 3)
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
      # render plain: params[:article]
       @article =  Article.new(article_params)
      #associate all the articles in the DB and the futur new one with the first user recorded
        @article.user = current_user
      # render plain: @article.inspect
      if @article.save
      # redirect_to article_path(@article)#rails will automaticlly retreive the ID from the object article
        flash[:notice] = "Article was created successfully."
        redirect_to @article #will have the same effect that above
      else 
          render 'new'
      end
    end

    def update
    if @article.update(article_params)
      # redirect_to article_path(@article)#rails will automaticlly retreive the ID from the object article
        flash[:notice] = "Article was updated successfully."
        redirect_to @article #will have the same effect that above
      else 
          render 'edit'
      end
    
    end
    def destroy
      @article.destroy
      redirect_to @article
    end
    
    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.required(:article).permit(:title, :description)
    end
end 