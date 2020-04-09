Rails.application.routes.draw do


  resources :products do

     get :autocomplete_keyword_description, :on => :collection
  end
  resources :stores do
    end
  resources :categories do
    resources :keywords
  end
  root 'products#index'
  get "new_release" => 'categories#new_release', :as => :new_release
  get "add" => "keywords#add", :as => :add

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
