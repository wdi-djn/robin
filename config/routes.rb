Rails.application.routes.draw do
  devise_scope :user do
    resources :contributions
    resources :gifts

    # change root to landing page
    # landing page should check current_user and redirect to dashboard
    root to: 'users#index'

    get '/profile/:id', to: 'users#show', as: 'show_user' 

    delete "/profile/sign_out", to:'devise/sessions#destroy', as: 'sign_out'

    delete '/users/:id', to: 'devise/registrations#destroy', as: 'delete_user'
    devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

    post '/gifts/:gifts_id/contributions', to: 'contributions#create', as: 'gift_contribution'

    put '/gifts/:gifts_id/paycontributions', to: 'contributions#update', as: 'update_gift_contribution'

    get '/dashboard', to: 'dashboard#show', as: 'dashboard'

  end
end
#                   Prefix Verb     URI Pattern                              Controller#Action
#            contributions GET      /contributions(.:format)                 contributions#index
#                          POST     /contributions(.:format)                 contributions#create
#         new_contribution GET      /contributions/new(.:format)             contributions#new
#        edit_contribution GET      /contributions/:id/edit(.:format)        contributions#edit
#             contribution GET      /contributions/:id(.:format)             contributions#show
#                          PATCH    /contributions/:id(.:format)             contributions#update
#                          PUT      /contributions/:id(.:format)             contributions#update
#                          DELETE   /contributions/:id(.:format)             contributions#destroy
#                    gifts GET      /gifts(.:format)                         gifts#index
#                          POST     /gifts(.:format)                         gifts#create
#                 new_gift GET      /gifts/new(.:format)                     gifts#new
#                edit_gift GET      /gifts/:id/edit(.:format)                gifts#edit
#                     gift GET      /gifts/:id(.:format)                     gifts#show
#                          PATCH    /gifts/:id(.:format)                     gifts#update
#                          PUT      /gifts/:id(.:format)                     gifts#update
#                          DELETE   /gifts/:id(.:format)                     gifts#destroy
#                     root GET      /                                        users#index
#              delete_user DELETE   /users/:id(.:format)                     devise/registrations#destroy
#         new_user_session GET      /users/sign_in(.:format)                 devise/sessions#new
#             user_session POST     /users/sign_in(.:format)                 devise/sessions#create
#     destroy_user_session DELETE   /users/sign_out(.:format)                devise/sessions#destroy
#            user_password POST     /users/password(.:format)                devise/passwords#create
#        new_user_password GET      /users/password/new(.:format)            devise/passwords#new
#       edit_user_password GET      /users/password/edit(.:format)           devise/passwords#edit
#                          PATCH    /users/password(.:format)                devise/passwords#update
#                          PUT      /users/password(.:format)                devise/passwords#update
# cancel_user_registration GET      /users/cancel(.:format)                  devise/registrations#cancel
#        user_registration POST     /users(.:format)                         devise/registrations#create
#    new_user_registration GET      /users/sign_up(.:format)                 devise/registrations#new
#   edit_user_registration GET      /users/edit(.:format)                    devise/registrations#edit
#                          PATCH    /users(.:format)                         devise/registrations#update
#                          PUT      /users(.:format)                         devise/registrations#update
#                          DELETE   /users(.:format)                         devise/registrations#destroy
#  user_omniauth_authorize GET|POST /users/auth/:provider(.:format)          omniauth_callbacks#passthru {:provider=>/stripe_connect/}
#   user_omniauth_callback GET|POST /users/auth/:action/callback(.:format)   omniauth_callbacks#:action
#        gift_contribution POST     /gifts/:gifts_id/contributions(.:format) contributions#create