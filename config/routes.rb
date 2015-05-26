Rails.application.routes.draw do

  devise_for :users
  resources :books do
    post 'create_loan', on: :member
  end

  root to: "books#index"

  get 'users/loans' => "loans#index", as: :all_user_loans

end
