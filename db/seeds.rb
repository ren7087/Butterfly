p "create Users"
User.create!(
  email: 'user1@gmail.com',
  password: '11111111',
  name: '優子',
  self_introduction: '音楽と猫と美味しいものが好き！',
  gender: 1,
  profile_image: open("#{Rails.root}/db/dummy_images/1.jpg")
)
User.create!(
  email: 'user2@gmail.com',
  password: '11111111',
  name: 'けんと',
  self_introduction: 'クリエイターさんと話してみたい。',
  gender: 0,
  profile_image: open("#{Rails.root}/db/dummy_images/2.jpg")
)
User.create!(
  email: 'user3@gmail.com',
  password: '11111111',
  name: 'エヴァ',
  self_introduction: '笹が主食です。',
  gender: 1,
  profile_image: open("#{Rails.root}/db/dummy_images/3.jpg")
)
User.create!(
  email: 'user4@gmail.com',
  password: '11111111',
  name: 'ツウィ',
  self_introduction: '東京で美容師をしています。',
  gender: 1,
  profile_image: open("#{Rails.root}/db/dummy_images/4.jpg")
)
User.create!(
  email: 'user5@gmail.com',
  password: '11111111',
  name: 'かすみ',
  self_introduction: '普段は公認会計士として働いています',
  gender: 1,
  profile_image: open("#{Rails.root}/db/dummy_images/5.jpg")
)
User.create!(
  email: 'user6@gmail.com',
  password: '11111111',
  name: 'さとみ',
  self_introduction: '週3日くらい1人ラーメンします',
  gender: 1,
  profile_image: open("#{Rails.root}/db/dummy_images/6.jpg")
)