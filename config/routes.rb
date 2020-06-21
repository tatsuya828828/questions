Rails.application.routes.draw do
  root 'home#top'
  resources :plays, only: [:show, :index, :create, :update] do
  	collection do
  		get '/:id/quests', to: 'plays#quests', as: 'quests'
  		get '/:id/detail/:history_id', to: 'plays#detail', as: 'detail'
  	end
  end
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
