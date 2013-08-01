From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56615] [NVD9] Unable to start X on ThinkPad T420s
	laptop
Date: Thu, 01 Aug 2013 19:03:41 +0000
Message-ID: <bug-56615-8800-zqg5dutCDJ@http.bugs.freedesktop.org/>
References: <bug-56615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1659701296=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1659701296==
Content-Type: multipart/alternative; boundary="1375383821.E4Ad1.4679"; charset="us-ascii"


--1375383821.E4Ad1.4679
Date: Thu, 1 Aug 2013 19:03:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56615

--- Comment #17 from Mark Cave-Ayland <mark.cave-ayland-r2/yp8inhXLQXOPxS62xeg@public.gmane.org> ---
(In reply to comment #16)

> I wouldn't worry about that backtrace, it's related to something else I
> think.

Okay, no worries :)

> Would you mind switching to nouveau/master? You can just add it as a remote
> to your current git setup, no need to check out a whole new tree.

Sure. My kernel git repository is exclusively set-up for trying to get DP
working so it's a clone of git://anongit.freedesktop.org/nouveau/linux-2.6.
I'll do a pull on master branch and build that for my next set of tests.

> Could you post a full dmesg from a nouveau/master kernel booted with
> "nouveau.debug=PDISP=debug"? The dmesg that you've already posted seems to
> suggest everything is broken (e.g. PDISP is disabled which is a very bad
> sign).

Alright. I'm not back in the office until next week now, but as soon as I get a
chance I'll try it and upload the dmesg output here.

> Also, to be clear, if you boot with DP plugged in, and start X, then you get
> a hang, right? Does the whole system hang, or just the display? Can you ssh
> in? If you can ssh in, what happens when you try to turn stuff off/on with
> xrandr? (Obviously with DISPLAY=:0 so as to connect to the laptop's X.)

AFAICT it's a full system hang - I haven't tried remote network access, but the
keyboard is totally unresponsive, even to CTRL-ALT-F1 and friends until the
driver times out after about 2-3mins. I'll give the remote access a try next
week though.


Many thanks,

Mark.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375383821.E4Ad1.4679
Date: Thu, 1 Aug 2013 19:03:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615">bug 56615</a>
              from <span class="vcard"><a class="email" href="mailto:mark.cave-ayland&#64;ilande.co.uk" title="Mark Cave-Ayland &lt;mark.cave-ayland&#64;ilande.co.uk&gt;"> <span class="fn">Mark Cave-Ayland</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=56615#c16">comment #16</a>)

<span class="quote">&gt; I wouldn't worry about that backtrace, it's related to something else I
&gt; think.</span >

Okay, no worries :)

<span class="quote">&gt; Would you mind switching to nouveau/master? You can just add it as a remote
&gt; to your current git setup, no need to check out a whole new tree.</span >

Sure. My kernel git repository is exclusively set-up for trying to get DP
working so it's a clone of git://anongit.freedesktop.org/nouveau/linux-2.6.
I'll do a pull on master branch and build that for my next set of tests.

<span class="quote">&gt; Could you post a full dmesg from a nouveau/master kernel booted with
&gt; &quot;nouveau.debug=PDISP=debug&quot;? The dmesg that you've already posted seems to
&gt; suggest everything is broken (e.g. PDISP is disabled which is a very bad
&gt; sign).</span >

Alright. I'm not back in the office until next week now, but as soon as I get a
chance I'll try it and upload the dmesg output here.

<span class="quote">&gt; Also, to be clear, if you boot with DP plugged in, and start X, then you get
&gt; a hang, right? Does the whole system hang, or just the display? Can you ssh
&gt; in? If you can ssh in, what happens when you try to turn stuff off/on with
&gt; xrandr? (Obviously with DISPLAY=:0 so as to connect to the laptop's X.)</span >

AFAICT it's a full system hang - I haven't tried remote network access, but the
keyboard is totally unresponsive, even to CTRL-ALT-F1 and friends until the
driver times out after about 2-3mins. I'll give the remote access a try next
week though.


Many thanks,

Mark.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375383821.E4Ad1.4679--

--===============1659701296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1659701296==--
