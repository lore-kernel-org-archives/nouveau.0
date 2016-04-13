From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Wed, 13 Apr 2016 17:52:14 +0000
Message-ID: <bug-93629-8800-G4276xgSdH@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2061034135=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2061034135==
Content-Type: multipart/alternative; boundary="14605699344.1BA9E.17319";
 charset="UTF-8"


--14605699344.1BA9E.17319
Date: Wed, 13 Apr 2016 17:52:14 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93629

--- Comment #17 from Karol Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> ---
(In reply to Dan Moulding from comment #16)
> I'm experiencing this bug with kernel 4.4.6 and GK106 (GeForce GTX 645 OEM).
> 
> For what it's worth, I've been experiencing this same bug for about two
> years, ever since kernel 3.12 (I was on kernel 3.10 prior to that and never
> experienced the bug). After each kernel upgrade I've done, I usually test
> the built-in firmware to see if the problem is still there. For a while, I
> thought the bug was gone as of the 4.4 kernel because I hadn't experienced
> the problem for a long time on 4.4 with the built-in firmware. But recently
> I upgraded my desktop environment to KDE Plasma 5 and now I've experienced
> the lockup twice in less than a 24-hour period.
> 
> I just switched back to the proprietary firmware (after moving/renaming the
> binary blobs to match the names that the new version of the driver looks
> for).
> 
> I'm willing to test the built-in firmware more, in order to help debug this
> longstanding problem. Is there something I can do to help gather more
> information (traces, enable debug logging, etc)?

if you are _sure_ that it never happened with 3.10 it would be really good if
you git bisect the kernel and see which commit broke it. If you wait like one
or two days for a freeze you should be through in a month :/

But maybe there is somebody who might know what it could be if it is really new
with 3.12 (or 3.11)

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14605699344.1BA9E.17319
Date: Wed, 13 Apr 2016 17:52:14 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629">bug 93629</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;karolherbst.de" title="Karol Herbst &lt;freedesktop&#64;karolherbst.de&gt;"> <span class="fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Dan Moulding from <a href="show_bug.cgi?id=93629#c16">comment #16</a>)
<span class="quote">&gt; I'm experiencing this bug with kernel 4.4.6 and GK106 (GeForce GTX 645 OEM).
&gt; 
&gt; For what it's worth, I've been experiencing this same bug for about two
&gt; years, ever since kernel 3.12 (I was on kernel 3.10 prior to that and never
&gt; experienced the bug). After each kernel upgrade I've done, I usually test
&gt; the built-in firmware to see if the problem is still there. For a while, I
&gt; thought the bug was gone as of the 4.4 kernel because I hadn't experienced
&gt; the problem for a long time on 4.4 with the built-in firmware. But recently
&gt; I upgraded my desktop environment to KDE Plasma 5 and now I've experienced
&gt; the lockup twice in less than a 24-hour period.
&gt; 
&gt; I just switched back to the proprietary firmware (after moving/renaming the
&gt; binary blobs to match the names that the new version of the driver looks
&gt; for).
&gt; 
&gt; I'm willing to test the built-in firmware more, in order to help debug this
&gt; longstanding problem. Is there something I can do to help gather more
&gt; information (traces, enable debug logging, etc)?</span >

if you are _sure_ that it never happened with 3.10 it would be really good if
you git bisect the kernel and see which commit broke it. If you wait like one
or two days for a freeze you should be through in a month :/

But maybe there is somebody who might know what it could be if it is really new
with 3.12 (or 3.11)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14605699344.1BA9E.17319--

--===============2061034135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2061034135==--
