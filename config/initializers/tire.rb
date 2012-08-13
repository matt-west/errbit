if Errbit::Config.elastic_search_enabled
  Tire.configure do
    url     Errbit::Config.elastic_search_url
    logger  STDERR
  end
end
