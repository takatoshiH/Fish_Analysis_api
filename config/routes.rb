Rails.application.routes.draw do
  get "prefectures", to: "prefectures#index"
  resources :cities, only: [:show]
  resources :fishing_logs
end
