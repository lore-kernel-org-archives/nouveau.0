From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36090] [NV34] [NV49] terminal's visual bell is very
 slow with nouveau
Date: Tue, 24 Sep 2013 15:44:55 +0000
Message-ID: <bug-36090-8800-EdfdiF6Oo5@http.bugs.freedesktop.org/>
References: <bug-36090-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1640829647=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-36090-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1640829647==
Content-Type: multipart/alternative; boundary="1380037495.FAF118C4.8633"; charset="us-ascii"


--1380037495.FAF118C4.8633
Date: Tue, 24 Sep 2013 15:44:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=36090

--- Comment #11 from aebenjam-gGaKbNYk6w1Wk0Htik3J/w@public.gmane.org ---
Interesting.  So, I'm a Fedora (currently v18) user.  I created a stock
account, logged in to a standard Gnome environment, and fired up an xterm with
visual bell running, and it doesn't have the same problem.  In fact, I couldn't
even SEE a visual bell. Odd.  All I could tell was that the audible bell went
away when I enabled the visual bell.

Now, that's not my usual scenario. My usual is using fvwm2 as my window
manager.  And while it might take a second or so for the visual bell to run on
a reasonable sized xterm, when I full-screen it, it really does take multiple
seconds to complete.  Running xcompmgr didn't speed that up, but instead of the
bell visually progressing up/down the screeen (watching each line draw) it drew
it all at once, then waited, then removed it all at once.  Same (or, at least,
similar) delay, but visually different.

Note that whatever is going right/wrong didn't used to happen using the nvidia
provided driver.  I've been using the nouveau driver, and am happy to do so,
but it does have this one interesting downside.

Interesting fact.  If I run the program, "screen", it changes things somehow. 
I'm not sure how... but all of a sudden the visual bell becomes reasonable
again.  Exiting back out of screen reverts to the undesired behaviour.

I hope that helps.

Adam

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380037495.FAF118C4.8633
Date: Tue, 24 Sep 2013 15:44:55 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NV34] [NV49] terminal's visual bell is very slow with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=36090#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV34] [NV49] terminal's visual bell is very slow with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=36090">bug 36090</a>
              from <span class="vcard"><a class="email" href="mailto:aebenjam&#64;opentext.com" title="aebenjam&#64;opentext.com">aebenjam&#64;opentext.com</a>
</span></b>
        <pre>Interesting.  So, I'm a Fedora (currently v18) user.  I created a stock
account, logged in to a standard Gnome environment, and fired up an xterm with
visual bell running, and it doesn't have the same problem.  In fact, I couldn't
even SEE a visual bell. Odd.  All I could tell was that the audible bell went
away when I enabled the visual bell.

Now, that's not my usual scenario. My usual is using fvwm2 as my window
manager.  And while it might take a second or so for the visual bell to run on
a reasonable sized xterm, when I full-screen it, it really does take multiple
seconds to complete.  Running xcompmgr didn't speed that up, but instead of the
bell visually progressing up/down the screeen (watching each line draw) it drew
it all at once, then waited, then removed it all at once.  Same (or, at least,
similar) delay, but visually different.

Note that whatever is going right/wrong didn't used to happen using the nvidia
provided driver.  I've been using the nouveau driver, and am happy to do so,
but it does have this one interesting downside.

Interesting fact.  If I run the program, &quot;screen&quot;, it changes things somehow. 
I'm not sure how... but all of a sudden the visual bell becomes reasonable
again.  Exiting back out of screen reverts to the undesired behaviour.

I hope that helps.

Adam</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380037495.FAF118C4.8633--

--===============1640829647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1640829647==--
