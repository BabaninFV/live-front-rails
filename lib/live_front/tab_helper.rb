module LiveFront
  # Copied from GitLab project
  # https://gitlab.com/gitlab-org/gitlab-ce
  module TabHelper
    # Navigation link helper
    #
    # Returns an `li` element with an 'active' class if the supplied
    # controller(s) and/or action(s) are currently active. The content of the
    # element is the value passed to the block.
    #
    # options - The options hash used to determine if the element is "active" (default: {})
    #           :controller   - One or more controller names to check (optional).
    #           :action       - One or more action names to check (optional).
    #           :path         - A shorthand path, such as 'dashboard#index', to check (optional).
    #           :html_options - Extra options to be passed to the list element (optional).
    # block   - An optional block that will become the contents of the returned
    #           `li` element.
    #
    # When both :controller and :action are specified, BOTH must match in order
    # to be marked as active. When only one is given, either can match.
    #
    # Examples
    #
    #   # Assuming we're on TreeController#show
    #
    #   # Controller matches, but action doesn't
    #   nav_link(controller: [:tree, :refs], action: :edit) { "Hello" }
    #   # => '<li>Hello</li>'
    #
    #   # Controller matches
    #   nav_link(controller: [:tree, :refs]) { "Hello" }
    #   # => '<li class="active">Hello</li>'
    #
    #   # Shorthand path
    #   nav_link(path: 'tree#show') { "Hello" }
    #   # => '<li class="active">Hello</li>'
    #
    #   # Supplying custom options for the list element
    #   nav_link(controller: :tree, html_options: {class: 'home'}) { "Hello" }
    #   # => '<li class="home active">Hello</li>'
    #
    # Returns a list item element String
    def nav_link(options = {}, &block)
      c, a = fetch_controller_and_action(options)
      p = options.delete(:params) || {}

      klass = page_active?(c, a, p) ? 'active' : ''


      # Add our custom class into the html_options, which may or may not exist
      # and which may or may not already have a :class key
      o = options.delete(:html_options) || {}
      o[:class] = "#{o[:class]} #{klass}".strip

      if block_given?
        content_tag(:li, capture(&block), o)
      else
        content_tag(:li, nil, o)
      end
    end

    private

    def fetch_controller_and_action(options)
      path = options.delete(:path)

      if path
        if path.respond_to?(:each)
          c = path.map { |p| p.split('#').first }
          a = path.map { |p| p.split('#').last }
        else
          c, a, _ = path.split('#')
        end
      else
        c = options.delete(:controller)
        a = options.delete(:action)
      end
      [c, a]
    end

    def page_active?(controller, action, parameters = {})
      match_action_controller = if controller && action
                                  # When given both options, make sure BOTH are active
                                  current_controller?(*controller) && current_action?(*action)
                                else
                                  # Otherwise check EITHER option
                                  current_controller?(*controller) || current_action?(*action)
                                end

      match_action_controller && match_params?(parameters)
    end

    def match_params?(parameters)
      return true if parameters.empty?

      parameters.all? do |key, value|
        value = *value
        value.any? { |v| v == :_blank ? params[key].to_s.blank? : v.to_s == params[key].to_s  }
      end
    end
  end
end
