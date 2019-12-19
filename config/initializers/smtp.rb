# frozen_string_literal: true

if Rails.env != 'test'
  smtp = YAML.safe_load(File.open("#{Rails.root}/config/smtp.yml"))
  env_smtp = smtp[Rails.env]
  unless env_smtp.nil?
    env_smtp.symbolize_keys!
    ActionMailer::Base.smtp_settings = env_smtp
  end
end
