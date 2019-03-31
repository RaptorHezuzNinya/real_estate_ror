Rails.application.routes.draw do
	resources :tenants do
		resources :payments
	end
	# resources :payments do
	# end
end
