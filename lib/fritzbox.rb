# frozen_string_literal: true

require 'httparty'
require 'nokogiri'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup

module Fritzbox
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
    @configuration.session ||= Session.new

    @configuration
  end

  def self.reset
    @configuration.reset!
  end

  def self.configure
    yield(configuration)
  end
end