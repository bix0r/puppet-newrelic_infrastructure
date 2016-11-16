# NewRelic Infrastructure

This is a puppet module for installing and managing NewRelic
Infrastructure.

### Testing

To ensure I don't break your stuff in future releases, all code changes
require tests. This repository uses `puppet-rspec` to write unit tests
and to kick off the suite, you just need to run `bundle exec rspec`.

On the CI server, there are also other checks (such as linting and
syntax) that will be kicked off to ensure we maintain consistent code
standards.
