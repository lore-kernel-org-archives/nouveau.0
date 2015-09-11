From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91972] [NVE7] xorg/nouveau crashes when running
 wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes
Date: Fri, 11 Sep 2015 23:25:13 +0000
Message-ID: <bug-91972-8800-fj5dXwL98N@http.bugs.freedesktop.org/>
References: <bug-91972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1541736314=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91972-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1541736314==
Content-Type: multipart/alternative; boundary="1442013913.Fc5171.18348"; charset="UTF-8"


--1442013913.Fc5171.18348
Date: Fri, 11 Sep 2015 23:25:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91972

--- Comment #2 from Austin English <austinenglish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #1)
> Wow, very uncommon configuration... nouveau as main and intel as "GPU". Are
> you doing any actual offloading (of either outputs or rendering)?

Not that I'm aware of (whatever Fedora set up for this particular hardware).

00:02.0 Display controller: Intel Corporation Xeon E3-1200 v3/4th Gen Core
Processor Integrated Graphics Controller (rev 06)
01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 660
OEM] (rev a1)

> exa/exa_migration_mixed.c:                FatalError("EXA: malloc failed for
> size %d bytes\n",
> 
> pExaPixmap->sys_pitch * pPixmap->drawable.height
> 
> exa/exa_priv.h:    int sys_pitch;              /**< pitch of pixmap in
> system memory */
> include/pixmapstr.h:    unsigned short height;
> 
> I guess sys_pitch is somehow negative then.
> 
> Can you "bisect" the test, i.e. figure out which bit of it triggers the
> issue? And perhaps modify that print to show what the individual values in
> that multiplication are?

I've gotten it down to test_SetWindowPos(). I'll narrow it down further next
week.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1442013913.Fc5171.18348
Date: Fri, 11 Sep 2015 23:25:13 +0000
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
   title="NEW - [NVE7] xorg/nouveau crashes when running wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91972#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] xorg/nouveau crashes when running wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91972">bug 91972</a>
              from <span class="vcard"><a class="email" href="mailto:austinenglish&#64;gmail.com" title="Austin English &lt;austinenglish&#64;gmail.com&gt;"> <span class="fn">Austin English</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=91972#c1">comment #1</a>)
<span class="quote">&gt; Wow, very uncommon configuration... nouveau as main and intel as &quot;GPU&quot;. Are
&gt; you doing any actual offloading (of either outputs or rendering)?</span >

Not that I'm aware of (whatever Fedora set up for this particular hardware).

00:02.0 Display controller: Intel Corporation Xeon E3-1200 v3/4th Gen Core
Processor Integrated Graphics Controller (rev 06)
01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 660
OEM] (rev a1)

<span class="quote">&gt; exa/exa_migration_mixed.c:                FatalError(&quot;EXA: malloc failed for
&gt; size %d bytes\n&quot;,
&gt; 
&gt; pExaPixmap-&gt;sys_pitch * pPixmap-&gt;drawable.height
&gt; 
&gt; exa/exa_priv.h:    int sys_pitch;              /**&lt; pitch of pixmap in
&gt; system memory */
&gt; include/pixmapstr.h:    unsigned short height;
&gt; 
&gt; I guess sys_pitch is somehow negative then.
&gt; 
&gt; Can you &quot;bisect&quot; the test, i.e. figure out which bit of it triggers the
&gt; issue? And perhaps modify that print to show what the individual values in
&gt; that multiplication are?</span >

I've gotten it down to test_SetWindowPos(). I'll narrow it down further next
week.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442013913.Fc5171.18348--

--===============1541736314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1541736314==--
