DataEngineering::Application.routes.draw do
  resources :imports, only: [:index, :new, :create]
end
