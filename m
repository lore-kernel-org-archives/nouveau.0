From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] [NVE4] Desktop freezes & PDISP errors & PFIFO
	errors
Date: Thu, 14 May 2015 21:21:19 +0000
Message-ID: <bug-90453-8800-dUKCqNlSS9@http.bugs.freedesktop.org/>
References: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2135658729=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90453-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2135658729==
Content-Type: multipart/alternative; boundary="1431638479.cDfF0AF01.3057"; charset="UTF-8"


--1431638479.cDfF0AF01.3057
Date: Thu, 14 May 2015 21:21:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90453

--- Comment #11 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Michiel Helvensteijn from comment #10)
> I was finally able to connect to my pc *after* a freeze-up using SSH. Here
> is the coinciding dmesg output:
> 
> [ 8970.897260] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT
> ]
> [ 8970.897265] nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel
> 6, recovering...

Hrmph... could well have been fixed by one of the ctxsw changes since 3.15 :(

Sorry, this will require someone who knows what they're talking about (i.e. not
me) to properly diagnose.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431638479.cDfF0AF01.3057
Date: Thu, 14 May 2015 21:21:19 +0000
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
   title="NEW - [NVE4] Desktop freezes &amp; PDISP errors &amp; PFIFO errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Desktop freezes &amp; PDISP errors &amp; PFIFO errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453">bug 90453</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Michiel Helvensteijn from <a href="show_bug.cgi?id=90453#c10">comment #10</a>)
<span class="quote">&gt; I was finally able to connect to my pc *after* a freeze-up using SSH. Here
&gt; is the coinciding dmesg output:
&gt; 
&gt; [ 8970.897260] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT
&gt; ]
&gt; [ 8970.897265] nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel
&gt; 6, recovering...</span >

Hrmph... could well have been fixed by one of the ctxsw changes since 3.15 :(

Sorry, this will require someone who knows what they're talking about (i.e. not
me) to properly diagnose.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431638479.cDfF0AF01.3057--

--===============2135658729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2135658729==--
