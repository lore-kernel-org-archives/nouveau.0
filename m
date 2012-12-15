From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56461] NV11 black screen & kernel hang on loading
	nouveaufb
Date: Sat, 15 Dec 2012 14:55:55 +0000
Message-ID: <bug-56461-8800-CkFAlqWaUr@http.bugs.freedesktop.org/>
References: <bug-56461-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1556813831=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56461-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1556813831==
Content-Type: multipart/alternative; boundary="1355583355.80fb86E1.9915"; charset="us-ascii"


--1355583355.80fb86E1.9915
Date: Sat, 15 Dec 2012 14:55:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56461

--- Comment #24 from Chris Paulson-Ellis <chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org> ---
(In reply to comment #23)
> This is probably another bug (you are really lucky ;).

I will bisect again. Don't hold your breath!

> Is timer/nv04.c change needed for 2a44e499 to light up your monitor?

No. I'm only using it when running the patched nouveau git HEAD. Even then I
can leave it out without anything changing - It just suppresses this warning:
nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq

When running the patched git HEAD... Although the LCD is not being driven, the
driver isn't completely dead. I can start and stop X and the screen will go
white, then fade to black each time I do it. This suggests that the backlight
control & power management are okay, but the display timings are wrong. Looking
at the working & broken console output, they both show the same pixel clock. Is
there some way to get the driver to output more verbose display timing info
(fbset -i shows all zeros in the timing line in both the working & non-working
cases)?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355583355.80fb86E1.9915
Date: Sat, 15 Dec 2012 14:55:55 +0000
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
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461">bug 56461</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;edesix.com" title="Chris Paulson-Ellis &lt;chris&#64;edesix.com&gt;"> <span class="fn">Chris Paulson-Ellis</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=56461#c23">comment #23</a>)
<span class="quote">&gt; This is probably another bug (you are really lucky ;).</span >

I will bisect again. Don't hold your breath!

<span class="quote">&gt; Is timer/nv04.c change needed for 2a44e499 to light up your monitor?</span >

No. I'm only using it when running the patched nouveau git HEAD. Even then I
can leave it out without anything changing - It just suppresses this warning:
nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq

When running the patched git HEAD... Although the LCD is not being driven, the
driver isn't completely dead. I can start and stop X and the screen will go
white, then fade to black each time I do it. This suggests that the backlight
control &amp; power management are okay, but the display timings are wrong. Looking
at the working &amp; broken console output, they both show the same pixel clock. Is
there some way to get the driver to output more verbose display timing info
(fbset -i shows all zeros in the timing line in both the working &amp; non-working
cases)?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1355583355.80fb86E1.9915--

--===============1556813831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1556813831==--
