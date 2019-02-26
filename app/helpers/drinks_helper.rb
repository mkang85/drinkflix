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

  def drink_display(drink)
    if drink.amount == 1 && drink.name.last != "s"
      "#{drink.amount}" + " #{drink.name}"
    elsif drink.amount == 1 && drink.name.last == "s"
      "#{drink.amount}" + " #{drink.name[0..-2]}"
    elsif drink.amount > 1 && drink.name.last != "s"
      "#{drink.amount}" + " #{drink.name}" + "s"
      else
      "#{drink.amount}" + " #{drink.name}"
    end
  end
end
