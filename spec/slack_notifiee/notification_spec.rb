# frozen_string_literal: true

::RSpec.describe ::SlackNotifiee::Notification do
  describe '.build_from_json' do
    let(:json) do
      <<~JSON
        {
          "username": "Notify Bot powered by slack-notify",
          "channel": "#general",
          "blocks": [
            {
              "type": "section",
              "text": {
                "type": "plain_text",
                "text": "Hello world"
              }
            }
          ],
          "text": "Hello world",
          "icon_emoji": ":chart_with_upwards_trend:",
          "icon_url": "https://picsum.photos/200/300",
          "attachments": [
            {
              "pretext": "pre-hello",
              "text": "text-world"
            }
          ],
          "webhook_url": "https://hooks.slack.com/services/SAMPLE/FOOBARBAZ/SAMPLEWEBHOOKURL",
          "datetime": "2022-02-20T16:09:30.906140+09:00"
        }
      JSON
    end

    specify 'returns a new instance of Notification' do
      notification = described_class.build_from_json(json)

      expect(notification).to be_a(described_class)
    end

    specify 'parse json values' do
      notification = described_class.build_from_json(json)

      expect(notification.username).to eq('Notify Bot powered by slack-notify')
      expect(notification.channel).to eq('#general')
      expect(notification.blocks).to eq([{ 'type' => 'section',
                                           'text' => { 'type' => 'plain_text', 'text' => 'Hello world' } }])
      expect(notification.text).to eq('Hello world')
      expect(notification.icon_emoji).to eq(':chart_with_upwards_trend:')
      expect(notification.icon_url).to eq(URI.parse('https://picsum.photos/200/300'))
      expect(notification.attachments).to eq([{ 'pretext' => 'pre-hello', 'text' => 'text-world' }])
      expect(notification.webhook_url).to eq(URI.parse('https://hooks.slack.com/services/SAMPLE/FOOBARBAZ/SAMPLEWEBHOOKURL'))
      expect(notification.datetime).to eq(::Time.parse('2022-02-20T16:09:30.906140+09:00'))
    end
  end
end
