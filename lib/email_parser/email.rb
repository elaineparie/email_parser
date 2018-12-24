class EmailParser::Email

  attr_accessor :subject, :to, :from, :message_id, :body


  def self.create_emails(emails)
    @emails = []
    emails.each do |email|
    email = slice_quotes(email)
    new_email = self.new
    sort_by_subject(email, new_email)
    sort_by_message_id(email, new_email)
    sort_by_from(email, new_email)
    sort_by_to(email, new_email)
    sort_by_body(email, new_email)
        @emails << new_email
    end
    @emails
  end

  def self.slice_quotes(email)
    email.gsub('"', "")
  end

  def self.sort_by_subject(email, new_email)
      new_email.subject = email.split("Subject:")[1].split("Content")[0].strip.downcase
    if new_email.subject.include?("re:")
      new_email.subject = new_email.subject.split("re:")[1].strip
    end
    if new_email.subject.include?("fw:")
      new_email.subject = new_email.subject.split("fw:")[1].strip
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

  def  self.sort_by_body(email, email_object)
      email_object.body = email.split("0000")[1].strip
  end

  def self.group_into_convos(emails)
    email_hash = {}
    emails = self.create_emails(emails)
    @emails = emails.group_by(&:subject)
    email_hash["promotion"] = {}
    email_hash["personal"] = {}
    @emails.each do |email|
      email_h = {email[0] => email[1]}
        if email.flatten[1].from.include?("promotion")
           email_hash["promotion"].merge!(email_h)
        else
          email_hash["personal"].merge!(email_h)
        end
    end
      print_emails(email_hash)
  end

  def self.ask_for_inbox
    puts "
    Enter 'Personal' to view your personal inbox or 'Promotion' to view your promotional inbox
    "
  end

  def self.emails_with_index(value)
    value.each_with_index do |email, index|
     puts "#{index + 1}. #{email}"
   end
  end

  def self.ask_for_conversation_name(specific_hash)
    puts "Enter the name of the conversation you want to enter
    "
    input = gets.strip.downcase
      specific_hash[input].each_with_index do |email, index|
        puts "  #{index + 1}. #{email}"
    end
    ask_for_email_index(specific_hash[input])
  end

  def self.ask_for_email_index(email_array)
    puts "Enter the number of the email you want to view
    "
      input = gets.strip
      email = email_array[input.to_i - 1]
      puts email
      puts email.body
  end

    def self.print_emails(email_hash)
      ask_for_inbox
      input = gets.strip.downcase
      personal_hash = email_hash["personal"]
      promotion_hash = email_hash["promotion"]
      if input == "personal"
        email_hash["personal"].each do |key, value|
          puts "
          Subject: #{key}:
          "
          emails_with_index(value)
          end
          ask_for_conversation_name(personal_hash)
      elsif input == "promotion"
        email_hash["promotion"].each do |key, value|
          puts "
          Subject: #{key}:
          "
          emails_with_index(value)
      end
      ask_for_conversation_name(promotion_hash)
    end
  end
end
