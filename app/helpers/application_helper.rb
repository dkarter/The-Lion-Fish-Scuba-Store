module ApplicationHelper
	def self.get_enum_name_by_value(enum, value)
		temp = enum.select{ |x| x[1] == value }.first
    	temp ? temp.first : 'Error'
	end

	def self.normalize_date(date_str)
		Date.strptime(date_str, DATE_FORMAT)
	end

	def self.normalize_datetime(datetime_str)
		Date.strptime(datetime_str, DATETIME_FORMAT)
	end

	def self.date_format_to_regex(date_format)    
  		format = date_format.gsub(/%[ymdCHI]/, "\\d{2}").gsub(/%[YMS]/, "\\d{4}")
  		@date_regex = Regexp.new(format)
	end
end
