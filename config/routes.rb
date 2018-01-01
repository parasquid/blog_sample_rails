Rails.application.routes.draw do

  get 'vue/hello'
  get 'vue/latest_comments'
  get 'vue/comment_box'

  resources :articles do
    resources :comments do
    end
  end

  get "comments/latest", format: :json

  get 'static/about'
  get 'static/services'
  get 'static/contact'

  root 'articles#index'
end
