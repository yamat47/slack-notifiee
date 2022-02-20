![CI Status](https://github.com/yamat47/slack_notifiee/actions/workflows/main.yml/badge.svg) [![Gem Version](https://badge.fury.io/rb/slack_notifiee.svg)](https://badge.fury.io/rb/slack_notifiee) [![Maintainability](https://api.codeclimate.com/v1/badges/d65ff4f4ab461f8ee938/maintainability)](https://codeclimate.com/github/yamat47/slack_notifiee/maintainability)

# SlackNotifiee
SlackNotifiee is a debugging and testing tool for [slack-notifier/slack-notifier](https://github.com/slack-notifier/slack-notifier). Using this gem, you can access the notifications sent by slack-notifier in your code (without Slack App).

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'slack_notifiee'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install slack_notifiee
```

## Usage
```ruby
require 'slack-notifier'
require 'slack_notifiee'

# Enable this gem before using slack-notifier.
SlackNotifiee.enable

# Send a notification. (Accutually, all notifications are not sent to slack but stored local file.)
notifier = Slack::Notifier.new('https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX')
notifier.ping 'Hello, world!'

# You can view all notifications via `SlackNotifiee.notifications`.
SlackNotifiee.notifications.count #=> 1
SlackNotifiee.notifications.first.text #=> 'Hello, world!'
```

`SlackNotifiee.notifications` returns an array of `SlackNotifiee::Notification` objects sorted by notified time. `SlackNotifiee::Notification#attributes` contains:

* `webhook_url`
* `username`
* `channel`
* `attachments`
* `blocks`
* `text`
* `icon_emoji`
* `icon_url`
* `datetime`

## Development
After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/yamat47/slack_notifiee. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/slack_notifiee/blob/main/CODE_OF_CONDUCT.md).

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct
Everyone interacting in the SlackNotifiee project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/yamat47/slack_notifiee/blob/main/CODE_OF_CONDUCT.md).
