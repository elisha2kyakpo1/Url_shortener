class Url < ApplicationRecord
  belongs_to :user
  validates :long_url, presence: true
  validates :short_url, presence: true, on: :update
  before_create :generate_short_url, :sanitize

  validates_length_of :long_url, within: 3..255, on: :create, message: 'too long'
  validates_length_of :short_url, within: 3..16, on: :create, message: 'too long'

  def generate_short_url
    self.short_url = SecureRandom.urlsafe_base64(6)
  end

  def sanitize
    long_url.strip!
    sanitize_url = long_url.downcase.gsub(%r{(https?://)|(www\.)}, '')
    "http://#{sanitize_url}"
  end
end
