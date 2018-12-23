class EmailParser::Email

    attr_accessor :subject, :to, :from, :message_id


  def self.create_emails(emails)
    @emails = []
    emails.each do |email|
      email = slice_quotes(email)
    new_email = self.new
    sort_by_subject(email, new_email)
    sort_by_message_id(email, new_email)
    sort_by_from(email, new_email)
    sort_by_to(email, new_email)
        @emails << new_email
  end
    @emails
  end

  def self.slice_quotes(email)
    email.gsub('"', "")
  end

  def self.sort_by_subject(email, new_email)
    # binding.pry
      new_email.subject = email.split("Subject:")[1].split("Content")[0].strip.downcase
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
    # binding.pry
    email_hash = {}
    emails = self.create_emails(emails)
    @emails = emails.group_by(&:subject)
    # print_emails
    email_hash["promotion"] = {}
    email_hash["personal"] = {}
    @emails.each do |email|
      email_h = {email[0] => email[1]}
      # binding.pry
      if email.flatten[1].from.include?("promotion")
           email_hash["promotion"].merge!(email_h)
           # binding.pry
        else
          email_hash["personal"].merge!(email_h)

        end
      end
      print_emails(email_hash)
    end

  def self.print_emails(email_hash)
    # binding.pry
      puts "Enter 'Personal' to view your personal inbox or 'Promotion' to view your promotional inbox"
      input = gets.strip.downcase
      if input == "personal"
        puts email_hash["personal"]
      elsif input == "promotion"
         puts email_hash["promotion"]
      end
  end


end
