lapis = require "lapis"

class extends lapis.Application
    [chat: "/chat"]: =>
        @title = "Chat on Discord"
        @html ->
            h2 "My Discord Server"
            div ->
                iframe src: "https://discordapp.com/widget?id=98612945000345600&amp;theme=dark", width: 350, height: 500, allowtransparency: true, frameborder: 0
            h2 "YouTuber Gamers"
            p ->
                text "Kind of ghost town right now, but "
                em "you"
                text " can fix that."
            div ->
                iframe src: "https://discordapp.com/widget?id=98996659454775296&amp;theme=dark", width: 350, height: 500, allowtransparency: true, frameborder: 0
            h2 "Kerbal Warfare"
            p "(Will be) Used for organizing multiplayer Kerbal warfare."
            div ->
                iframe src: "https://discordapp.com/widget?id=115597534726062086&amp;theme=dark", width: 350, height: 500, allowtransparency: true, frameborder: 0

    [contact: "/contact"]: =>
        @title = "Contact Info"
        @html ->
            link rel: "stylesheet", href: @build_url "static/css/pure-min.css"
            link rel: "stylesheet", href: @build_url "static/css/contact.css"

            div id: "container", ->
                h1 "Contact Info"
                ul ->
                    li ->
                        text "Email: "
                        a href: "mailto:paul.liverman.iii@gmail.com", "paul.liverman.iii@gmail.com"
                    li ->
                        text "Discord (my server): "
                        a href: "https://discord.gg/0Y9OTJpXWhFJBEMX", target: "_blank", "invite link"
                    li ->
                        text "Twitter: "
                        a href: "https://twitter.com/guard13007", target: "_blank", "@Guard13007"
                    li ->
                        text "Player.me: "
                        a href: "https://player.me/guard13007", target: "_blank", "Guard13007"
                p ->
                    text "Do "
                    em "not"
                    text " send messages to my YouTube inbox."

    [faq: "/faq"]: =>
        @title = "Frequently Asked Questions"
        @html ->
            link rel: "stylesheet", href: @build_url "static/css/pure-min.css"
            link rel: "stylesheet", href: @build_url "static/css/faq.css"

            div id: "container", ->
                h1 "Frequently Asked Questions"
                p "I get asked some questions a lot more often than others...so here are those answers:"
                hr!

                h2 "YouTube"

                dl ->
                    dt -> a name: "specs", "What are your computer's specs?"
                    dd -> ul ->
                        li ->
                            b "CPU"
                            text ": FX-6300 (6-core 3.5 GHz AMD)"
                        li ->
                            b "GPU"
                            text ": HD-7850 (1 GB VRAM, AMD)"
                        li ->
                            b "RAM"
                            text ": 16 GB DDR3 (1600 MHz or whatever)"
                        li ->
                            b "SSD"
                            text ": Samsung Evo 840 something (250 GB)"
                        li ->
                            b "HDD"
                            text ": WD Blue 1 TB 7200rpm 64 MB cache (x2)"

                    dt -> a name: "ksp-next-plane-reviews", "When is the next Plane Reviews episode?"
                    dd "When I have the time to make it. It takes several hours to make each one, and I don't have a solid chunk of time for that as often as I used to."

                    dt -> a name: "ksp-modlist", "What KSP mods are you using?"
                    dd ->
                        text "That changes often, "
                        a href: "https://gist.github.com/Guard13007/5ef8446c40d7a0f312c3", "here is a list"
                        text " of all mods I use, sorted into categories."

                    dt -> a name: "ksp-submit-plane", "How do I send you a KSP plane?"
                    dd ->
                        p ->
                            text "It's not finished yet, but you can submit them "
                            a href: @url_for("ksp_submit_crafts"), "here"
                            text ". Until that's finished, I recommend uploading your craft to "
                            a href: "https://kerbalx.com/", target: "_blank", "KerbalX"
                            text " and adding it to my public hanger. The interface is pretty bad, but it looks "
                            a href: @build_url("static/img/faq/public-hanger.png"), target: "_blank", "like this"
                            text " (after clicking \"add to hanger\" and then \"add to open hanger\" from your craft's page)."
                        p ->
                            text "Alternately, you can still send an email to "
                            a href: "mailto:GuardAlmostGames@gmail.com", "GuardAlmostGames@gmail.com"
                            text " with the following:"
                        ul ->
                            li "Download link or .craft file (preferably on KerbalX)"
                            li "List of mods used (preferably with links)"
                            li "Version of KSP it was made in"
                            li "Name to call you (or I will use whatever your email uses)"
                            li "Action groups, any other notes you want to add"

                    dt -> a name: "email", "Did you get my email? Why didn't you reply to my email?"
                    dd ->
                        text "Assuming you sent it to the "
                        a href: @url_for("contact"), "right address"
                        text " ... Yes. I don't reply to plane submissions and I often don't have time to reply to other emails."

                    dt -> a name: "comment", "Why didn't you reply to my comment?"
                    dd "The biggest reason is probably a lack of time. It also may be because I don't think there is anything to be gained by my reply. I don't answer things that are answered in the video, can be easily Googled, or when people ask things in a rude manner (for example, in all-caps)."

                    dt -> a name: "normandy", "Do you have the Normandy mod? / Can I get the Normandy mod?"
                    dd ->
                        text "No. I don't have it. That video is "
                        em "years"
                        text " old."

                    dt -> a name: "ksp-intro", "Why do you say \"Kerbal Space-gram\"?"
                    dd ->
                        text "I say \"pro\" very quiet and fast. In combination with the bassy sound of \"pro\" and my post-processing to remove background noise (which is also bassy), this makes the \"pro\" usually inaudible. If you "
                        a href: @build_url("static/img/faq/exhibit-a.png"), target: "_blank", "look at the waveforms"
                        text " though, you can see it's there."

                h2 "General Questions"

                dl ->
                    dt -> a name: "name", "Why is your name Guard13007?"
                    dd ->
                        a href: "https://twitter.com/craigperko/status/591228538633621504", target: "_blank", "See this Twitter conversation"
                        text "."

    [date: "/date"]: =>
        Crafts = require "models.Crafts"
        out = Crafts\find(id: 1).created_at
        @html ->
            p out
