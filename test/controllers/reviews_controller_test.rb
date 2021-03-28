require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @review = reviews(:one)
  end

  #ログインせずにpostしてもreview数が変化しないことを確認するテストを追加

  #ログインせずにdeleteしてもreview数が変化しないことを確認するテストを追加

end
