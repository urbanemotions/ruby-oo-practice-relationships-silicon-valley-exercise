class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, founder, domain)
        @name = name 
        @founder = founder
        @domain = domain 
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all 
    end

    def self.find_by_founder(founder_name)
        self.all.find do |startup|
            startup.founder == founder_name 
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain 
        end
    end

    def funding_rounds
        FundingRound.all.select do |a|
            a.startup == self
        end
    end

    def sign_contract(venturecapitalist, type, investment)
        FundingRound.new(self, venturecapitalist, type, investment)
    end

    def num_funding_rounds
        funding_rounds.count 
    end

    def total_funds
        funding_rounds.sum do |tf|
            tf.investment
        end
    end

    def investors 
        funding_rounds.map do |x|
            x.venture_capitalist
        end.uniq
    end
end