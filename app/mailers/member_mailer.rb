class MemberMailer < ApplicationMailer
    def new_member_email
        @member = params[:member]
        mail(to: @member.email, subject: 'Welcome to ASGSA!')
    end
end
