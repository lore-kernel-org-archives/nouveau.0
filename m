From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28152] [NV36] corruption in FVWM window decorations
Date: Tue, 20 Aug 2013 17:11:43 +0000
Message-ID: <bug-28152-8800-yLwmFjV2qv@http.bugs.freedesktop.org/>
References: <bug-28152-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1526714214=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28152-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1526714214==
Content-Type: multipart/alternative; boundary="1377018703.EcC13411.6824"; charset="us-ascii"


--1377018703.EcC13411.6824
Date: Tue, 20 Aug 2013 17:11:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=28152

--- Comment #8 from Nick Bowler <nbowler-m3eOHSKbYRSw5LPnMra/2Q@public.gmane.org> ---
(In reply to comment #7)
> Thanks for re-checking!

Not hard to do, all I need to do is look at the top of any window :P

> Please also include a full kernel log (with a recent kernel).

I built 3.10.8, I will try it tonight to get the log...

> And am I reading that right, xorg 1.4? Not 1.14? If so, it'd be nice to
> exclude some sort of API change issue with e.g. EXA in the interevning 6
> years since 1.4's release.

You are reading it right, but it was written wrong!  Server version is
1.14.2.901.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377018703.EcC13411.6824
Date: Tue, 20 Aug 2013 17:11:43 +0000
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
   title="REOPENED --- - [NV36] corruption in FVWM window decorations"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28152#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV36] corruption in FVWM window decorations"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28152">bug 28152</a>
              from <span class="vcard"><a class="email" href="mailto:nbowler&#64;draconx.ca" title="Nick Bowler &lt;nbowler&#64;draconx.ca&gt;"> <span class="fn">Nick Bowler</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=28152#c7">comment #7</a>)
<span class="quote">&gt; Thanks for re-checking!</span >

Not hard to do, all I need to do is look at the top of any window :P

<span class="quote">&gt; Please also include a full kernel log (with a recent kernel).</span >

I built 3.10.8, I will try it tonight to get the log...

<span class="quote">&gt; And am I reading that right, xorg 1.4? Not 1.14? If so, it'd be nice to
&gt; exclude some sort of API change issue with e.g. EXA in the interevning 6
&gt; years since 1.4's release.</span >

You are reading it right, but it was written wrong!  Server version is
1.14.2.901.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377018703.EcC13411.6824--

--===============1526714214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1526714214==--
