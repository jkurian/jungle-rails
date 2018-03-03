class UserMailer < ApplicationMailer

    def order_complete(order)
        @order = order
        @user = @order.user
        mail(to: @user.email, subject: "Order complete! (#{order.id})")
      end

end
