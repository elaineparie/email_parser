
class EmailParser::CLI

def call
  ask_for_input
  EmailParser::Importer.import_files
    end

    def ask_for_input
      puts "Enter 'See Emails' to view your inbox"
      input = gets.strip.downcase
      if input == "see emails"
         EmailParser::Importer.import_files
      end
    end

end
