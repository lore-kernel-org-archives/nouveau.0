From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91972] [NVE4] xorg/nouveau crashes when running
 wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes
Date: Mon, 02 Nov 2015 07:38:26 +0000
Message-ID: <bug-91972-8800-eOzgv8iJd6@http.bugs.freedesktop.org/>
References: <bug-91972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0238268422=="
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


--===============0238268422==
Content-Type: multipart/alternative; boundary="1446449906.FAb5CcAE1.20581"; charset="UTF-8"


--1446449906.FAb5CcAE1.20581
Date: Mon, 2 Nov 2015 07:38:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91972

--- Comment #5 from Austin English <austinenglish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #1)
> Wow, very uncommon configuration... nouveau as main and intel as "GPU". Are
> you doing any actual offloading (of either outputs or rendering)?
> 
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

Finally got to this, it's this call:
https://source.winehq.org/git/wine.git/blob/12111d8c3b897df92fabc1c1a81567477952e9b1:/dlls/user32/tests/win.c#l2200

printed the individual values:
win.c:2201: window handle: 0x1f00be window handle2: 0, left position: 100, top
position: 100, width: 12c height: 300, flags: 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446449906.FAb5CcAE1.20581
Date: Mon, 2 Nov 2015 07:38:26 +0000
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
   title="NEW - [NVE4] xorg/nouveau crashes when running wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91972#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] xorg/nouveau crashes when running wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91972">bug 91972</a>
              from <span class="vcard"><a class="email" href="mailto:austinenglish&#64;gmail.com" title="Austin English &lt;austinenglish&#64;gmail.com&gt;"> <span class="fn">Austin English</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=91972#c1">comment #1</a>)
<span class="quote">&gt; Wow, very uncommon configuration... nouveau as main and intel as &quot;GPU&quot;. Are
&gt; you doing any actual offloading (of either outputs or rendering)?
&gt; 
&gt; exa/exa_migration_mixed.c:                FatalError(&quot;EXA: malloc failed for
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

Finally got to this, it's this call:
<a href="https://source.winehq.org/git/wine.git/blob/12111d8c3b897df92fabc1c1a81567477952e9b1:/dlls/user32/tests/win.c#l2200">https://source.winehq.org/git/wine.git/blob/12111d8c3b897df92fabc1c1a81567477952e9b1:/dlls/user32/tests/win.c#l2200</a>

printed the individual values:
win.c:2201: window handle: 0x1f00be window handle2: 0, left position: 100, top
position: 100, width: 12c height: 300, flags: 0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446449906.FAb5CcAE1.20581--

--===============0238268422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0238268422==--
