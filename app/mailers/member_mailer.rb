class MemberMailer < ApplicationMailer
    def new_member_email
        @member = params[:member]
        mail(to: @member.email, subject: 'Welcome to ASGSA!')
    end

    def support_email(name, email, issue)
        @name = name
        @email = email
        @issue = issue
    
        mail(to: 'asgsatamu1@gmail.com', subject: 'New Support Request')
    end

end
