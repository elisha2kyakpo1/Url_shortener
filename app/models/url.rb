class Url < ApplicationRecord
  belongs_to :user
  validates :long_url, presence: true
  validates :short_url, presence: true, on: :update
  before_create :generate_short_url
  validates :long_url, presence: true,
                           format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), length: { maximum: 32_779 }
  validates_length_of :long_url, within: 3..255, on: :create, message: 'too long'
  validates_length_of :short_url, within: 3..16, on: :create, message: 'too long'

  def click_count
    Url.increment!(:click)
  end

  def self.most_clicked
    where(:click >= 1)
  end
  scope :most_clicked, -> { where('click >= 1').first(5) }

  def generate_short_url
    self.short_url = SecureRandom.urlsafe_base64(4)
  end
end
