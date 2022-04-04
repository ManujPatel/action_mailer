class UserMailer < ApplicationMailer
    
    def create_mail(user)
        attachments.inline['Cat.jpg'] = File.read('app/assets/images/Cat.jpg')
        @user=user
        puts @user
        mail(to: email_address_with_name(@user.email, @user.name),subject: 'Welcome to our website') do |format|
          format.html { render layout: "user_create" }
          format.text
        end
    end
    
    def update_mail(user)
        @user=user
        puts @user
        mail(to: email_address_with_name(@user.email, @user.name),subject: 'Successfully Updated your email id') do |format|
            format.html { render layout: "email_update" }
            format.text
        end
    end  
end
