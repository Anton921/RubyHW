class OrdersController < ApplicationController
    before_action :set_order
    before_action :set_categories

    def show
        @order_items = @order.order_items
    end

    def destroy
        @order.destroy
    end

    def edit; end

    def update
        @order.ordered!
        @order.update(order_params)
        redirect_to root_path
    end

    private

    def order_params
        params.require(:order).permit(:user_id, :status, :name, :phone, :info, :address)
    end

    def set_order
        @order = current_order
    end

    def set_categories
        @categories = Category.all
    end
end