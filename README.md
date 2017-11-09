# Two-sided Marketplace - Office documents translation portal

So for my Rails app project I have decided to create a two-sided marketplace between office workers and freelance (or aspiring) translators.


Why?

Because this is based on my work experience where I was paid to translate some documents from Japanese to English for business purposes. 
Although I am not a professional translator, I was actually enjoying the task (in fact I once thought of becoming a translator) so I thought it would be good if there is a portal for business people who need decent translations and translators who want to earn some.

<img src="https://github.com/okichan/wordsworth/blob/master/app/assets/images/flow.png" alt="How this app works" width=400 />

## User story

<a href="https://trello.com/b/taAJv1hw"><img src="https://github.com/okichan/wordsworth/blob/master/app/assets/images/userstory.PNG" alt="Trello" width=700 /></a>


## Framework
I got inspiration from old-fashioned dictionaries so main font is serif (Vollkorn) with logo being calligraphy (Tangerine).
The colour scheme is deep green with touch of golden yellow (like old dictionaries, you know).  

[![Figma link](https://github.com/okichan/wordsworth/blob/master/app/assets/images/figma.PNG "Figma")](https://www.figma.com/file/DOENyU8PeCqCaMp0RDLROemX/Wordsworth)


## ERD

![DBdesigner](app/assets/images/erd.png "DBdesigner")

I also found this service called SmartDraw which helped me visualising 1:n relationship etc.
I could only get to use once though because I had to pay.

![SmartDraw](app/assets/images/erd2.PNG "SmartDraw")

## Gems used
- Bootstrap
- Devise
- Shrine and its dependencies
- Dotenv
- Stripe
- Rspec
- Mailgun
- Ransack

## Struggles and lessons learnt
### Shrine!!! 
- Upload failed all the time. It took me several days to investigate the cause and finally discovered that it had to do with JPG's image resizing error with Shrine's dependencies (ImageMagick I think, it wasn't even Shrine's fault after all).
- Although now I know where the error comes from and it is to do with the discrepancies in build version, I wasn't able to fix it.
- So I disabled resizing function for a temporary fix. At least I made it work!

### Stripe!
- Had so much fun figuring out how to pass `params`. I worked it around by using `session[:id]` thing.
- I gave up implementing function where it redirects back to where you were after the payment is made via Stripe.
- In the end I added `true`/`false` column to the databae and restrict ceratin actions based on that boolean. (eg your post won't be published unless `paid` boolean is `true`.) 

### I thought I had planned well.
- I was first thinking of Stack Overflow kind of portal where a question can have multiple answers, however the more I work on it the clearer it became that this is not going to work out as I planned.
- To be specific, I was stuck where to implement payment system. My initial idea was something like you need to pay if you post more than certain amount of times.
- However when I considered a two-sided marketplace, I was thinking to myself "Would translators be benefitted by this model when they're doing it for free? Is this even a two-sided market? Would I sign up as a translator?"
- Answer to all the questsions were NO. 
- So I changed my direction to be more of AirTasker.
- Thus I had to redesign my framework of course, and re-write hundreds of codes which I spent hell a lot of hours on. Learning opportunity yay.


## Challenges
### My introversion.
- When I got stuck, I spent too many hours solving it myself when all I had to do is just ask.
- I was hesitant because I wasn't sure if I can explain my situation and problems well, like where should I begin with my stories, I felt I need to explain EVERYTHING and I just felt "meh I will figure out myself".
- I don't think it's a good practice because that's how you actually update your progress with others (and not leaving them wondering what on earth I've been up to).


### Re-modelling to suit my capability.
- Not always what I pictured took place because of my technical capability.
- I had to give up some features and in return realisticality was sacrificed a bit.


## What to do next?
- Full Shrine implementation. Figure out resizing issues.
- Action Cable for real-time chat.
- Figure out how Stripe pays out to other account..
- UX design.


## https://wordsworth.herokuapp.com/
 <br />
  <br />
Me 95% of the time
<img src="app/assets/images/new_error.jpg" />
