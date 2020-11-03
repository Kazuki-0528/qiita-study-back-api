class V1::MemosController < ApplicationController
  def index
    memos = Memo.all
    render json: memos
  end

  def update
    memo = Memo.find(params[:id])
    if memo.update(blog_params)
      render json: memo
    else
      render json: memo.errors
    end
  end

  def create
    memo = Memo.new(blog_params)
    if memo.save
      render json: memo, status: :created
    else
      render json: memo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    memo = Memo.find(params[:id])
    if memo.destroy
      render json: memo
    end
  end

  private
  def blog_params
    params.require(:memo).permit(:title, :body)
  end
end
