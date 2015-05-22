require 'spec_helper'

describe LiveFront::SignInFormHelper do
  describe '#sign_in_form_for' do
    it 'creates sign in form' do
      form = sign_in_form_for :sessions, url: '/login', class: 'my-sign-in-form'

      expect(form).to match(/class="basic-sign-in-form my-sign-in-form"/)
      expect(form).to match(/action="\/login"/)
      expect(form).to match(/name="sessions\[email\]"/)
      expect(form).to match(/name="sessions\[password\]"/)
      expect(form).to match(/<h3 class="sign-in-form-heading">Sign in<\/h3>/)
    end
  end
end
