Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "to_dos#index"
 resources  :to_dos do
  get 'ascending_order_title' , on: :collection , to: 'ascending_order_title'
  get 'ascending_order_comments' , on: :collection , to: 'ascending_order_comments'
 end
end




