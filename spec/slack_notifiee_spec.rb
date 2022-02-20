# frozen_string_literal: true

require 'slack-notifier'

RSpec.describe SlackNotifiee do
  specify 'store and retrieve slack-notify notifications' do
    described_class.enable

    notifier = Slack::Notifier.new('https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX')

    # Add sleep to avoid random failure.
    notifier.ping 'Hello World'
    sleep 0.01
    notifier.ping 'Hello random', username: 'Notify Bot powered by slack-notify', channel: '#random'
    sleep 0.01
    notifier.post text: 'Hello Attachments and Blocks', attachments: [{ text: 'Hello Attachments' }],
                  blocks: [{ text: 'Hello Blocks' }]
    sleep 0.01
    notifier.post text: 'Hello icons', icon_emoji: ':smile:', icon_url: 'https://picsum.photos/200/300'

    expect(described_class.notifications[0].attributes).to include(text: 'Hello World')
    expect(described_class.notifications[1].attributes).to include(text: 'Hello random',
                                                                   username: 'Notify Bot powered by slack-notify',
                                                                   channel: '#random')
    expect(described_class.notifications[2].attributes).to include(text: 'Hello Attachments and Blocks',
                                                                   attachments: [{ 'text' => 'Hello Attachments' }],
                                                                   blocks: [{ 'text' => 'Hello Blocks' }])
    expect(described_class.notifications[3].attributes).to include(text: 'Hello icons', icon_emoji: ':smile:',
                                                                   icon_url: URI.parse('https://picsum.photos/200/300'))
  end
end
