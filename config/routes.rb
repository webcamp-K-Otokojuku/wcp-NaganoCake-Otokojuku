Rails.application.routes.draw do

  root to: 'homes#top'
  get '/homes/about' => 'homes#about'

  devise_for :admins, controller: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
      registrations: 'admins/registrations'
  }

  devise_for :customers

  # ここから顧客側
  resources :items, only:[:index,:show]

  post '/orders/confirm' => 'orders#confirm'
  get '/orders/complete' => 'orders#complete'
  resources :orders, only:[:new,:create,:index,:show]


  resource :customers, only:[:show,:edit]
  patch '/customers/update' => 'customers#update'
  get '/customers/hide' => 'customers#hide'
  patch '/customers/hide' => 'customers#hide'
  patch '/customers/withdrawal' => 'customers#withdrawal'

  resources :shopping_addresses, except:[:show]

  delete '/cart_items/all_destroy' => 'cart_items#all_destroy'
  post '/add_item' => 'cart_items#add_item'
  resources :cart_items, only:[:index,:update,:destroy]



  # ここから管理者側
  namespace :admin do
    resources :orders, only:[:index,:show,:update] do
      resources :order_items, only:[:update]
    end

    resources :items, except:[:destroy]

    resources :genres, only:[:index,:create,:edit,:update]

    resources :customers, only:[:index,:show,:edit,:update]

  end





end
