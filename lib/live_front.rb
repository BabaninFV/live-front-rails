require 'live_front/version'
require 'rails'
require 'live_front/application_helper'
require 'live_front/tab_helper'

module LiveFront
  class Engine < ::Rails::Engine
    initializer 'live_front.view_helpers' do
      ActionView::Base.send :include, LiveFront::ApplicationHelper
      ActionView::Base.send :include, LiveFront::TabHelper
    end
  end
end
