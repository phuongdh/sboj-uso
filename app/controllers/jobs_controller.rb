require 'rss'

class JobsController < ApplicationController
  def index
    @rss = Rails.cache.fetch("all_jobs", expires_in: 30.minutes) do
      RSS::Parser.parse('https://www.jobsatosu.com/all_jobs.atom', false)
    end
  end
end
