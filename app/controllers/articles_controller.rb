class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    flashit unless can?(:index,:article)
    # @articles = Current.user.articles #Article.all
    if params[:category].present?
      if params[:category] == 'my'
        @articles = Article.where(user_id:Current.user).order(:date).reverse
      elsif params[:category] == 'all'
        @articles = Article.all.order(:date).reverse
      else
        @category = params[:category]
        @articles = Article.where(category:params[:category]).order(:date).reverse
        if @articles.blank?
          redirect_to articles_path, alert:"No article found with catagory: #{@category}"
        end
      end

    else
      @articles = Article.all.order(:date).reverse
    end
    

  end

  # GET /articles/1 or /articles/1.json
  def show
    flashit unless can?(:show,:article)
  end

  # GET /articles/new
  def new
    flashit unless can?(:new,:article) 
    @article = Article.new(user_id:Current.user.id)
  end

  # GET /articles/1/edit
  def edit
    flashit unless (can?(:edit,:article) && Current.user.owner?(@article)) || Current.user.is_manager?
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    flashit unless can?(:destroy,:article) && Current.user.owner?(@article)
    @article.destroy!
    respond_to do |format|
      format.html { redirect_to articles_path, status: :see_other, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.expect(article: [ :date, :title, :author, :content, :category, :user_id ])
    end
end
