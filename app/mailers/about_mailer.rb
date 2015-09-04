class AboutMailer < ApplicationMailer
  default :from => 'diego@abogadazo.com' 
  def contact_email(name,email,phone,message)
    @name = name
    @email = email
    @phone = phone
    @message = message
    mail( :to => 'dlaf88@gmail.com',
      :subject => 'Someone sent you a message from your blog',
      :body => "Message:#{@message} From:#{@email} Phone:#{@phone}",
      :content_type => "text/html"
      )
  end
end
