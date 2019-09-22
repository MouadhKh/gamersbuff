Rails.application.routes.draw do
  get 'top_plays/index'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "plays#index"
    devise_for :users
    resources :contact, only: [:index, :new, :create]
    resources :plays do
      resources :votes
    end

    #get "sessions/new" => 'sessions#new', :as => :new_session
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    #
    # All invalid routes will be redirected excepted active_storage queries
    get '*all', to: 'application#index', constraints: lambda {|req|
      req.path.exclude? 'rails/active_storage'
    }
  end
end
