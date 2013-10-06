Zeropaste::Application.routes.draw do
  post '(pastes)' => 'pastes#create', format: /(html|json|xml|txt)/, as: 'pastes'
  resources :pastes, only: [:show, :destroy], path: "/"
  root to: 'pastes#new'
end
