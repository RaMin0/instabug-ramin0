Rails.application.routes.draw do
  api vendor_string: 'instabug-ramin0', default_version: 1, path: '', as: nil do
    version 1 do
      
    end
    
    get '*not_found', to: 'api#four_oh_four'
  end
end
