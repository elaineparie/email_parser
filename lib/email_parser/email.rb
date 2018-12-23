class EmailParser::Email

    attr_accessor :subject, :to, :from, :message_id, :personal_convos, :group_convos, :promotions


  def self.create_emails(emails)
    @emails = []
    emails.each do |email|
    new_email = self.new
    sort_by_subject(email, new_email)
    sort_by_message_id(email, new_email)
    sort_by_from(email, new_email)
    sort_by_to(email, new_email)
        @emails << new_email
  end
    @emails
  end

  def self.sort_by_subject(email, new_email)
      new_email.subject = email.split("Subject:")[1].split("Date:")[0].strip.downcase
    if new_email.subject.include?("re:")
      new_email.subject = new_email.subject.split("re:")[1].strip
    end
  end


  def  self.sort_by_message_id(email, email_object)
      email_object.message_id = email.split("Message-ID:")[1].split("Subject:")[0].strip.downcase
  end

  def  self.sort_by_from(email, email_object)
      email_object.from = email.split("From: ")[1].split("To:")[0].strip
  end

  def  self.sort_by_to(email, email_object)
      email_object.to = email.split("To: ")[1].split("Message-ID")[0].strip
  end

  def self.group_into_convos(emails)
    email_hash = {}
    emails = self.create_emails(emails)
    @emails = emails.group_by(&:subject)
    # print_emails
    @emails.each do |email|
      # binding.pry
      if email.flatten[1].from.include?("promotion")
        # binding.pry
          email_hash["promotion"] = email
        else
            email_hash["personal"] = email

        end
    end
    print_emails(email_hash)
  end

  def self.print_emails(email_hash)
      puts "Enter 'Personal' to view your personal inbox or 'Promotion' to view your promotional inbox"
      input = gets.strip.downcase
      if input == "personal"
        puts email_hash["personal"]
       elsif input == "promotion"
         puts email_hash["promotion"]
      end

  end


end
