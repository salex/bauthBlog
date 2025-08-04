class Blog::Articles::ViewerController < ApplicationController
  layout "blog"

  before_action :set_article, only: %i[ show ]
  before_action :valid, only:%i[ show]
  allow_unauthenticated_access(only: [:index, :show])

  def index
    if params[:category].present?
      @category = params[:category]
      @articles = Article.where(category:params[:category]).order(:date).reverse
      if @articles.blank?
        redirect_to blog_path, alert:"No article found with category: #{@category}"
      end
    else
      @articles = Article.all.order(:date).reverse
    end
  end

  def show
    # something cool is probably happening here
  end

  private

  def valid
    spre = @article.content.scan('s```')
    epre = @article.content.scan('e```')
    if spre.size != epre.size
      begin
        raise StandardError
      rescue
        redirect_to root_path, alert: "Article not valid... unmatched code s``` or e``` tags"
      end
    end
  end


  def set_article
    begin
      @article = Article.find(params.expect(:id))
      rescue StandardError => e
        redirect_to root_path, alert: "Article not found..."
    end
  end

end
# end