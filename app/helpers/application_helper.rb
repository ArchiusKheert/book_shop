module ApplicationHelper
  def categories
    Category.order('name')
  end

  def number_to_dollar(amount)
    number_to_currency(amount, unit: '$')
  end
end
