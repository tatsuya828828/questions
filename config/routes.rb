Rails.application.routes.draw do
  root 'home#top'
  resources :plays, only: [:show, :index, :create] do
  	collection do
      patch '/:id/reset',              to: 'plays#reset',  as: 'reset'
      put   '/:id/reset',              to: 'plays#reset'
      get   '/:id/result',             to: 'plays#result', as: 'result'
  		get   '/:id/quests',             to: 'plays#quests', as: 'quests'
  		get   '/:id/detail/:history_id', to: 'plays#detail', as: 'detail'
  	end
  	resources :histories, only: [:update]
  end
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
