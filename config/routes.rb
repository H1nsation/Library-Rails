Rails.application.routes.draw do

  devise_for :users, :skip => [:confirmations, :mailer, :passwords]
  resources :books

  root to: "books#index"

  get 'users/loans' => "loans#index", as: :all_user_loans
  post 'users/create_loan' => "loans#create", as: :create_user_loan

end
