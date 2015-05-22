module LiveFront
  module SignInFormHelper
    def sign_in_form_for(model, options = {})
      klass = options.delete(:class)
      options.merge!(html: { class: ['basic-sign-in-form', klass].compact.join(' ') })

      form_for model, options do |f|
        [
          content_tag(:h3, I18n.t('sign_in_form.heading'), class: 'sign-in-form-heading'),
          f.email_field(:email, class: 'form-control', placeholder: I18n.t('sign_in_form.form.email'), autofocus: true),
          f.password_field(:password, class: 'form-control', placeholder: I18n.t('sign_in_form.form.password')),
          f.submit(I18n.t('sign_in_form.form.submit'), class: 'btn btn-primary btn-block')
        ].join('').html_safe
      end
    end
  end
end
