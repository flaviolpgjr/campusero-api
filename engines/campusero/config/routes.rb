Campusero::Engine.routes.draw do
  
  get 'welcome/index'

    resources :evaluations
    resources :checkins
    resources :murals

    get 'last_checkin', to: 'checkin#last_checkin'
    match '/code', to: 'users#callback', via: [:get]
end
