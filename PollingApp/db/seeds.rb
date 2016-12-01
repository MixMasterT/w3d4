# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

ActiveRecord::Base.transaction do

  user1 = User.create(name: "hank")
  user2 = User.create(name: "Bertha")
  user3 = User.create(name: "Dennis")

  poll1 = Poll.create(title: "This is the first poll")
  poll2 = Poll.create(title: "This is the second poll")
  poll3 = Poll.create(title: "This is the third poll")

  q1 = Question.create(text: "Who?", poll_id: poll1.id)
  q2 = Question.create(text: "What?", poll_id: poll1.id)
  q3 = Question.create(text: "When?", poll_id: poll1.id)

  answerChoice1 = AnswerChoice.create(text: "him", question_id: q1.id)
  answerChoice2 = AnswerChoice.create(text: "her", question_id: q1.id)
  answerChoice3 = AnswerChoice.create(text: "Them", question_id: q1.id)

  answerChoice4 = AnswerChoice.create(text: "This", question_id: q2.id)
  answerChoice5 = AnswerChoice.create(text: "That", question_id: q2.id)
  answerChoice6 = AnswerChoice.create(text: "The Other", question_id: q2.id)

  response1 = Response.create(user_id: user1.id, answer_choice_id: answerChoice1.id)
  response1 = Response.create(user_id: user2.id, answer_choice_id: answerChoice3.id)
  response1 = Response.create(user_id: user3.id, answer_choice_id: answerChoice2.id)

end
