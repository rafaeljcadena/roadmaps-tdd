Roadmaps::Application.routes.draw do
  resources :testes
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, :skip => [:registrations]
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users' => 'devise/registrations#update', :as => 'user_registration'
    end

    get "home/index"
    get "home/contact"
    get "home/about"
    get "home/database_changes"

    resources :users, path: '/admin/users'
  end

  root :to => "home#index"
  get '/:locale' => 'home#index', locale: /#{I18n.available_locales.join("|")}/
end
