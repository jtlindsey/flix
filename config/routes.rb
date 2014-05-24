Flix::Application.routes.draw do
  resources :genres

  resource :session

  get 'signup' => 'users#new'

  resources :users

  get 'movies/filter/:scope' => "movies#index", as: :filtered_movies

  root "movies#index"
  resources :movies do
    resources :reviews
    resources :favorites
  end
end
