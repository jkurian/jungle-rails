class UserMailer < ApplicationMailer

    def order_complete(order)
        @order = order
        @url = "http://0.0.0.0:3000/order/#{order.id}"
        mail(to: @order.email, subject: "Order complete! (order number: #{order.id})")
      end

end
