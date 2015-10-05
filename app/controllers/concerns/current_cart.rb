module CurrentCart
  extend ActiveSupport::Concern

  private

    def set_cart 
        if session[:cart_id]
          @cart = Cart.find(session[:cart_id])
        elsif session[:user_id]
          @user =  User.find(session[:user_id])
          if @user.cart
            @cart = @user.cart
            session[:cart_id] = @cart.id
          else
            @user.cart = Cart.create()
            @cart = @user.cart
          end
        end
    end
end
