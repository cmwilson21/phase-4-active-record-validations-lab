class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
  validate :clickbait?

  BAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  def clickbait?
    if BAIT.none? {|b| b.match title }
      errors.add(:title, "Must be more clickbaity")
    end
  end


end
