Rails.application.routes.draw do
  root to: "job_candidates#index" #index path
  resources :job_candidates
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
