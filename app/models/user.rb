class User < ApplicationRecord
    mount_uploader :picture, PictureUploader
    before_update :send_email 


    def send_email
        if email_changed?
            puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
            puts "email changed"
            puts self.email
            UserMailer.update_mail(self).deliver_later
        end
    end
end
