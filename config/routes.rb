Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :account, only: ['index', 'create', 'edit']
  get 'register'     => "account#new"
  get 'account/new'  => redirect('/register')

  get '*anything' => 'error#not_found'
end
