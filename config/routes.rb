Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get 'user/login' => redirect('/login')
  get 'login'  => "user#login"
  get 'sign-up'  => "user#signup"
  post 'sign-up' => "user#create"

  resource :user
end
