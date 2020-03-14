# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :integer          not null
#  question_id      :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord
  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choices,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

end
