Rails.application.routes.draw do
  namespace :v1 do
    resources :memos, only: [:create, :destory, :index, :update]
  end
end
