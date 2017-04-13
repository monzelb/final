class UserMailer < ApplicationMailer
  default from: 'monzelb@gmail.com'

  def comment_notification(comment, request)
    @comment = comment
    @request= request
    mail(to: @request.user.email, subject: 'subject')
  end

  def request_notification(request, user)
    @user = user
    @request= request
    mail(to: user.email, subject: 'subject')
  end

end
