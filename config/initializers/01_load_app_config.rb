APP_CONFIG = (YAML.load(File.read(Rails.root + '/config/heroku.yml'))[Rails.env] rescue {}).merge(ENV)
