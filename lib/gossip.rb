$:.unshift File.expand_path("./../lib", __FILE__)

require 'csv'

class Gossip 
  attr_accessor :gossip_author, :gossip_content

  def initialize(gossip_author, gossip_content)
    @author = gossip_author
    @content = gossip_content 
  end 

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end 

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
  return all_gossips
  end

end 
