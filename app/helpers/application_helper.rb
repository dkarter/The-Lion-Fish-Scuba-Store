module ApplicationHelper
	def self.get_enum_name_by_value(enum, value)
		temp = enum.select{ |x| x[1] == value }.first
    	temp ? temp.first : 'Error'
	end
end
