Rails.application.routes.draw do

  devise_for :staffs, controllers: {
    sessions:      'staffs/sessions',
    passwords:     'staffs/passwords',
    registrations: 'staffs/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  # devise_for :staffs
  # devise_for :users

  root 'user#top'
  
  get 'staff/top'

  get 'user/top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
