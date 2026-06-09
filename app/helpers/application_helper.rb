module ApplicationHelper
  def cents_to_dollars(cents)
    return "$0.00" if cents.nil? || cents.zero?
    format("$%.2f", cents.to_f / 100)
  end
end
