class Url < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :short_url, presence: true, on: :create, if: :custom
  validates :short_url, presence: true, on: :update
  before_create :generate_short_url, :sanitize
  # validates :long_url, format: URL.regexp(%w[http https])
  validates_format_of :short_url, with: /^[A-Za-z0-9]+$/, multiline: true,
                                  message: 'Only numeric and character allowed!', on: :create, if: :custom
  validates_format_of :short_url, with: /^[A-Za-z0-9]+$/, multiline: true,
                                  message: 'Only numeric and character allowed!', on: :update
  validates_length_of :long_url, within: 3..255, on: :create, message: 'too long'
  validates_length_of :short_url, within: 3..16, on: :create, message: 'too long'

  # def generate_slug
  #   self.short_url = SecureRandom.uuid[0..6] if short_url.nil? || short_url.empty?
  #   true
  # end

  # private

  def generate_short_url
    random_chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
    assign_attributes(short_url: 6.times.map do
                                   random_chars.sample
                                 end.join.prepend('http://')) until short_url.present? && Url.find_by_short_url(short_url).nil?
  end

  def sanitize
    long_url.strip!
    sanitize_url = self.long_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    "http://#{sanitize_url}"
  end
  # # the API
  # def self.shorten(long_url, short_url = '')
  #   link = Url.where(long_url:, short_url:).first
  #   return link.short if link

  #   link = Url.new(long_url:, short_url:)
  #   return link.short if link.save

  #   Url.shorten(long_url, short_url + SecureRandom.uuid[0..2])
  # end
end
