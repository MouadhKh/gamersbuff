Rails.application.routes.draw do
  devise_for :users
  #default_url_options :host => "localhost:3000" #TODO delete
  resources :plays do
    resources :votes
  end
  root "plays#index"

  #get "sessions/new" => 'sessions#new', :as => :new_session
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  #get '*path' => redirect('/') TODO fix this ( changed because of video get request not firing up)
end
