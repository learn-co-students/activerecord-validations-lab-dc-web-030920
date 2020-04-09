class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "The category chosen must be fiction or non-fiction."}
    validate :need_clickbait

  def need_clickbait
    if self.title && !self.title.include?("Won't Believe" || "Secret" ||"Top [number]" || "Guess")
      errors.add(:title, "Need More Clickbait")
    end
  end
end
