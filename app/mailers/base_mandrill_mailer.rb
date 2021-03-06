require "mandrill"

class BaseMandrillMailer < ActionMailer::Base
  default(
    from: "hello@eventhub.lk",
    reply_to: "hello@eventhub.lk"
  )

  private

    def send_mail(email, subject, body)
      mail(to: email, subject: subject, body: body, content_type: "text/html")
    end

    def mandrill_template(template_name, attributes)
      mandrill = Mandrill::API.new(ENV["MANDRILL_API_KEY"])

      merge_vars = attributes.map do |key, value|
        { name: key, content: value }
      end

      mandrill.templates.render(template_name, [], merge_vars)["html"]
    end

end
