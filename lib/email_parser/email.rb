class EmailParser::Email

    attr_accessor :subject, :to, :from, :message_id



  def self.sort_by_subject(emails)
    @emails = []
      emails.each do |email|
      new_email = self.new
      @emails << new_email
        new_email.subject = email.split("Subject:")
        new_email.subject = new_email.subject[1].split("Date:")
        new_email.subject = new_email.subject[0]
      if new_email.subject.include?("RE:")
        new_email.subject = new_email.subject.split("RE:")[1]
      end
    end
    @emails
  end

def self.group_into_convos(emails)
  emails = self.sort_by_subject(emails)
  @emails = emails.group_by(&:subject)

  binding.pry
end


end
