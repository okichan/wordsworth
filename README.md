# Two-sided Marketplace - Office email translation portal

So for my Rails app project I have decided to create a two-sided marketplace for office workers who need translations / proofreading for their emails.

Why?

Because this is based on my personal experience where I was asked for Japanese translations for someone who needs to compose an email (or some sort of documents) in a language other than their own, and they ended up feeling guilty asking so many times that they resort to Google tranlsation (probably a bad idea).

Also I have come across multiple situations where I wish someone can proofread my emails to see if it sounds 'business' enough, whether it's English or Japanese.

Detailed User Story can be found in Trello. 

## User story

[![Trello link](https://github.com/okichan/wordsworth/blob/master/app/assets/images/userstory.PNG)](https://trello.com/b/taAJv1hw)

## Framework
The one with yellow background, I personally prefer this but it did not give much sense of formality so had to ditch it.
Then I got inspiration from old-fashioned dictionaries so fonts are all serif, the colour scheme is deep green with touch of yellow (like cover, you know).  
For font pairing, I was first to mix serif and sans-serif but sans-serif just didn't feel right, so I went for calligraphy (logo - Tangerine) and serif (body - Vollkorn).

[![Figma link](https://github.com/okichan/wordsworth/blob/master/app/assets/images/figma.PNG "Figma")](https://www.figma.com/file/DOENyU8PeCqCaMp0RDLROemX/Wordsworth)


## ERD

I found this service called SmartDraw which I found better visualised than DBdesigner.

![DBdesigner](app/assets/images/erd.png "DBdesigner")
![SmartDraw](https://github.com/okichan/wordsworth/blob/master/app/assets/images/erd2.PNG "SmartDraw")

## Gems used
- Bootstrap
- Devise
- Shrine and its dependencies
- Dotenv
- Rspec
- Mailgun

## Struggles
- Shrine, man. Upload failed all the time. It took me several days to investigate the cause and finally discovered that it had to do with JPG's image resizing error with Shrine's dependencies (ImageMagick or GraphicsMagick, it wasn't even Shrine's fault after all).
- Although now I know where the error comes from and it is with its resizing feature, I wasn't able to fix it.
- So I disabled resizing function for a temporary fix.
