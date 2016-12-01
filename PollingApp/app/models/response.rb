class Response < ActiveRecord::Base
  validate :not_duplicate_response, :not_poll_author

  def not_duplicate_response
    if respondent_already_answered?(self.user_id)
      self.errors[:user] << "has already answered this question"
    end
  end

  def not_poll_author
    if self.poll.author_id == self.respondent.id
      self.errors[:user] << "is the author of this poll"
    end
  end

  has_one :poll,
    through: :question,
    source: :poll

  has_one :question,
    through: :answer_choice,
    source: :question

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?(responder_id)
    self.sibling_responses.exists?(id: responder_id)
  end

end
