require 'pry'
 # require_relative '../../db/raw_emails'
class EmailParser::Importer


#   attr_accessor :path
#
#
#
# def initialize(path)
#   @path = path
# end


def self.create_files
  emails = ["From: Carmella Draeger <carmella@example.com>
  To: Celia Prince <celia@example.com>, Alisson Silva <alisson@example.com>
  Cc: iyana@example.com
  Message-ID: <1@example>
  Subject: Meeting
  Date: 2 Nov 2017 18:58:15 +0000

  Hi both, can you let me know ideal times for meeting please?",
  "From: Celia Prince <celia@example.com>
  To: Carmella Draeger <carmella@example.com>
  Cc: iyana@example.com, Alisson Silva <alisson@example.com>
  Message-ID: <2@example>
  In-Reply-To: <1@example>
  Subject: RE: Meeting
  Date: 2 Nov 2017 20:38:12 +0000

  Hey Carmella,

  Tuesday would be best for me. I'm otherwise very busy.

  Best,
  Celia

  > Hi both, can you let me know ideal times for meeting please?
",
"From: Red Hot Deals!!! <promotions@example.com>
To: Carmella Draeger <carmella@example.com>
Message-ID: <5@example>
Subject: Fidget spinners REDUCED TO CLEAR
Date: 4 Nov 2017 11:22:00 +0000

Check out this deal - available today only!

https://redhot.deals/3f98j23/fidget-spinners-reduced-to-clear"]

  EmailParser::Email.group_into_convos(emails)
end

# def import
#   filename = files
#   filename.each do |file|
# Song.new_by_filename(file)
# end
# end



end
