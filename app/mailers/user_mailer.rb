class UserMailer < ApplicationMailer
  default from: 'monzelb@mail.com'

  def comment_notification(comment, request)
    @comment = comment
    @request= request
    mail(to: 'monzelb@gmail.com', subject: 'subject')
  end

end
