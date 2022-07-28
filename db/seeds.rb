# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require "open-uri"
require "faker"

User.destroy_all
Post.destroy_all

p 'cleaning the db!'

p user1 = User.create!(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name, username:Faker::Internet.username, email:Faker::Internet.email, password: Faker::Internet.password(min_length: 8))
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn7n_hjrfOEgfm7CTRjgTURpIw1IN0Yp4pBQ&usqp=CAU')
user1.prof_pic.attach(io: file, filename: "#{user1.first_name}.png")
user1.save!

p user2 = User.create!(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name, username:Faker::Internet.username, email:Faker::Internet.email, password: Faker::Internet.password(min_length: 8))
file = URI.open('https://thypix.com/wp-content/uploads/2021/11/sponge-bob-profile-picture-thypix-m.jpg')
user2.prof_pic.attach(io: file, filename: "#{user2.first_name}.png")
user2.save!

p user3 = User.create!(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name, username:Faker::Internet.username, email:Faker::Internet.email, password: Faker::Internet.password(min_length: 8))
file = URI.open('https://i0.wp.com/www.followchain.org/wp-content/uploads/2022/03/good-tiktok-profile-picture-8.jpg?resize=414%2C403&ssl=1')
user3.prof_pic.attach(io: file, filename: "#{user3.first_name}.png")
user3.save!

p user4 = User.create!(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name, username:Faker::Internet.username, email:Faker::Internet.email, password: Faker::Internet.password(min_length: 8))
file = URI.open('https://www.neurosciencemarketing.com/wp-content/uploads/2016/08/mona-lisa.jpg')
user4.prof_pic.attach(io: file, filename: "#{user4.first_name}.png")
user4.save!

