Campusero::Engine.routes.draw do
  get 'welcome/index'

    resources :evaluations
    resources :checkins

    match '/code', to: 'users#callback', via: [:get]
end
