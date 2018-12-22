
class EmailParser::CLI

def call
  ask_for_input
  EmailParser::Importer.create_files
    end

    def ask_for_input
      puts "Enter 'See Emails' to view your inbox"
      input = gets.strip.downcase
      if input == "see emails"
        puts EmailParser::Importer.create_files
      end
    end

end
