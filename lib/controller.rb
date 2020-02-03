require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require '../lib/gossip.rb'


class ApplicationController < Sinatra::Base
  #afficher la page index avec tous les potins
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  #créer un nouveau potin
  get '/gossips/new/' do 
    erb :new_gossip
  end 
  #prendre en compte les params pour le potin
  post '/gossips/new/' do
     Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end
  #trouver le numéro des potins
  get '/gossips/:id' do
    erb :show, locals: {gossip_id: Gossip.find((params['id']).to_i)}
  end
end 
