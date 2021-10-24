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
b1 = Board.create :name => 'JavaScript', :description => 'A close relative of the devil.', :user_id => 1, :image => "js.png"
b2 = Board.create :name => 'CSS', :user_id => 1, :description => 'You make no sense and I love it.', :image => "css.png"
b3 = Board.create :name => 'Ruby', :description => 'I WANT BRACKETS!'
b4 = Board.create :name => 'HTML', :description => 'Old faithful.'
b5 = Board.create :name => 'Rust', :description => 'What they hell is this', :image => 'https://devclass.com/wp-content/uploads/2019/07/rust-logo.jpg'
b6 = Board.create :name => 'C#', :description => 'Sharp or Hash?', :image => 'csharp.png'

puts "#{ Board.count } Boards"

List.destroy_all
l1 = List.create :name => 'JS Loops', :description => 'Loop functions in JavaScript', :position => 1
l2 = List.create :name => 'JS If Statements', :description => 'If/Else Statements', :position => 2
l3 = List.create :name => 'Cool CSS Tricks', :description => 'Random neat things', :position => 1
l4 = List.create :name => 'Center a goddamn div', :description => 'Finish this once and for all.', :position => 2
l5 = List.create :name => 'Ruby Nightmares', :description => 'I almost died', :position => 1
l6 = List.create :name => 'Draw 2D shapes with Canvas', :description => 'Try this to make games at some point', :position => 1
puts "#{ List.count } Lists"



Snippet.destroy_all
s1 = Snippet.create :title => 'JS Loop de Loop', :description => 'a loopy thing that fixes a thing', :pinned => true, :position => 1
s2 = Snippet.create :title => 'JS If Else Am I', :description => 'an if else thing that fixes another thing', :pinned => true, :position => 2
s3 = Snippet.create :title => 'CSS Thing 1', :description => 'Head spinning good times', :pinned => true, :position => 1
s4 = Snippet.create :title => 'CSS Thing 2', :description => 'a cool thing that you should use', :pinned => true, :position => 2
s5 = Snippet.create :title => 'Ruby Thing 1', :description => 'a cool thing that you should use', :pinned => true, :position => 1
s6 = Snippet.create :title => 'Ruby Thing 2', :description => 'another disaster averted', :code_block => '<%= stylesheet_link_tag "prism", media: "all", "data-turbolinks-track": "reload" %>
<%= javascript_pack_tag "prism", "data-turbo-track": "reload", defer: true %>

Rails.application.config.assets.precompile += %w( prism.js prism.css )' ,:pinned => true, :position => 2
s7 = Snippet.create :title => 'HTML Thing 1', :description => 'a cool thing that you should use', :pinned => true, :position => 1
s8 = Snippet.create :title => 'HTML Thing 2', :description => 'another cool thing', :code_block => '<!doctype html> <html> <head>
<title>TechTerms.com</title></head><body><p>This is an example of a paragraph in HTML.</p></body></html>', :pinned => true, :position => 2
puts "#{ Snippet.count } Snippets"


# Assocations ##################################################################

l1.snippets << s1 # 
l2.snippets << s2 # or here slapping snippet onto list
l3.snippets << s3
l4.snippets << s4
l5.snippets << s5 << s6
l6.snippets << s7 << s8

puts "Snippets onto lists"

b1.lists << l1 << l2
b2.lists << l3 << l4
b3.lists << l5
b4.lists << l6
puts "Lists onto boards"

puts "Boards and users"
u1.boards << b1 << b2 << b5 << b6# boards assigned to a user.
u2.boards << b3 << b4
