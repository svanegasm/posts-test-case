# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  title        :string
#  body         :text
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
