class V1::MemosController < ApplicationController
  def index
    memos = Memo.all
    render json: memos
  end

  def create
    memo = Memo.new(memo_params)
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
  def memo_params
    params.require(:memo).permit(:title, :body)
  end
end
