class PostsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash[:notice] = "Update Success"
      redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "Post Deleted"
      redirect_to group_path(@group)
  end




  private

  def post_params
    params.require(:post).permit(:content)
  end

end
