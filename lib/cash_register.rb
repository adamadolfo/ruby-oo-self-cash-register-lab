require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items
    def initialize(discount= 0)
        @total = 0
        @discount = discount
        @items = []
        @price_array = []
        @item_quantities = []
    end
    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        iterator = 0
        while iterator < quantity do 
            @items << title
            @price_array << price
            iterator += 1
        end
            @item_quantities << quantity
    end
    def apply_discount

        self.total = self.total * (1 - @discount/100.0)

        if self.discount != 20 
            return "There is no discount to apply."
        else 
            return "After the discount, the total comes to $#{self.total.to_i}."
        end
    end
    def void_last_transaction
        iterator = @item_quantities[-1]
        while iterator > 0 do
            self.total -= @price_array[-1]
            iterator -= 1
        end
        @items = []
        if @items.length == 0
            return self.total
        end
    end
end

