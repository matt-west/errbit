require 'uri'
require 'bunny'
require 'net/http'

module Amqp
  class Subscriber
    attr_reader :user, :password, :host, :port, :exchange_name, :queue_name

    def initialize(options = {})
      uri            = URI.parse(options[:uri].to_s)
      @user          = uri.user || 'guest'
      @password      = uri.password || 'guest'
      @host          = uri.host || 'localhost'
      @port          = uri.port || 5672
      @exchange_name = uri.path.gsub(/^\//, '')
      @exchange_name = 'airbrake' if @exchange_name == ''
      @queue_name    = options[:queue] || 'errbit'
    end

    def subscribe(endpoint)
      uri = URI.parse(endpoint)

      queue.subscribe do |message|
        # In an ideal world, we'd load the app environment and 
        # handle the message here, but Mongoid doesn't seem to like 
        # what Bunny does to its thread. Instead, let's push it 
        # onto the http endpoint.
        # App.report_error!(message[:payload])
        begin
          request = Net::HTTP::Post.new(uri.path)
          request.body = message[:payload]
          response = Net::HTTP.start(uri.host, uri.port) {|http| http.request(request)}
        rescue
        end
      end
    end

    private

    def bunny
      return @bunny if defined?(@bunny)
      @bunny = Bunny.new(:host => host, :port => port, :user => user, :password => password)
      @bunny.start
      @bunny
    end

    def exchange
      @exchange ||= bunny.exchange(exchange_name)
    end

    def queue
      return @queue if defined?(@queue)
      @queue = bunny.queue(queue_name)
      @queue.bind(exchange)
      @queue
    end
  end
end
