require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'json'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /' do
    it 'should return the homepage' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include "Hi, I'm Cecily!"
      expect(response.body).to include "I'm a software developer living in London."
      expect(response.body).to include "Click on the links to find out more about me and to see examples of my work."
    end
  end

  context 'GET /cover-letter' do
    it 'should return the cover letter page' do
      response = get('/cover-letter')

      expect(response.status).to eq(200)
      expect(response.body).to include '<h2>About me!</h2>'
      expect(response.body).to include "I’m curious and excited about software and building useful products. I am a people-focused person who is in her element when working as part of a collaborative and kind team, bouncing ideas off one another and building something far better as a result!"
      expect(response.body).to include "I am a natural empath, which came in handy at Makers, where pair programming and team projects were fundamental to the structure of the course.  I was able to put EQ abilities to good use in creating an inclusive and nurturing environment for my fellow learners."
    end
  end

  context 'GET /cv' do
    it 'should return cv page with cv imbedded as PDF' do
      response = get('/cv')

      expect(response.status).to eq(200)
      expect(response.body).to include '<h2>My CV</h2>'
      expect(response.body).to include '<iframe src="docs/cv.pdf" height="500" width="800"></iframe>'
    end
  end
end 