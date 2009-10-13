require 'rubygems'
require 'nokogiri'

require 'lib/selectors'
require 'lib/subview'
require 'lib/subview_builder'
require 'lib/subview_controls'

require 'lib/domain'
require 'lib/view'





puts 'startin up....'
v = View.new
v.whatever
v.render
