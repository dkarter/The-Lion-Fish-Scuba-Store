module CustomersHelper
  def f_payment(value, status, payment_status)
    if value
      color = status == 2 ? '"red"' : '"green"'
      color = '' unless payment_status == 2
      "<span class=#{color}>$#{value}</span>".html_safe
    end
  end
end
