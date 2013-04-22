module AccountingTransactionsHelper
  def money(value)
    color = value > 0 ? '"green"' : '"red"'
    "<span class=#{color}>$#{value}</span>".html_safe
  end
end
