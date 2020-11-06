Rails.application.routes.draw do
  namespace :v1 do
    resources :memos, only: [:create, :destroy, :index]
  end
end
