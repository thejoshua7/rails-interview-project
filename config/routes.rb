Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :tenants
  # resources :users
  # resources :questions
  # resources :answers

  namespace 'api' do
    namespace 'v1' do
      resources :questions

    end
  end


  get 'dashboard' => 'dashboard#home'

  root 'dashboard#home'
end
