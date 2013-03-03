module EmailHandlingSteps

  step 'there are no emails' do 
    reset_mailer
  end

  step 'I follow the :link link in the email' do |link| 
    visit_in_email(link)
  end

  step ':email should not have an email with :subject' do |email, subject|
    find_email(email, with_subject: subject).should be nil
  end

  step ':email should have :count email(s) with subject :subject' do |email, count, subject|
    unread_emails_for(email).select { |m| 
      m.subject =~ Regexp.new(Regexp.escape(subject)) 
      }.size.should == parse_email_count(count)
  end

  step ':email should have an email' do |email|
    email = find_email(email)
    email.should_not be_nil
  end

  step 'I open the email to :email' do |email|
    open_email(email)
  end
  
  step 'I open the email to :email with subject :subject' do |email, subject|
    open_email(email, with_subject: subject)
  end

  step 'show me the email' do 
    EmailSpec::EmailViewer::save_and_open_email(Mail::TestMailer.deliveries.last)
  end
end