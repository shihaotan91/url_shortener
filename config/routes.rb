Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :links, only: %i[new create show]

  get '/:short_url' => 'redirect#show'
end
