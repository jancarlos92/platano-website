class SupporterMailer < ApplicationMailer


    def welcome_email

        
        @supporter = params[:supporter][:email]
        @url  = 'https://platanothemovie.com'


        mail(to: @supporter, subject: 'Thank You For Your Support!')

    end


end
