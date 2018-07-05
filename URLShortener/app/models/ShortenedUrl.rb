require 'securerandom'
class ShortenedURL < ApplicationRecord
  validates :short_url, :long_url, :user_id, :presence = true
  validates :short_url, :uniqueness = true
  
  def self.random_code 
    SecureRandom.base64 
  end
  
  def self.create!(user, long_url)
    ShortenedURL.new(user: user, long_url:long_url, short_url: self.random_code)
  end
end