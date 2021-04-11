def stock_picker(prices)

  profits = Hash.new

  prices.each_with_index do |buy_day_price, buy_day_index|
    prices.each_with_index do |sell_day_price, sell_day_index|
      profits[[buy_day_index, sell_day_index]] = sell_day_price - buy_day_price if buy_day_index < sell_day_index
    end
  end

  profits = profits.sort_by {|key, value| value}

  profits[-1]
end

def print_profit(profit)

  if (profit[1] > 0)
    puts "Buy on: #{profit[0][0]} \nSell on: #{profit[0][1]} \nProfit: #{profit[1]} "
  elsif (profit[1] < 0)
    puts "Buy on: #{profit[0][0]} \nSell on: #{profit[0][1]} \nLoss: #{profit[1]}"
  else
    puts "Buy on: #{profit[0][0]} \nSell on: #{profit[0][1]} \nNo profit or loss"
  end

  puts "-----------------"

end

stock1 = [17,3,6,9,15,8,6,1,10]
stock2 = [17, 12, 10, 5, 3, 1]
stock3 = [5, 5, 5, 5, 5, 5]

print_profit(stock_picker(stock1))
print_profit(stock_picker(stock2))
print_profit(stock_picker(stock3))