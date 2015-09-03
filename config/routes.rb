Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    mount Bootsy::Engine => '/bootsy', as: 'bootsy'
    root "posts#index"
  end 
    localized do
      resources :posts
      get '/olderposts/', to: 'posts#olderposts'
      get '/admin/', to: 'posts#admin'
      get '/about/contact/', to: 'about#contact'
      get '/about/', to: 'about#show'
    end 

    
  
end
