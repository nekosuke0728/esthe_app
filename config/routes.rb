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

  scope '/user' do
    namespace :esthe_menus do
      get :list
    end
  end
  
  authenticate :staff do
    get 'staff/top'
  end

  scope '/staff' do
    authenticate :staff do
      resources :esthe_menus
    end
  end



end
