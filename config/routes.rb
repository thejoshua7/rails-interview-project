Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboard#home'
  get 'dashboard' => 'dashboard#home'
  
    namespace 'api' do
      namespace 'v1' do
        resources :questions, only: [:index, :show], defaults: { format: :json } 
      end
    end

end
