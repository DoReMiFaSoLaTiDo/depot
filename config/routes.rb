Rails.application.routes.draw do

  scope '(:locale)' do
    resources :products
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end

  # mount ActionCable.server => '/cable'
end
