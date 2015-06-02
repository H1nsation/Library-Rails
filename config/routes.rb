Rails.application.routes.draw do

  devise_for :users, :skip => [:confirmations, :mailer, :passwords]
  resources :books

  root to: "books#index"

  get 'users/loans' => "loans#show", as: :user_loans
  get 'users/all_loans' => "loans#index", as: :all_user_loans
  post 'users/create_loan' => "loans#create", as: :create_user_loan
  delete 'users/destroy_loan' => "loans#destroy", as: :delete_loan

end
