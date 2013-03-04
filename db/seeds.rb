# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create users
10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "password")
end

# Create Posts and Comments

# Post 1
post = Post.create(title: 'My game was just featured in the Windows 8 app store, what do I do next?',
					content: "I'm a longtime lurker of these forums and after reading your stories for years I took the plunge and started a company to focus on making indie games. It's just me working my tail off and trying to create something original and fun. So far I've shipped two games and have a third one on the way.
The reality is I'm an engineer at heart and terrible at marketing. Just when I was starting to give up hope on my first game Adlib (http://spottedzebrasoftware.com/app/adlib) I found it was going to be featured in the Windows 8 app store! Now that it's happening I want to try to do everything I can to make hay while the sun is shining. I truly believe in this game and know from a previous version that its fans love it.

From those of you who have been down this road can you give me some tips on how I can best take advantage of this event? In particular, what advice do you have in order to reach new customers?",
					user_id: rand(9) + 1)

Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "I'd spend some time learning how to hack the press and try to get some free publicity.
This is a good place to start:
http://onstartups.com/tabid/3339/bid/80121/How-To-Get-Media-...
You want to give them a pre-packaged story and from a quick look around your site, you appear to have one (ex-MSFT guy who moved to Amsterdam, built an awesome game and it's now featured in the app store - that's a story).
You might consider reaching out to the Microsoft PR department. They want as much good publicity for the app store as they can get - so they might be willing to put some PR muscle behind you and your game.
My background is in marketing (and I lived in Amsterdam for a year haha) feel free to shoot me an email if you run out of ideas. Good luck!")

Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "If you want to make money in games and reach a large audience you absolutely, positively need to be on iOS, then Android before you are on Win8. According to your bio, you used to work @ MSFT so I understand the choice of platform but you want to keep making games, right?
I would take a close look at your retention rates and find where people are dropping out of the game and use that information to make the best iOS version possible.
It looks like a great game and will translate well to touch interfaces. Do it.")

Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "You might be lucky enough to break even if you charge for your app. Don't expect miracles from the win 8 app store.")
Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "That's a nice concept! Do you do languages other than English? Or is there some API non-English developers or linguists can add new languages or specific knowledge domains?")
Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "Featuring doesn't really have a big impact - take it from someone who has had two apps featured on the w8 store.")
Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "I like the concept. Combining tetris and word finding is a neat gameplay mechanic.")

# Post 2

post = Post.create(title: 'I turned my personal site into a Point & Click adventure What do you think?',
					content: "Introducing Raminibar - Personal site turned Point & Click adventure!
What is a personal site? For many years, I have been keeping a page where I'd list some info about me and occasionally update my blog. This made the format somewhat cold and impersonal. I decided to make this site into something more like me. I hope you'll like it.

http://raminibar.com",
					user_id: rand(9) + 1)

Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "Nice - but you need some background or edging to the text. The light green is too hard to read on the graphics at the top.
")
Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "Unexpectedly awesome!
I kinda wish you could navigate from it though. Eg: When I click on the TED laptop, load the talk in below.")

# Post 3

post= Post.create(title: "Even Google can't remember that the Samsung Chromebook isn't a MacBook Air",
			content: "Ok, so this is obviously a simple designer's error, but it is one rich in karmic potential. Sharp-eyed writer Kyle Gray picked out an interesting graphic on a section of YouTube's site here.",
			user_id: rand(9) + 1)
Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "What happened is that whoever created this graphic was probably using Photoshop on a Mac. They grabbed a browser window from their machine to use for the image on the chromebook display.
I've seen this (an obviously out-of-place UI element) in a lot of advertising graphics over the years. It tips you off as to what platform the designer was using.")
Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "Cloud-centric, DRM based Linux that depends on the panopticon of Google. Better to bury it stillborn than to discuss it.")
Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "This kind of thing happens all the time. I know Microsoft has been caught using stock images of people using macs to advertise Windows.
")
	Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "Looks like someone is getting fired...")

# Post 4
post = Post.create(title: "40 Years After an Acid Attack, a Life Well Lived",
	content: "Joshua A. Miele, here in San Francisco, was 4 when a next-door neighbor came to the gate of his family home in Brooklyn and tossed sulfuric acid into his face, blinding him.",
	user_id: rand(9) + 1)
Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "interesting as this again was done by a deeply disturbed individual, a paranoid schizophrenic.
society since then has not gotten better at identifying threats coming from sick people. down to sandy hook, the completely insane individual is left alone until he/she commits an atrocity.")
Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "> But he said hers were wasted words.
> \"That's so fascinating,\" he said, \"but you know, it wouldn't have made a difference. I was a cautious kid. I knew who was outside the gate. I knew Bassy. You would have opened it, too.\"
I can't imagine the trust issues one would have after going through this. If a stranger does something, it can be explained away. But if it is someone you know, makes it much more difficult.")
Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "I'm certain I've seen Dr. Miele in the BART before.
Everyone (myself included, which I am ashamed of) did everything to not stare at him nor look in his direction which of course would have been glaringly and awkwardly obvious to anyone observing the scene.
Reading this article, his body of work is fascinating. Part of me hopes that if I ever see him again during one of my commutes, I'll have the courage to go up to him and ask him questions about all the cool stuff he's done.")
Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "A brilliant story, well written.
There have been a few horrific stories of cultural backwards attacking women with acid in the UK press. It's made me far more cautious when handling automotive batteries.
I won't move a car battery ever again without wearing safety goggles.")

# Post 5
post = Post.create(title: "Am I allowed to reverse engineer an Internet service and blog about it?",
	content: "I've been working lately with a reverse proxy to pen test our own app and I actually see some very interesting network traffic on both my laptop and my phone. I would like to investigate services I use and blog about how they work. I find it being very instructive but fear potential legal consequences.
Examples of such services are iCloud, Dropbox, Facebook, etc..",user_id: rand(9) + 1)
Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "Most of these services have public documentation about how they work in terms of network oriented APIs, or failing that some sort of SDK whose structure will typically be representative of the network traffic. For example this is what Dropbox say https://www.dropbox.com/developers/core/api
You can reverse engineer protocols for the purposes of interoperability in Europe. However there are various fine print details that matter and changes in the last few years. The wikipedia page has a summary and references to the legislation http://en.wikipedia.org/wiki/Reverse_engineering#European_Un...
However if those services have been written correctly they will be using SSL and you shouldn't be able to see what is going on with network sniffers (other than DNS names and traffic analysis).
That means reverse engineering the software which is hard and time consuming (eg you need to know assembly and using debuggers at that level). Some like Skype use anti-reverse engineering techniques. Tools like IDA help as a starting point.
However chances are that all that software you downloaded had some sort of click agreement that you agreed to saying you won't reverse engineer the software. That adds another layer of legal issues you need to address.")
Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "Interesting, how do folks who find security holes and blog about it get around this type of thing? I imagine you are worried about this, or IP issues?")
	Comment.create(user_id: rand(9) + 1, post_id: post.id, body: "You can actually analyse most ssl traffic with a man in the middle proxy. All you need to do is to reencrypt the the data with your own certificate and accept to signing certificate as trusted on your computer.
SSL is not obfuscation, it is about maintaining a chain of trust.")

Post.all.each do |post|
	User.all.sample(rand(7)).each do |u|
		u.like!(post)
	end
end

Comment.all.each do |post|
	User.all.sample(rand(7)).each do |u|
		u.like!(post)
	end
end
		

