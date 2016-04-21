class PostsController < ApplicationController
  #validates :researchlink, uniqueness: true, if: 'researchlink.present?'
  #validates :articlelink, uniqueness: true, if: 'articlelink.present?'
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  respond_to :js
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
    @categories = Category.all
    @subcategories = Subcategory.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @bookmarks = Bookmark.where(user_id: current_user.id).select(:list).map(&:list).uniq
    @bookmark = Bookmark.new
    @journal_articles = @post.journal_articles
    @research_papers = @post.research_papers
    @comments = @post.comments.where(post_id = params[:id])
    @comment = Comment.new


    #@journal_articles.build
    #@post_new = Post.new
    #@post.research_papers.user_id = User.find(current_user.id)
    #@post.id = Post.find(params[:id])


    #respond_to do |format|
    # if @post.save
    #   redirect_to @post, notice: 'Post was successfully updated'
    # else
    #   render :new
    #   format.json { render json: @post.errors, status: :unprocessable_entity }
    #end
    #end
    #@user_research_papers = @post.research_papers.where(:user_id => current_user.id)
  end

  # GET /posts/new
  def new
    @post = Post.new
    @categories = Category.all.map { |category| [category.name, category.id] }
    @subcategories = Subcategory.where("category_id = ?", Category.first.id)
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @categories = Category.all.map { |category| [category.name, category.id] }
    @subcategories = Subcategory.where("category_id = ?", Category.first.id)
  end

  def add
    @user = User.find(current_user)
    @post.id = Post.find(params[:id])
    @post_new = Post.new(post_params)

    respond_to do |format|
      if @post.save
        redirect_to @post, notice: 'Post was successfully updated'
      else
        render :new
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @categories = Category.all
    @subcategories = Subcategory.where("category_id = ?", Category.first.id)

    respond_to do |format|
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
        format.json { render :show, status: :created, location: @post }
      else
        render :new
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @categories = Category.all
    @subcategories = Subcategory.where("category_id = ?", Category.first.id)

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_subcategories
    @subcategories = Subcategory.where("category_id = ?", params[:category_id])
    respond_to do |format|
      format.js
      #format.html { render(:partial => @subcategories) }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post

  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:user_id, :title, :description, :subcategory_id,
                                 journal_articles_attributes: [:id, :title, :link, :author, :articledate, :user_id, :_destroy],
                                 research_papers_attributes: [:id, :title, :link, :university, :price, :author, :researchdate, :user_id, :_destroy] )
  end
end
