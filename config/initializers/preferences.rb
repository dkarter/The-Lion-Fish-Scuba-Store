#preferences.rb initializer - put all global variables in preferences.yml. access them-> APP_CONFIG['app_title']
APP_CONFIG = YAML.load_file("#{Rails.root}/config/preferences.yml")


DATETIME_FORMAT = '%m/%d/%Y %I:%M %p'
DATE_FORMAT = '%m/%d/%Y'
HTML_DATETIME_FORMAT = 'MM/dd/yyyy HH:mm PP'
HTML_DATE_FORMAT = 'MM/dd/yyyy'