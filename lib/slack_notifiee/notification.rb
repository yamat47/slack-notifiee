# frozen_string_literal: true

require 'json'
require 'time'
require 'uri'

module SlackNotifiee
  class Notification
    attr_reader :webhook_url, :username, :channel, :attachments, :blocks, :text, :icon_emoji, :icon_url, :datetime

    def self.build_from_json(json)
      attributes = ::JSON.parse(json)

      new(
        webhook_url: ::URI.parse(attributes['webhook_url']),
        username: attributes['username'],
        channel: attributes['channel'],
        attachments: attributes['attachments'],
        blocks: attributes['blocks'],
        text: attributes['text'],
        icon_emoji: attributes['icon_emoji'],
        icon_url: ::URI.parse(attributes['icon_url']),
        datetime: ::Time.parse(attributes['datetime'])
      )
    end

    def initialize(**attributes)
      @webhook_url = attributes[:webhook_url]
      @username = attributes[:username]
      @channel = attributes[:channel]
      @attachments = attributes[:attachments]
      @blocks = attributes[:blocks]
      @text = attributes[:text]
      @icon_emoji = attributes[:icon_emoji]
      @icon_url = attributes[:icon_url]
      @datetime = attributes[:datetime]
    end
  end
end
