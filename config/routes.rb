Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "lists#index"
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
    # resources :reviews, only: :create
  end
  # Bookmark = N:N donc un bookmark est pas rattaché à une seule list ! Donc pas nesté 
  resources :bookmarks, only: :destroy
  # resources :reviews, only: :destroy

  resources :movies
end
