Rails.application.routes.draw do
  get 'new', to: 'games#new'
  post 'score', to: 'games#score'
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# c'est la consigne je crois
