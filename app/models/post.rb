class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_clickbait?

    
    # def must_be_clickbaity
    #     clickbaity = ["Won't Believe", "Secret", "Top[1..10]", "Guess"]
    #     if !self.title.include?(clickbaity)
    #         errors.add(:title, "Not Click-Baity Enough!")
    #     end
    # end

    #note: copied this last part from solution
    #no clue how to get it to work
    CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end


end
