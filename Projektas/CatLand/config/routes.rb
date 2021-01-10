Rails.application.routes.draw do
  root 'main#main'

  get 'main' => 'main#main'
  get 'apie-mus' => 'main#apie_mus'
  get 'kainos' => 'main#kainos'
  get 'galerija' => 'main#galerija'
  get 'kontaktai' => 'main#kontaktai'
  
  get 'prisijungimas' => 'main#prisijungimas'
  post 'prisijungimas' => 'main#prisijungimas'
  get 'paskyra' => 'main#paskyra'
  post 'paskyra' => 'main#paskyra'
  get 'registracija' => 'main#registracija'
  post 'registracija' => 'main#registracija'
  get 'rezervuoti' => 'main#rezervuoti'
  post 'rezervuoti' => 'main#rezervuoti'
  get 'rezervuoti/ok' => 'main#rezervuoti_ok'

  get 'logout' => 'login#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
