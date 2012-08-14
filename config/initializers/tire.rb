if Errbit::Config.elasticsearch_enabled
  Tire.configure do
    url     Errbit::Config.elasticsearch_url
    logger  Rails.root.join("log", "elasticsearch.#{Rails.env}.log") unless Rails.env.production?
  end
end
