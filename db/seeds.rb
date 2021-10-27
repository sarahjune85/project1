# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
u1 = User.create :email => 'sarahjune@gmail.com', :name => 'Sarah', :password => 'chicken', :admin => true
u2 = User.create :email => 'louis@cats.com', :name => 'Smelly Louis', :password => 'chicken'
u3 = User.create :email => 'garry@cats.com', :name => 'The Bean', :password => 'chicken'
puts "#{ User.count } users"

Board.destroy_all
js = Board.create :name => 'JavaScript', :description => 'A close relative of the devil.', :image => "js.png"
css = Board.create :name => 'CSS', :description => 'Descent into madness', :image => "css.png"
ruby = Board.create :name => 'Ruby', :description => 'I WANT BRACKETS!', :image => "ruby.png"
html = Board.create :name => 'HTML', :description => 'Old faithful.', :image => "html.png"
rust = Board.create :name => 'Rust', :description => 'What they hell is this', :image => 'rust.png'
csharp = Board.create :name => 'C#', :description => 'Sharp or Hash?', :image => 'csharp.png'
java = Board.create :name => 'Java', :description => 'You never forget your first.', :image => 'java.png'
python = Board.create :name => 'Python', :description => 'The cool new kid on the block', :image => 'python.png'
fortran = Board.create :name => 'Fortran', :description => 'Old man energy', :image => 'fortran.png'
puts "#{ Board.count } Boards"

List.destroy_all
js1 = List.create :name => 'JS Loops', :description => 'Loop functions in JavaScript'
js2 = List.create :name => 'JS If Statements', :description => 'If/Else Statements'
css1 = List.create :name => 'Cool CSS Tricks', :description => 'Random neat things'
css2 = List.create :name => 'Center a goddamn div', :description => 'Finish this once and for all.'
ruby1 = List.create :name => 'Ruby Nightmares', :description => 'I almost died'
html1 = List.create :name => 'Draw 2D shapes with Canvas', :description => 'Try this to make games at some point'
rust1 = List.create :name => 'Rust For Loops', :description => 'Hopefully we never go here'
puts "#{ List.count } Lists"


Snippet.destroy_all
s1 = Snippet.create :title => 'JS Loop de Loop', :description => 'a loopy thing that fixes a thing', :code_block => 'for (let i = 0; i < 10; i++) {
  // some code
}', :pinned => true
s2 = Snippet.create :title => 'JS Arrays', :description => 'store multiple values in a single variable', :code_block => 'const cars = [
  "Saab",
  "Volvo",
  "BMW"
];', :pinned => true
s3 = Snippet.create :title => 'CSS Thing 1', :description => 'Head spinning good times', :code_block =>'h1 {
  color: white;
  text-align: center;
}

p {
  font-family: verdana;
  font-size: 20px;
}', :pinned => true
s4 = Snippet.create :title => 'CSS Thing 2', :description => 'a cool thing that you should use', :code_block => '#myDiv {
  transform: rotateY(150deg);
}', :pinned => true
s5 = Snippet.create :title => 'Ruby Thing 1', :description => 'a cool thing that you should use', :pinned => true
s6 = Snippet.create :title => 'Ruby Thing 2', :description => 'another disaster averted', :code_block => '<%= stylesheet_link_tag "prism", media: "all", "data-turbolinks-track": "reload" %>
<%= javascript_pack_tag "prism", "data-turbo-track": "reload", defer: true %>
Rails.application.config.assets.precompile += %w( prism.js prism.css )' ,:pinned => true
s7 = Snippet.create :title => 'HTML Thing 1', :description => 'a cool thing that you should use', :pinned => true
s8 = Snippet.create :title => 'HTML Thing 2', :description => 'another cool thing', :code_block => '<!doctype html> <html> <head>
<title>TechTerms.com</title></head><body><p>This is an example of a paragraph in HTML.</p></body></html>', :pinned => true
puts "#{ Snippet.count } Snippets"
s9 = Snippet.create :title => 'Rust For Loop', :description => 'No thanks', :code_block => 'let mut x = vec![1, 2, 3];

while let Some(y) = x.pop() {
    println!("y = {}", y);
}', :pinned => true
puts "#{ Snippet.count } Snippets"


# Assocations ##################################################################

js1.snippets << s1 # 
js2.snippets << s2 # or here slapping snippet onto list
css1.snippets << s3
css2.snippets << s4
ruby1.snippets << s5 << s6
html1.snippets << s7 << s8
rust1.snippets << s9
puts "Snippets onto lists"

js.lists << js1 << js2
css.lists << css1 << css2
ruby.lists << ruby1
html.lists << html1
rust.lists << rust1
puts "Lists onto boards"


u1.boards << js << css << rust << csharp << java << python << fortran # boards assigned to a user.
u2.boards << ruby << html
puts "Boards onto users"