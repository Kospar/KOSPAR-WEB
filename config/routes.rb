Rails.application.routes.draw do

  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, controllers:{registrations: "users/registrations"}
  get '/admin_page' => 'admin_page#index'

  get '/forums' =>"forums#index"
  get '/forums/board/:board_id' =>"forums#board_show"
  get '/forums/new' =>"forums#new"
  get '/forums/new/:board_id' =>"forums#new"
  post '/forums/new' =>"forums#create"
  post '/forums/post/edit' =>"forums#update"
  get '/forums/:board_id/post/:post_id' =>"forums#post_show"
  get '/forums/:board_id/post/:post_id/destroy' =>"forums#destroy"
  get '/forums/:board_id/post/:post_id/edit' =>"forums#edit"
  post '/forums/:board_id/post/:post_id/comment_create' =>"forums#comment_create"
  post '/forums/:board_id/post/:post_id/comment_edit' =>"forums#comment_edit"
  get '/forums/:board_id/:post_id/:comment_id/destroy' =>"forums#comment_destroy"
  
  

  get '/forum_boards' => "forum_boards#index"
  post '/forum_boards/create' => "forum_boards#create"
  post '/forum_boards/update' => "forum_boards#update"
  get '/forum_boards/:forum_id/destroy' => "forum_boards#destroy"
  get '/forum_boards/show'

  get '/Opensrcs' => 'opensrcs#index'
  get '/Opensrcs/new' => 'opensrcs#new'
  post '/Opensrcs/new' => 'opensrcs#create'
  get '/Opensrcs/show/:src_id' => 'opensrcs#show'
  get '/Opensrcs/:src_id/edit' => 'opensrcs#edit'
  get '/Opensrcs/:src_id/destroy' => 'opensrcs#destroy'
  post '/Opensrcs/:src_id/edit' => "opensrcs#update"
  get '/Opensrcs/search' => "opensrcs#search_result"
  post '/Opensrcs/show/:src_id' => 'opensrcs#comment_create'
  get '/Opensrcs/:src_id/:comment_id/destroy' => 'opensrcs#comment_destroy'
  post '/Opensrcs/:src_id/:comment_id/edit' => 'opensrcs#comment_edit'

  
  
  get '/Design_documents' => 'design_documents#index'
  get '/Design_documents/new' => 'design_documents#new'
  post '/Design_documents/new' => 'design_documents#create'
  get '/Design_documents/show/:doc_id' => 'design_documents#show'
  get '/Design_documents/:doc_id/edit' => 'design_documents#edit'
  get '/Design_documents/:doc_id/destroy' => 'design_documents#destroy'
  post '/Design_documents/:doc_id/edit' => "design_documents#update"
  get '/Design_documents/search' => "design_documents#search_result"
  post '/Design_documents/show/:doc_id' => 'design_documents#comment_create'
  get '/Design_documents/:doc_id/:comment_id/destroy' => 'design_documents#comment_destroy'
  post '/Design_documents/:doc_id/:comment_id/edit' => 'design_documents#comment_edit'
  
  get '/trends/latest' => 'trends#latest'
  get '/trends/new' => 'trends#new'
  post '/trends/new' => 'trends#create'
  get '/trends/latest/:trend_id' => "trends#show"
  get '/trends/latest/:trend_id/destroy' => "trends#destroy"
  get '/trends/latest/:trend_id/edit' => "trends#edit"
  post '/trends/latest/:trend_id/edit' => "trends#update"

  get '/Q&A' => "qnas#index"
  get '/Q&A/new' => "qnas#new"
  post '/Q&A/new' => "qnas#create"
  get '/Q&A/show/:qna_id' => "qnas#show"
  get '/Q&A/search' => "qnas#search_result"
  get '/Q&A/show/:qna_id/destroy' =>"qnas#destroy"
  get '/Q&A/show/:qna_id/edit' =>"qnas#edit"
  post '/Q&A/:qna_id/edit' =>"qnas#update"
  get '/Q&A/:qna_id/reply' =>"qnas#reply"
  post '/Q&A/:qna_id/reply' =>"qnas#reply_create"
  get '/Q&A/:qna_id/:reply_id/edit' =>"qnas#reply_edit"
  post '/Q&A/:qna_id/:reply_id/edit' =>"qnas#reply_update"
  get '/Q&A/show/:qna_id/:reply_id/destroy' => "qnas#reply_destroy"
  
  get '/mypage' => "mypage#index"


  get '/About_us' => "about_us#index"
  get '/About_us/new' => "about_us#new"
  get '/About_us/edit' => "about_us#edit"
  post '/About_us/new' => "about_us#create"
  post '/About_us/edit' => "about_us#update"
  
  
  get '/Notice' => "notice#index"
  get '/Notice/new' => 'notice#new'
  post '/Notice/new' => 'notice#create'
  get 'Notice/:notice_id' => 'notice#show'
  get '/Notice/:notice_id/edit' => 'notice#edit'
  post '/Notice/:notice_id/edit' => 'notice#update'
  get '/Notice/:notice_id/destroy' => 'notice#destroy'
  
  
  post '/tinymce_assets' => 'tinymce_assets#create'

  root 'main#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
