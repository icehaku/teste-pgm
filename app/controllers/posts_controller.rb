class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if user_signed_in?
      @post["user_id"] = current_user.id
    end

    respond_to do |format|
      @posts = Post.all
      if @post.save
        format.html { redirect_to "/", notice: 'Postado com Sucesso!' }
      else        
        format.html { render :index }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :nome, :content)
    end
end