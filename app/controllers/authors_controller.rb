class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @post = Post.find(params[:id])
    raise @post.inspect
    if @post.valid?
      @author = Author.create!(author_params)
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end
