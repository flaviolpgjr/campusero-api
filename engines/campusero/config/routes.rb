Campusero::Engine.routes.draw do
    resources :evaluations
    resources :checkins

    match '/code', to: 'users#callback', via: [:get]
end
