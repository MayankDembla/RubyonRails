Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  # REST - Representational state transfer - mapping HTTP verbs (get, post, put/patch, delete) to CRUD actions

  # resources provided REST-ful routes to rails resources
  
  resources:articles #, only: [:show, :index, :new, :create, :edit , :update, :destroy]

end
