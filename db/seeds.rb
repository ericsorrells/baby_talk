# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# questions = Question.create([
#   {sequence: 1,  content: "What is Mommy's maiden name?"},
#   {sequence: 2,  content: "When is Mommy's birtday?"},
#   {sequence: 3,  content: "What schools has Mommy attended?"},
#   {sequence: 4,  content: "What are Mommy's talents and interests?"},
#   {sequence: 5,  content: "What is Daddy's full name?"},
#   {sequence: 6,  content: "When is Daddy's birthday?"},
#   {sequence: 7,  content: "What schools has Daddy attended?"},
#   {sequence: 8,  content: "What are Daddy's talents & interests?"},  
#   {sequence: 9,  content: "How did Mommy & Daddy meet?"},
#   {sequence: 10, content: "Tell us about Mommy & Daddy's first date!"},
#   {sequence: 11, content: "Tell us how Daddy proposed to Mommy?"},
#   {sequence: 12, content: "Tell us about Mommy & Daddy's wedding day!"},
#   {sequence: 13, content: "How did Mommy find out she was pregnant?"},
#   {sequence: 14, content: "How did Mommy & Daddy feel when they learned they were having a baby?"},
#   {sequence: 15, content: "Who were the first people Mommy & Daddy told when you learned you were having a baby?"},
#   {sequence: 16, content: "What was Baby's original due date?"}  
# ])

answers = Answer.create([
  {question_id: 3, user_id: 1 , content: "Medina"},
  {question_id: 4, user_id: 1 , content: "November 26, 1977"},
  {question_id: 5, user_id: 1 , content: "Lakeside, GA State"},
  {question_id: 3, user_id: 2 , content: "Houston"},
  {question_id: 4, user_id: 2 , content: "January 23, 1978"},
  {question_id: 6, user_id: 2 , content: "Music and drawing"},
  {question_id: 7, user_id: 2 , content: "Mark David Anderson"},
  {question_id: 3, user_id: 3 , content: "Gall"},
  {question_id: 4, user_id: 3 , content: "Singing & cooking"},
  {question_id: 7, user_id: 4 , content: "John David Smith"}
  ])

