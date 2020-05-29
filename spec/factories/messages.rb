FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    image {File.open("#{Rails.root}/public/images/test_image.jpg")} # こちらは~/アプリケーション名/public/images.test_image.jpgの画像をテストで用いるという意味になります。
    user
    group
  end
end

# 4行目のRails.rootの意味は/Users/~~/アプリケーションまでのパスを取得しています