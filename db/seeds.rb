# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

test_user = User.create(username: 'test', password: 'test', password_confirmation: 'test')
stack = test_user.stacks.create(title: 'Stack 1')
open_answer = OpenAnswer.create(
  question: 'Open Question?',
  answer: 'Open Question!', stack_id: stack.id
)

multiple_choice = MultipleChoice.create(
  question: 'MC Question?',
  option1: 'MC Option1!',
  option2: 'MC Option2!',
  option3: 'MC Option3!',
  option4: 'MC Option4!',
  option1_correct: true,
  option2_correct: true,
  option3_correct: false,
  option4_correct: false,
  stack_id: stack.id
)

single_choice = SingleChoice.create(
  question: 'SC Question?',
  option1: 'SC Option1!',
  option2: 'SC Option2!',
  option3: 'SC Option3!',
  option4: 'SC Option4!',
  correct_option: 1,
  stack_id: stack.id
)

true_false = TrueFalse.create(
  question: 'True False Question?',
  correct: true,
  stack_id: stack.id
)
