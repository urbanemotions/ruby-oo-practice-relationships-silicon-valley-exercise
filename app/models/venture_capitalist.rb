class VentureCapitalist
    
    attr_reader :name
    attr_accessor :total_worth

    @@all = []

    def initialize (name, total_worth)
        @name = name 
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all 
    end

    def self.tres_commas_club
        self.all.select do |venturecapitalist|
            venturecapitalist.total_worth >= 1000000000
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(self, startup, type, investment)
    end

    def funding_rounds 
        FundingRound.all.select do |x|
            x.venture_capitalist == self
        end
    end

    def portfolio
        funding_rounds.map do |y|
            y.startup
        end.uniq
    end

    def biggest_investment
        funding_rounds.max_by do |z|
            z.investment
        end
    end

    def domain_rounds(domain)
        FundingRound.all.select do |a|
            a.startup.domain == domain
        end
    end

    def invested(domain)
        domain_rounds.sum do |b|
            b.investment
        end
    end
end
