Rails.application.routes.draw do
  api vendor_string: 'instabug-ramin0', default_version: 1, path: '', as: nil do
    devise_for :apps
    
    version 1 do
      resources :apps, only: :create
    end
    
    get '*not_found', to: 'api#four_oh_four'
  end
end
