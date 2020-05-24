class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy, :controldashboard]
  before_action :forbid_login_user, only: [:new, :create, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json

  def home
    @posts = Post.all
  end

  def index
    @posts = Post.all
  end

  def controldashboard
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find_by(id: params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find_by(id: params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.userid = @current_user.id

    respond_to do |format|
      if params[:image]
        image=params[:image]
        File.binwrite(@post.image_url,image.read)
      end

      if @post.save
        format.html { redirect_to "/posts", notice: '投稿が完了しました' }
        #format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      end

    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if params[:image]
        image=params[:image]
        File.binwrite(@post.image_url,image.read)
      end

      if @post.update(post_params)
        format.html { redirect_to "/posts", notice: '投稿を編集しました' }
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
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: '投稿を削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_post
      @post = Post.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :posttime, :starttime, :endtime, :postid, :userid, :category, :image, :content)
    end
end
