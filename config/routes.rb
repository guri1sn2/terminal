Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'home/show' => 'home#show'
  get 'home/show_check' => 'home#show_check'

  post 'home/master' => "home#master"
  post 'home/update/:id' => "home#register"
  get 'home/:id' => "home#update"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
