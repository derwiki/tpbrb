#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

# http://thepiratebay.sx/search/waking%20life/0/7/e
q = URI::encode(ARGV[0..-1].join(' '))
puts "q: '#{ q }'"
search_results_url = "http://thepiratebay.sx/search/#{ q }/0/7/0"
puts "* #{ search_results_url }"

if false
  doc = Nokogiri::HTML(open(search_results_url))

  # first img in the #searchResult table is the magnet link; grab parent
  magnet_link = doc.at('#searchResult tr img').parent()['href']
  seeds = doc.at('#searchResult tr td[align="right"]').content.to_i
  puts "#{ seeds } seeds"
  puts magnet_link
else
  doc = open(search_results_url).read
  magnet_links = doc.scan(/"(magnet:.*?)"/)

  seeds_and_leechers = doc.scan(/td align="right">(\d+)</)
  seeds = seeds_and_leechers.select.each_with_index { |str, i| i.even? }.
                             flatten.map(&:to_i)

  magnet_links_and_seeds = magnet_links.zip(seeds)
  puts magnet_links_and_seeds.first
end
