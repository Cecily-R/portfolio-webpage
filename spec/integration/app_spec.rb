require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'json'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /' do
    it 'should get the homepage' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include "Hi, I'm Cecily!"
      expect(response.body).to include "I'm a software developer living in London."
      expect(response.body).to include "Click on the links to find out more about me and to see examples of my work."
    end
  end
end 