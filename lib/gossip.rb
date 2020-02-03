$:.unshift File.expand_path("./../lib", __FILE__)

require 'csv'

class Gossip 
  attr_accessor :author, :content

  def initialize(gossip_author, gossip_content)
    @author = gossip_author
    @content = gossip_content 
  end 
  #sauvegarde le potin dnas le csv
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end 
  #une vision globale des potins
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
  return all_gossips
  end
  #trouver le potin grâce à son id 
  def self.find(id)
    gossip_id=[]
    csv = CSV.read("./db/gossip.csv")
    gossip_id << csv[id]
    return gossip_id
  end

end 
