require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @review = reviews(:one)
  end

  #ログイン状態でvalidなpostをしたらReview.countが1増加することを確認するテスト

  #ログインせずにpostしてもreview数が変化しないことを確認するテストを追加

  #ログインせずにdeleteしてもreview数が変化しないことを確認するテストを追加

end
