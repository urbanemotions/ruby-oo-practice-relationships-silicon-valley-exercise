require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Chloe", "Wildy", "www.cwildy.com")
s2 = Startup.new("Jeff", "Bezos", "Amazon")
s3 = Startup.new("Jean", "Dan", "Microsoft")
s4 = Startup.new("Ziad", "Flatiron", "Facebook")
vc1 = VentureCapitalist.new("Chloe", 888)
vc2 = VentureCapitalist.new("Jeff", 9999999999)
vc3 = VentureCapitalist.new("Jean", 2500000000)
vc4 = VentureCapitalist.new("Ziad", 33333)
fr1 = FundingRound.new(s1, vc3, "Angel", 666666)
fr2 = FundingRound.new(s1, vc3, "Series B", 11)
fr3 = FundingRound.new(s2, vc1, "Pre-Seed", 25)
fr4 = FundingRound.new(s3, vc2, "Series B", 1000)
fr5 = FundingRound.new(s4, vc2, "Series B", -2)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line