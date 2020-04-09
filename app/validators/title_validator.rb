class TitleValidator < ActiveModel::Validator

    def validate(post)
        if !post.title.include?("Won't Believe", "Secret", "Top[number]", "Guess")
            post.errors[:title] << "Not ClickBaity Enough!"
        end
    end 
end