module DrinksHelper
  def drink_amount_name(review)
    if @review.drink.amount == 1 && @review.drink.name.last != "s"
      "#{@review.drink.amount}" + " #{@review.drink.name}"
    elsif @review.drink.amount == 1 && @review.drink.name.last == "s"
      "#{@review.drink.amount}" + " #{@review.drink.name[0..-2]}"
      elsif @review.drink.amount > 1 && @review.drink.name.last != "s"
      "#{@review.drink.amount}" + " #{@review.drink.name}" + "s"
      else
      "#{@review.drink.amount}" + " #{@review.drink.name}"
    end
  end
end
