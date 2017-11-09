class ApplicationMailer < ActionMailer::Base
  default from:     "Wordsworth admin <alert@example.com>",
          # bcc:      "tomomiparsons@outlook.com",
          reply_to: "madeinwatashi@gmail.com"
  layout 'mailer'
end

