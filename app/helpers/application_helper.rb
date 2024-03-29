module ApplicationHelper
	def self.get_enum_name_by_value(enum, value)
		temp = enum.select{ |x| x[1] == value }.first
    temp ? temp.first : 'Error'
	end

	def self.normalize_date(date_str)
		Date.strptime(date_str, DATE_FORMAT) unless date_str.blank?
	end

	def self.normalize_datetime(datetime_str)
    DateTime.strptime(datetime_str, DATETIME_FORMAT) unless datetime_str.blank?
	end
	
	def money(value)
    color = value > 0 ? '"green"' : '"red"'
    "<span class=#{color}>$#{value}</span>".html_safe
  end
end
