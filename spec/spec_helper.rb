ENV['RAILS_ENV'] ||= 'test'

require 'active_support'
require 'action_view'
require 'action_controller'

require 'live_front'

include ActionView::Context
include ActionView::Helpers::FormTagHelper
include LiveFront::ApplicationHelper
include LiveFront::TabHelper

class FooController < ActionController::Base
  def foo
  end
end

def controller
  FooController.new
end

def params
  ActionController::Parameters.new p1: 's1'
end

require 'rspec/core'
require 'rspec/mocks'
