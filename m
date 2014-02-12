From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74815] [NVA5,
 NVC1] no displayport output on quadro 400/600 cards
Date: Wed, 12 Feb 2014 00:47:19 +0000
Message-ID: <bug-74815-8800-yLQv61Zd3t@http.bugs.freedesktop.org/>
References: <bug-74815-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0827739371=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74815-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0827739371==
Content-Type: multipart/alternative; boundary="1392166039.3bDF1.4483"; charset="us-ascii"


--1392166039.3bDF1.4483
Date: Wed, 12 Feb 2014 00:47:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74815

--- Comment #2 from Michael Gulick <mgulick-I5WecO5yM8GakBO8gow8eQ@public.gmane.org> ---
(In reply to comment #1)
> There's another bug about a DP regression... bug #67628, which bisected down
> to 5cc027f6b1e ("drm/nv50-/disp: handle supervisor tasks from workqueue"),
> first appearing in 3.9-rc1. Could you verify that you're having trouble with
> the same commit? If so, we can mark as a duplicate.
> 
> Otherwise, which log is that log from? Could you upload your VBIOS?

Unfortunately that doesn't seem to be the commit that caused the problem
(unless I did something wrong in testing).  It does appear to be between tags
'v3.8' and 'v3.9-rc1'.  I'm trying to do a git bisect but it looks like it will
take a while (13 steps estimated, but the first kernel wouldn't boot...).  Any
tips for speeding up that process?  Any other info I can provide?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392166039.3bDF1.4483
Date: Wed, 12 Feb 2014 00:47:19 +0000
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
   title="NEW --- - [NVA5,NVC1] no displayport output on quadro 400/600 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74815#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA5,NVC1] no displayport output on quadro 400/600 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74815">bug 74815</a>
              from <span class="vcard"><a class="email" href="mailto:mgulick&#64;mathworks.com" title="Michael Gulick &lt;mgulick&#64;mathworks.com&gt;"> <span class="fn">Michael Gulick</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=74815#c1">comment #1</a>)
<span class="quote">&gt; There's another bug about a DP regression... <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="show_bug.cgi?id=67628">bug #67628</a>, which bisected down
&gt; to 5cc027f6b1e (&quot;drm/nv50-/disp: handle supervisor tasks from workqueue&quot;),
&gt; first appearing in 3.9-rc1. Could you verify that you're having trouble with
&gt; the same commit? If so, we can mark as a duplicate.
&gt; 
&gt; Otherwise, which log is that log from? Could you upload your VBIOS?</span >

Unfortunately that doesn't seem to be the commit that caused the problem
(unless I did something wrong in testing).  It does appear to be between tags
'v3.8' and 'v3.9-rc1'.  I'm trying to do a git bisect but it looks like it will
take a while (13 steps estimated, but the first kernel wouldn't boot...).  Any
tips for speeding up that process?  Any other info I can provide?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392166039.3bDF1.4483--

--===============0827739371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0827739371==--
