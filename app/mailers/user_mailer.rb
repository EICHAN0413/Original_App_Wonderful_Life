class UserMailer < ApplicationMailer
    def contact_mail(user)
        @user = user
        mail to: user.email , subject: "ユーザ登録確認メール"
    end
end
