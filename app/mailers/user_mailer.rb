class UserMailer < ApplicationMailer

    def order_complete(order)
        @order = order
        @user = @order.user
        @url = "http://0.0.0.0:3000/order/#{order.id}"
        mail(to: @user.email, subject: "Order complete! (#{order.id})")
      end

end
