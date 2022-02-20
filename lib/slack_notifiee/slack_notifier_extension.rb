# frozen_string_literal: true

module SlackNotifiee
  module SlackNotifierExtension
    def initialize(webhook_url, options={}, &block)
      http_client = ::SlackNotifiee::HttpClient
      options.merge!(http_client: http_client)

      super(webhook_url, options, &block)
    end
  end
end
