sian = User.create(
  username: 'siansian',
  first_name: 'Sian',
  email: 'sian.m.stone@gmail.com',
  password: 'foobar',
  role: 2
)

user2 = User.create(
  username: 'best_user_eva',
  first_name: 'Jennifer',
  email: 'test@test.com',
  password: 'foobar',
  role: 0
)

user3 = User.create(
  username: 'second_best',
  first_name: 'Jackson',
  email: 'test@secondtest.com',
  password: 'foobar',
  role: 1
)



post1 = Post.create(
  title: "Some Great Title For a Post",
  published: nil,
  status: 0,
  user: sian,
  content: "this is the content of the blog, which hopefully is going to work and not error on account of missing the javascript packages..."
)

post2 = Post.create(
  title: "I Love Inventing Titles",
  published: nil,
  status: 0,
  user: user2,
  content: "woo content"
)

post3 = Post.create(
  title: "Yay good stuff to read",
  published: nil,
  status: 0,
  user: sian,
  content: "more content yay"
)

post4 = Post.create(
  title: "Tired of this now",
  published: nil,
  status: 0,
  user: user3,
  content: "and even more content isn't it amazing"
)

post5 = Post.create(
  title: "Last one huzzah probably the best title ever written and maybe the longest that will fit in this here field",
  published: nil,
  status: 0,
  user: sian,
  content: "everyone should be tired of content by now"
)
