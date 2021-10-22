class UserMailer < ApplicationMailer
    def contact_mail(user)
        @user = user
        mail to: "chanike1993@yahoo.co.jp" , subject: "ユーザ登録確認メール"
    end
end
