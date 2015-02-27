# Live Front

Collection of useful helpers and workflows used at [Live Typing](http://ltst.ru).

## List of helpers

### TabHelper

Navigation link helper. Returns an `li` element with an 'active' class if the supplied
controller(s) and/or action(s) are currently active. The content of the
element is the value passed to the block. Initially was copied from
[GitLab project](https://gitlab.com/gitlab-org/gitlab-ce). Also it was added ability to specify
`params` option to make link active when current path suits specified params.

**options**

The options hash used to determine if the element is "active" (default: {})

`:controller`   - One or more controller names to check (optional).

`:action`       - One or more action names to check (optional).

`:path`         - A shorthand path, such as 'dashboard#index', to check (optional).

`:params`       - One or more params to check. It also can be specified `:_blank` value to be able to specify either blank or non-blank param (optional).

`:html_options` - Extra options to be passed to the list element (optional).

**block**

An optional block that will become the contents of the returned `li` element.

When both `:controller` and `:action` are specified, BOTH must match in order
to be marked as active. When only one is given, either can match.

#### Examples:

Assuming we're on `TreeController#show`

```
# Controller matches, but action doesn't
nav_link(controller: [:tree, :refs], action: :edit) { "Hello" }
# => '<li>Hello</li>'
```

```
# Controller matches
nav_link(controller: [:tree, :refs]) { "Hello" }
# => '<li class="active">Hello</li>'
```

```
# Shorthand path
nav_link(path: 'tree#show') { "Hello" }
# => '<li class="active">Hello</li>'
```

```
# Supplying custom options for the list element
nav_link(controller: :tree, html_options: {class: 'home'}) { "Hello" }
# => '<li class="home active">Hello</li>'
```

```
# Supplying params options when `params[:state] # => 'archived'`
nav_link(path: 'tree#show', params: {state: 'archived'}) { "Hello" }
# => '<li class="home active">Hello</li>'
```

```
# Supplying params options when `params[:state] # => nil`
nav_link(path: 'tree#show', params: {state: 'archived'}) { "Hello" }
# => '<li class="home">Hello</li>'
```

```
# Supplying params options when `params[:state] # => nil`
nav_link(path: 'tree#show', params: {state: [:_blank, :active]}) { "Hello" }
# => '<li class="home active">Hello</li>'
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'live-front-rails', github: 'LiveTyping/live-front-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install live-front-rails

## Contributing

1. Fork it ( https://github.com/LiveTyping/live-front-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
