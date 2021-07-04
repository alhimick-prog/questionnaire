Rails.application.routes.draw do
  root "questionnaires#index"
  resources :questionnaires, only: [:index, :show] do
    member do
      post :results
    end
  end
end