post = Post.new(
  title: 'Doritos',
  rating: Faker::Number.between(from: 1, to: 5),
  country: "USA",
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vel ultricies mi, sed mollis lectus. Etiam euismod nibh mi, quis pellentesque turpis congue in. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam non eleifend ex. Ut varius vitae ex id dapibus. Etiam semper, nisl in ultrices placerat, neque mauris mollis nisi, mattis varius nulla dolor id arcu. Donec in sem augue. Praesent eros magna, feugiat vel varius vel, dapibus sed libero. Maecenas a efficitur neque, vel viverra arcu.",
  brand: "Doritos",
  user_id: user1.id,
  address: "123 Main St, New York, NY 10001"
)
file = URI.open('https://m.media-amazon.com/images/I/91h01BNlDPL._SL1500_.jpg')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Cool Ranc Doritos",
  rating: Faker::Number.between(from: 1, to: 5),
  country: "USA",
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce iaculis, risus id molestie interdum, tortor mauris pulvinar justo, a gravida purus justo congue quam. Duis efficitur lorem eget lacinia vehicula. Mauris lacus mauris, tincidunt nec cursus id, vestibulum id ligula. Mauris ut ante arcu. Integer faucibus elementum mauris, et malesuada lorem. Integer et scelerisque justo, nec aliquet mauris. Donec pellentesque risus sit amet velit imperdiet sodales. Sed tortor mauris, posuere non felis in, scelerisque rutrum lacus.",
  brand: "doritos",
  user_id: user2.id,
  address: "Calle de Monteleon 44, Madrid, Madrid, 28010"
)
file = URI.open('https://m.media-amazon.com/images/I/81-DyMXy6tL._SX679_PIbundle-64,TopRight,0,0_AA679SH20_.jpg')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Flaming hot cheetoes",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin et turpis sed turpis vehicula ullamcorper. Integer lorem justo, consequat et pharetra viverra, tincidunt sed quam. Sed ultrices risus arcu, nec luctus nibh maximus ut. Aliquam at scelerisque elit, eget accumsan purus. Ut quis venenatis purus. Mauris sed sodales arcu. Duis ac iaculis est. Etiam blandit fringilla quam. Cras sollicitudin luctus mattis. Morbi eleifend dui id leo iaculis, eu consequat tortor bibendum. Suspendisse euismod mollis porttitor. Nullam suscipit nulla nec lobortis sagittis.  ",
  brand: "frito lay",
  user_id: user3.id,
  address: "Calle de Monteleon 29, Madrid, Madrid, 28010"
)
file = URI.open('https://www.cheetos.com/sites/cheetos.com/files/2019-02/Cheetos%20Crunchy%20Flamin%27%20Hot_1.png')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Haribo Beerentraum",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer at nisl in felis maximus pulvinar. Aenean vel purus ipsum. Suspendisse maximus nisl felis, non bibendum nibh consectetur ut. Fusce porttitor est eu ipsum facilisis elementum. Duis pretium quis augue ac blandit. Cras rhoncus tortor in dictum gravida. Donec fermentum rutrum feugiat. Quisque sagittis nibh ex, vel volutpat leo faucibus non. Nam nec turpis eu enim ornare posuere sit amet at ex. Pellentesque vehicula et velit eu placerat. Donec et dignissim mauris. Curabitur nec varius sapien, eu dictum velit. Proin non lectus a dui finibus posuere. Phasellus at dolor at tortor iaculis vestibulum eget eu dui. Nam luctus purus id nulla interdum, in consectetur magna mollis.  ",
  brand: "haribo",
  user_id: user4.id,
  address: "Calle San Bernardo 55, Madrid, Madrid"
)
file = URI.open('https://c-pi.niceshops.com/upload/image/product/large/default/haribo-berry-dream-soft-100-g-957841-es.jpg')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Haribo fun time",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tristique quam et lorem gravida mattis nec ut tortor. Aliquam posuere purus sed tempor egestas. Praesent quis congue lorem, non sagittis nisi. Suspendisse congue arcu metus, at vestibulum quam venenatis at. Integer malesuada lectus diam, in consequat ante scelerisque sed. Mauris sit amet porta arcu. Vivamus consequat massa sit amet interdum dapibus. Pellentesque sed leo vel ante auctor gravida et id odio. Vivamus tincidunt vulputate gravida. Morbi eu ullamcorper arcu, in ultrices mi. Vivamus blandit tellus quis tincidunt vulputate.",
  brand: "haribo",
  user_id: user1.id,
  address: "9102 country canyon cove, austin, tx 78759"
)
file = URI.open('https://www.confitelia.com/4367-big_default/yummi-time-gummies-haribo.jpg')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Daim",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nulla arcu, semper in rhoncus et, lobortis eget turpis. Duis mattis dapibus lorem, sed consectetur massa gravida at. Vivamus in elit ac orci euismod sodales. Maecenas commodo leo turpis, eu auctor dui iaculis in. Vestibulum eget ex non nulla bibendum malesuada at vitae mi. Mauris accumsan nulla et cursus egestas. Vestibulum tempus luctus leo nec eleifend. Duis quis pulvinar purus, non accumsan odio. Curabitur eu sapien id nibh porta dictum porta non nulla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam finibus suscipit mi, sit amet malesuada sapien sagittis at.  ",
  brand: "Daim",
  user_id: user1.id,
  address: "C. de Eguilaz, 2, 28010 Madrid"
)
file = URI.open('https://www.france-export-fv.com/WebRoot/epagesFR/Shops/6449c484-4b17-11e1-a012-000d609a287c/54EB/53E3/7CA5/5BEB/D62D/0A0C/05EE/54E9/Daim.jpg')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Carrefour kids palomita",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas at est mauris. Donec vulputate, orci nec gravida scelerisque, sapien velit elementum quam, non ultrices ipsum lectus sed neque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam ultrices pellentesque mauris, ut facilisis turpis interdum at. Proin sit amet cursus diam. Duis volutpat egestas nisl ut rhoncus. Morbi laoreet gravida turpis, sit amet tempus odio tempor quis. Phasellus ac neque nec purus mattis vestibulum. Donec mollis ultrices nisi, eget commodo mauris aliquam non. ",
  brand: "Carrefour",
  user_id: user4.id,
  address: "C. de Vallehermoso, 36, 28015 Madrid"
)
file = URI.open('https://static.carrefour.es/hd_510x_/img_pim_food/908921_00_1.jpg')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Takis blue heat",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec augue et lectus commodo iaculis. Nulla eu ex eu risus lobortis aliquet. Cras congue rhoncus massa, at tincidunt lectus egestas vel. Proin ut urna non augue mattis sagittis. Vivamus mattis turpis cursus, feugiat nunc id, ultricies nibh. Nunc quis est faucibus, tempor mi vehicula, accumsan augue. Nulla aliquet sem et odio facilisis, a aliquet dui gravida. Sed vel dapibus nisi.",
  brand: "Takis",
  user_id: user4.id,
  address: "C. de Rafael Calvo, 40, 28010 Madrid"
)
file = URI.open('http://cdn.shopify.com/s/files/1/0598/8456/8760/products/takisblueheat_1024x1024.jpg?v=1643911277')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "XXtra hot flaming hot cheetoes",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec augue et lectus commodo iaculis. Nulla eu ex eu risus lobortis aliquet. Cras congue rhoncus massa, at tincidunt lectus egestas vel. Proin ut urna non augue mattis sagittis. Vivamus mattis turpis cursus, feugiat nunc id, ultricies nibh. Nunc quis est faucibus, tempor mi vehicula, accumsan augue. Nulla aliquet sem et odio facilisis, a aliquet dui gravida. Sed vel dapibus nisi.",
  brand: "Cheetoes",
  user_id: user3.id,
  address: "C. de Antonio Acuña, 18, 28009 Madrid"
)
file = URI.open('https://www.cheetos.com/sites/cheetos.com/files/2019-03/XXXtra%20Flamin%20Hot%20Crunchy_v2_0.png')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Four Loko sandia",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In efficitur orci ex, vel posuere lorem pretium vel. Phasellus eu mauris imperdiet, pharetra ante ut, dapibus enim. Aenean faucibus, urna auctor ullamcorper mattis, eros justo cursus elit, ut mollis orci leo vel felis. Quisque porta ipsum in dolor tristique accumsan. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus eu leo quam. Duis porttitor lobortis risus.",
  brand: "Four Loko",
  user_id: user3.id,
  address: "Calle de José Abascal, 61, 28003 Madrid"
)
file = URI.open('https://cdn.shopify.com/s/files/1/0586/7470/8672/products/4lokosandia_1024x1024.jpg?v=1636489438')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Cherry Coke",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra ultrices tempus. Nam eros augue, maximus at egestas eget, tempus vel massa. Phasellus auctor quis orci ac facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla eget diam sit amet erat tincidunt sodales id ac lectus. Praesent sodales aliquam sollicitudin. Ut purus lacus, consectetur quis gravida eget, blandit et nisi",
  brand: "CocaCola",
  user_id: user2.id,
  address: "C. de Álvarez Gato, 9, 28012 Madrid"
)
file = URI.open('https://cdn.shopify.com/s/files/1/0015/0611/5642/products/Untitled_design_67_1200x.png?v=1573260078')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Cherry Vanilla Coke",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac erat aliquet justo volutpat vehicula. Vivamus vel elementum purus. Suspendisse dapibus ipsum et massa hendrerit, quis rhoncus sapien sagittis. Mauris volutpat, nibh non ultrices tempus, arcu odio euismod mi, et efficitur nisl dui vel mi. Morbi lacinia rutrum viverra. Phasellus eget placerat nunc, vitae ullamcorper ante. Integer non auctor arcu, quis sagittis metus.",
  brand: "CocaCola",
  user_id: user4.id,
  address: "C. de Alberto Aguilera, 20, 28015 Madrid"
)
file = URI.open('https://m.media-amazon.com/images/I/41hjl8yP2zL.jpg')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Cherry Vanilla Coke",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac erat aliquet justo volutpat vehicula. Vivamus vel elementum purus. Suspendisse dapibus ipsum et massa hendrerit, quis rhoncus sapien sagittis. Mauris volutpat, nibh non ultrices tempus, arcu odio euismod mi, et efficitur nisl dui vel mi. Morbi lacinia rutrum viverra. Phasellus eget placerat nunc, vitae ullamcorper ante. Integer non auctor arcu, quis sagittis metus.",
  brand: "CocaCola",
  user_id: user4.id,
  address: "C. de Alberto Aguilera, 20, 28015 Madrid"
)
file = URI.open('https://m.media-amazon.com/images/I/41hjl8yP2zL.jpg')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Maxibon pops",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "orem ipsum dolor sit amet, consectetur adipiscing elit. Proin lacus orci, varius at quam sit amet, lobortis pharetra neque. Proin magna risus, molestie pellentesque lectus et, pulvinar ultricies metus. Pellentesque ac vehicula purus. Fusce sem lorem, ullamcorper a blandit nec, tristique sit amet enim. Sed sollicitudin ut ",
  brand: "Maxibon",
  user_id: user4.id,
  address: "C. de la Cava Baja, 42, 28005 Madrid"
)
file = URI.open('https://www.bahiaprincipecongelados.com/fotos/reducidas/800-maxibon-pops-crunch-12-unidades-helados-nestle-1-1582.jpg')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Maxibon Cereal Mix",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget mauris non ipsum viverra pellentesque. Curabitur bibendum erat sit amet justo pharetra tempor. Suspendisse malesuada enim eget est fermentum, in vestibulum massa pellentesque. Mauris malesuada lacinia turpis nec placerat. Etiam a ",
  brand: "Maxibon",
  user_id: user4.id,
  address: "C. Amador de los Ríos, 6, 28010 Madrid"
)
file = URI.open('https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/202106/15/00118953908144____7__600x600.jpg')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "MMMax Milka Biscuit Galleta",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "inia vestibulum arcu. Nullam suscipit gravida volutpat. Cras ex sapien, malesuada ac est ac, varius congue sem. Fusce ac sem in odio bibendum cursus vel non purus. Phasellus euismod vitae ante eget gravida. Morbi varius pharetra mauris, at sagittis dui vehicula eget. Curabitur ac dapibus nisl. Sed ante enim, porttitor commodo odio quis, vestibulum rhoncus erat. Quisque augue purus, vulputate consectetur tristique varius, ultricies ut eros.",
  brand: "Milka",
  user_id: user2.id,
  address: "C. de San Dimas, 3, 28015 Madrid"
)
file = URI.open('https://www.milka.es/-/media/Project/Brands/Milka/es/Hero-Carousel/milka-choco-swing-biscuit-galleta_780x480_tilted.png?h=480&w=780&hash=8A7F8525F245C0C809EE7F1088F9D3CE')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

post = Post.new(
  title: "Oreo Toffee Crunch",
  rating: Faker::Number.between(from: 1, to: 5),
  country: Faker::Address.country_code,
  review: "Etiam ac malesuada est, et porta nisi. Aenean eleifend velit quam, at dictum urna condimentum nec. In tellus magna, posuere pulvinar dui vitae, lacinia vestibulum arcu. Nullam suscipit gravida volutpat. Cras ex sapien, malesuada ac est ac, varius congue sem. Fusce ac sem in odio bibendum cursus vel non purus. Phasellus euismod vitae ante eget gravida. Morbi varius pharetra mauris, at sagittis dui vehicula eget. Curabitur ac dapibus nisl. ",
  brand: "Oreo",
  user_id: user2.id,
  address: "C/ Gran Vía, 30, 28013 Madrid"
)
file = URI.open('https://www.oreo.com/media/catalog/product/cache/e95618f36a44fdfd08c1d13eb64bc814/0/0/sx00044000071967_cf_u1c1_gs1_jpeg.jpg.pagespeed.ic.Ha51fwTPcY.jpg')
post.image.attach(io: file, filename: "#{post.title}.png", content_type: 'image/png')
post.save
p post

p "Finished Seeding!"
