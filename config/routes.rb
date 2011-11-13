Buyers::Application.routes.draw do
  devise_for :users, :path_names => {:sign_in => "register"}
  root :to => 'purchases#index'
  resources :purchases do
    resources :comments, :belongs_to => :purchase
    get :autocomplete_city_name, :on => :collection
  end
end
