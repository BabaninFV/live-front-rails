ENV['RAILS_ENV'] ||= 'test'

require 'pathname'
require 'rack/test'
require 'active_support'
require 'action_view'
require 'action_controller'
require 'i18n'

require 'live-front-rails'

include ActionView::Context
include ActionView::Helpers::FormTagHelper
include ActionView::Helpers::FormHelper
include LiveFront::ApplicationHelper
include LiveFront::TabHelper
include LiveFront::SignInFormHelper

I18n.default_locale = :en

class FooController < ActionController::Base
  def foo
  end
end

def protect_against_forgery?
  false
end

def controller
  FooController.new
end

def params
  ActionController::Parameters.new p1: 's1'
end

require 'rspec/core'
require 'rspec/mocks'
