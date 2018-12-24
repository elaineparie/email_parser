
class EmailParser::Importer

  def self.import_files
    files = []
    some_dir = Dir.open "./db/raw_emails"
      some_dir.each do |file|
        if file != "." && file != ".." && file != ".DS_Store"
          file = File.open("db/raw_emails/#{file}").read
          files << file
        end
      end
    EmailParser::Email.group_into_convos(files)
  end
end
