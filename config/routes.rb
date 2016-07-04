Rails.application.routes.draw do
  api vendor_string: 'instabug-ramin0', default_version: 1, path: '', as: nil do
    devise_for :apps
    
    version 1 do
      resources :apps, only: :create
      resources :bugs, only: [:show, :create], param: :number do
        get :count, on: :collection
      end
    end
    
    get '*not_found', to: 'api#four_oh_four'
  end
end
