# codeTears 💧

## _Try not to cry. Cry a lot._

Record your small code victories - save the snippets that once brought you to tears.

> [_Live demo_](https://stop-crying-its-just-code.herokuapp.com/)

## General Information

This project is a Ruby on Rails CRUD app created for General Assembly's software engineering immersive.

I have often wished for a light-hearted little code snippet app to record all the lines that brought me to tears (of frustration, anger, less often joy), so I decided to build one for my second GA project.

My app allows you to organise by boards, lists & add small code blocks in almost any language *(at least - if highlight.js supports it, and if it doesn't...hats off to you for using something *that* obscure)*.  
Your snippet will display the troublesome block for you with syntax highlighting. Delightful.

It uses nested models to display language boards, their lists, and their snippets.

---

# Usage

1. Create a user account with a name, email, and password.  
   Login with your credentials, or use mine if you _really_ cannot be bothered:

> **sarah@cats.com**  
> **chicken**

2. After login, click the void to create a board (_it is entirely safe, pinky promise)._  
   If you remain unconvinced, click "New board" on the top menu nav.

3. All voids are clickable and will create a new object on whatever it is you are on if it is empty - a board, a list.  
   Give your boards/lists a short title and a description.
   Boards are assigned an image from the dropdown menu.

4. Paste your code block as-is into the code block field and it will be formatted after save.
   Snippets can be "pinned" by checking the box on creation or edit. This will save them to the "Pinned Snippets" list for quick retrieval (top menu).

## Gems Used

- [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby) for password authentication
- [acts_as_list](https://github.com/brendon/acts_as_list) for sorting items

## Other things I used

- [Bootstrap](https://getbootstrap.com/) for some styling
- [Highlight.js](https://highlight.js.org) for syntax highlighting
- [Stimulus](https://stimulus.hotwired.dev/) for some not-quite-implemented yet geolocation with js.

## Room for Improvement

- Image upload in the works, eventually...
- Geolocation to pick up the weather, for funsies. Currently just a stupid creepy easter egg on the footer.
- Draggable elements for sorting.
- Top menu hamburger nav is busted, amongst other CSS woes.

## Acknowledgements

Many thanks to...

- Our wonderful & patient TAs, Pat & Rowena. 🐈
- Our wonderful & slightly less patient instructor, Joel. 🐈‍⬛
- Trello - my inspiration and whilst I woefully underperformed in comparison, it's all good. [I'm learnding!](https://youtu.be/TMlyhZpGbwI)
- My loved ones - for putting up with me during project week, when I briefly became a cave troll. 👹
