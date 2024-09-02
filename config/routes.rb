Rails.application.routes.draw do
  resources :pets, only: [:create, :index] do
    collection do
      get 'outside_zone'
    end
  end
end
