#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

# http://thepiratebay.sx/search/waking%20life/0/7/e
q = URI::encode(ARGV[0..-1].join(' '))
puts "q: '#{ q }'"

search_results_url = "http://thepiratebay.sx/search/#{ q }/0/7/0"
doc = Nokogiri::HTML(open(search_results_url))

# first img in the #searchResult table is the magnet link; grab parent
magnet_link = doc.at('#searchResult tr img').parent()['href']
seeds = doc.at('#searchResult tr td[align="right"]').content.to_i
puts "#{ seeds } seeds"
puts magnet_link
