class HomeController < ApplicationController
  def top
    @post = Post.all.order(created_at: :asc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(context: params[:context])
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/home/top")
    else
      render("home/new")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/home/top")
  end

  def edit
      @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.context = params[:context]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/home/top")
    else
      render("home/edit")
    end
  end

end
