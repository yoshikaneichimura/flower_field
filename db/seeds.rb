# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create([
  { area: '北海道'},
  { area: '東北'},
  { area: '信越'},
  { area: '関東'},
  { area: '北陸'},
  { area: '東海'},
  { area: '近畿'},
  { area: '中国'},
  { area: '四国'},
  { area: '九州'},
  { area: '沖縄'},
  ])

  User.create!(
    [
      {email:'haruko@test.com',name:'haruko',password:'aaaaaa',introduction:"春子です、よろしくです！",
      profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user-1.jpeg"),
      filename:"sample-user-1.jpeg")},

      {email:'natsuhiko@test.com',name:'natsuhiko',password:'aaaaaa',introduction:"夏彦だ、よろしくな！",
      profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user-2.jpeg"),
      filename:"sample-user-2.jpeg")},

      {email:'akie@test.com',name:'akie',password:'aaaaaa',introduction:"秋江と申します、よろしくお願いします。",
      profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user-3.jpeg"),
      filename:"sample-user-3.jpeg")},

      {email:'fuyumi@test.com',name:'fuyumi',password:'aaaaaa',introduction:"冬美でございます、よろしくお願い致します。",
      profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user-4.jpeg"),
      filename:"sample-user-4.jpeg")},

      # {email:'',name:'',password:'',introduction:"",
      # profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/"),
      # filename:"")},
      ]
    )


  PostImage.create!(
    [
      {user_id:"1",tag_id:"1",flower:"椿",field:"北海道植物公園",day:"20210101",star:"5",address:"北海道札幌市",
      comment:"近くにコンビニなどがないので、お買い物などは駅前しておいた方がいいかもしれません。",
      image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-1.jpeg"),filename:"sample-post-1.jpeg")},

      {user_id:"1",tag_id:"2",flower:"蝋梅",field:"仙台蝋梅園",day:"20210202",star:"4",address:"宮城県仙台市",
      comment:"閉園30分前、、、沈み行く夕日で園内の蝋梅が黄金色に輝きます。マジックアワー！！！",
      image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-2.jpeg"),filename:"sample-post-2.jpeg")},

      {user_id:"1",tag_id:"3",flower:"桜",field:"にいがた園",day:"20210303",star:"3",address:"新潟県新潟市",
      comment:"今年9月に閉園が決まった「にいがた園」の桜です。もう二度と見ることができないと思うとなんだか悲しいですね、、、",
      image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-3.jpeg"),filename:"sample-post-3.jpeg")},

      {user_id:"2",tag_id:"4",flower:"菜花",field:"新宿離宮恩賜公園",day:"20210404",star:"4",address:"東京都新宿区",
      comment:"都会のオアシスです！高層ビルと菜花のコントラストが何とも面白いですね！！",
      image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-4.jpeg"),filename:"sample-post-4.jpeg")},

      {user_id:"2",tag_id:"4",flower:"チューリップ",field:"斉藤さんの家の前の水田",day:"20210404",star:"5",address:"埼玉県秩父市",
      comment:"花の名所ではありませんが、地元の名所です！一度見に来て下さい！！",
      image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-5.jpeg"),filename:"sample-post-5.jpeg")},

      {user_id:"2",tag_id:"5",flower:"芝桜",field:"金沢羊山公園",day:"20210404",star:"4",address:"石川県金沢市",
      comment:"山を登ります、登って、登って、登って、、、辿り着いた、そこには絶景が！！",
      image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-6.jpeg"),filename:"sample-post-6.jpeg")},

      {user_id:"3",tag_id:"6",flower:"薔薇",field:"岐阜植物公園",day:"20210505",star:"3",address:"岐阜県岐阜市",
      comment:"すごい咲いてました！！そして、、、すごい、いっぱい、、、いたんです、、、毛虫が嫌いな方は要注意です、、、",
      image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-7.jpeg"),filename:"sample-post-7.jpeg")},

      {user_id:"3",tag_id:"7",flower:"紫陽花",field:"京都院",day:"20210606",star:"4",address:"京都府京都市",
      comment:"紫陽花寺として有名な「京都院」、うさぎなどの小動物も飼われてました。",
      image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-8.jpeg"),filename:"sample-post-8.jpeg")},

      {user_id:"3",tag_id:"8",flower:"百合",field:"ひろしまゆり園",day:"20210707",star:"5",address:"広島県広島市",
      comment:"丁度、私が行った時に、、、近くの広島ドームでLIVEがあって、最寄りのコンビニが大混雑でした。",
      image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-9.jpeg"),filename:"sample-post-9.jpeg")},

      {user_id:"4",tag_id:"9",flower:"曼珠沙華",field:"讃岐田",day:"20210909",star:"4",address:"香川県讃岐市",
      comment:"曼珠沙華の群生地として、四国でも有名なところです！！",
      image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-10.jpeg"),filename:"sample-post-10.jpeg")},

      {user_id:"4",tag_id:"10",flower:"菊",field:"福岡天神",day:"20211010",star:"3",address:"福岡県福岡市",
      comment:"花の名所として有名ですが、境内では、七五三や結婚式などもい行っております。",
      image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-11.jpeg"),filename:"sample-post-11.jpeg")},

      {user_id:"4",tag_id:"11",flower:"菊",field:"沖縄天神",day:"20211112",star:"4",address:"沖縄県那覇市",
      comment:"私が行った時お祭りみたいになってて、出店なんかも出てました。",
      image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-12.jpeg"),filename:"sample-post-12.jpeg")},

      # {user_id:"",tag_id:"",flower:"",field:"",day:"",star:"",address:"",comment:"",
      # image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/"),filename:"")},
    ]
  )

  admin = Admin.new(:email => 'admin@test.com', :password => "aaaaaa")
  admin.save!

