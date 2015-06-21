Rails.application.routes.draw do
  resources :gifts
  resources :users 
  resources :sessions, except: :new

  # change root to landing page
  # ladnding page should check current_user and redirect to dashboard
  root to: 'users#index'
  get '/sign_in', to: 'sessions#new', as: 'sign_in'
  delete '/sessions', to: 'sessions#destroy', as: 'sign_out'
end

#       Prefix Verb   URI Pattern                  Controller#Action
#        gifts GET    /gifts(.:format)             gifts#index
#              POST   /gifts(.:format)             gifts#create
#     new_gift GET    /gifts/new(.:format)         gifts#new
#    edit_gift GET    /gifts/:id/edit(.:format)    gifts#edit
#         gift GET    /gifts/:id(.:format)         gifts#show
#              PATCH  /gifts/:id(.:format)         gifts#update
#              PUT    /gifts/:id(.:format)         gifts#update
#              DELETE /gifts/:id(.:format)         gifts#destroy
#        users GET    /users(.:format)             users#index
#              POST   /users(.:format)             users#create
#     new_user GET    /users/new(.:format)         users#new
#    edit_user GET    /users/:id/edit(.:format)    users#edit
#         user GET    /users/:id(.:format)         users#show
#              PATCH  /users/:id(.:format)         users#update
#              PUT    /users/:id(.:format)         users#update
#              DELETE /users/:id(.:format)         users#destroy
#     sessions GET    /sessions(.:format)          sessions#index
#              POST   /sessions(.:format)          sessions#create
# edit_session GET    /sessions/:id/edit(.:format) sessions#edit
#      session GET    /sessions/:id(.:format)      sessions#show
#              PATCH  /sessions/:id(.:format)      sessions#update
#              PUT    /sessions/:id(.:format)      sessions#update
#              DELETE /sessions/:id(.:format)      sessions#destroy
#         root GET    /                            users#index
#      sign_in GET    /sign_in(.:format)           sessions#new
#     sign_out DELETE /sessions(.:format)          sessions#destroy