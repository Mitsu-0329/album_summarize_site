class GroupMailer < ApplicationMailer

  def group_email(group, subject, message)
    @group = group
    @message = message

    # メンバーのメールアドレス一覧
    recipients = @group.users.pluck(:email)

    mail(
      bcc: recipients, # 一斉送信（アドレス非公開）
      subject: subject
    )
  end
end

