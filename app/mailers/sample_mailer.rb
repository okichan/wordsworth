class SampleMailer < ApplicationMailer
    def send_when_create(question)
        @username = question.user.username
        @q_title = question.title
        mail to: question.user.email,
        subject: 'Your translation request has been completed.'
    end
end
