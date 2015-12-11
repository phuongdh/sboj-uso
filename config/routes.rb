Rails.application.routes.draw do
  get 'jobs/index'
  root 'jobs#index'
end
