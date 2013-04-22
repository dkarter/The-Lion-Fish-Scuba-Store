module ApplicationHelper
	def self.get_enum_name_by_value(enum, value)
		temp = enum.select{ |x| x[1] == value }.first
    temp ? temp.first : 'Error'
	end

	def self.normalize_date(date_str)
		Date.strptime(date_str, DATE_FORMAT)
	end

	def self.normalize_datetime(datetime_str)
		DateTime.strptime(datetime_str, DATETIME_FORMAT)
	end
end
