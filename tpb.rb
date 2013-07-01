#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

# http://thepiratebay.sx/search/waking%20life/0/7/e
q = URI::encode(ARGV[0..-1].join(' '))
search_results_url = "http://thepiratebay.sx/search/#{ q }/0/7/0"
search_results = open(search_results_url)

t = Time.now
if ENV['xml']
  puts 'XML'
  doc = Nokogiri::HTML(search_results)

  # first img in the #searchResult table is the magnet link; grab parent
  magnet_link = doc.at('#searchResult tr img').parent()['href']
  seeds = doc.at('#searchResult tr td[align="right"]').content.to_i
  puts "#{ seeds } seeds"
  puts magnet_link
else
  puts 'Regex'
  doc = search_results.read
  magnet_links = doc.scan(/"(magnet:.*?)"/)

  seeds_and_leechers = doc.scan(/td align="right">(\d+)</)
  seeds = seeds_and_leechers.select.each_with_index { |str, i| i.even? }.
                             flatten.map(&:to_i)

  magnet_links_and_seeds = magnet_links.zip(seeds)
  puts magnet_links_and_seeds.first
end
elapsed = Time.now - t
puts "Elapsed: #{ elapsed }"
