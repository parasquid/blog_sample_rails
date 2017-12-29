Rails.application.routes.draw do
  resources :articles do
    resources :comments do
    end
  end

  root 'welcome#index'
end
