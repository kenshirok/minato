# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer          not null
#
# Indexes
#
#  index_comments_on_board_id  (board_id)
#
class Comment < ApplicationRecord
    belongs_to :board
    validates :content, presence: true

end
