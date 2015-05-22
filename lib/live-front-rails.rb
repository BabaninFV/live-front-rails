require 'live-front/version'
require 'live-front/application_helper'
require 'live-front/tab_helper'
require 'live-front/sign_in_form_helper'

module LiveFront
  if defined?(Rails)
    class Railtie < ::Rails::Railtie
      initializer 'live_front.view_helpers' do
        ActionView::Base.send :include, LiveFront::ApplicationHelper
        ActionView::Base.send :include, LiveFront::TabHelper
        ActionView::Base.send :include, LiveFront::SignInFormHelper
      end
    end
  end
end
