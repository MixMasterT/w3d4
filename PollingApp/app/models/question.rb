class Question < ActiveRecord::Base
  validates :text, presence: true

  has_many :responses,
    through: :answer_choices,
    source: :responses

  # has_many :responders,
  #   through: :responses,
  #   source: :respondent

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  def results
    answer_choices = self.answer_choices.includes(:responses)

    results = Hash.new { 0 }
    answer_choices.each do |a_c|
      results[a_c] += 1
    end
    results
  end
end
