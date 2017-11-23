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

  root 'user#top'
  get 'user/top'
  get 'user/access'

  namespace :user do
    resources :esthe_menus, only: [:index, :show]
    authenticate :user do
      resources :reservations, only: [:index]
      # edit,show,の時にIDが見えるとウザい(´・ω・`)
      resource  :reservation, except: [:edit, :update, :destroy]
    end
  end
  namespace :staff do
    authenticate :staff do
      resources :esthe_menus
      resources :reservations
      resources :time_tables
    end
  end

end
