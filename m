From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88514] X segfaults when using prime offloading to
	nouveau card
Date: Sat, 17 Jan 2015 01:01:05 +0000
Message-ID: <bug-88514-8800-eFpmGkKwAK@http.bugs.freedesktop.org/>
References: <bug-88514-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1464925678=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88514-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1464925678==
Content-Type: multipart/alternative; boundary="1421456465.282b1.30885"; charset="UTF-8"


--1421456465.282b1.30885
Date: Sat, 17 Jan 2015 01:01:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88514

--- Comment #7 from aidan-FQpVkr58hxg@public.gmane.org ---
(In reply to Tobias Klausmann from comment #5)
> (In reply to Ilia Mirkin from comment #4)
> > https://bugs.freedesktop.org/show_bug.cgi?id=70354
> > 
> > From the backtrace, the crash appears to be happening in core X though...
> > but perhaps as a result of something nouveau or intel is doing wrong.
> 
> That seems to be likely the case. Try to remove xf86-video-nouveau or
> blacklist nouveau_drv.so to let nouveau fallback to modesettings. Or you
> could alternatively try the DRI3 variant of prime offloading:
> http://nouveau.freedesktop.org/wiki/Optimus/
> 
> That wont fix the actual bug but may help to work around this.

I might try one of these solutions.  A couple questions for DRI3: how do I
check if X and mesa have DRI3 support?  Also, what setup do I need to do?  Do I
just need to use DRI_PRIME=1, without using xrandr --setprovideroffloadsink
(like I would for DRI2)?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421456465.282b1.30885
Date: Sat, 17 Jan 2015 01:01:05 +0000
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
   title="NEW - X segfaults when using prime offloading to nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88514#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - X segfaults when using prime offloading to nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88514">bug 88514</a>
              from <span class="vcard"><a class="email" href="mailto:aidan&#64;jmad.org" title="aidan&#64;jmad.org">aidan&#64;jmad.org</a>
</span></b>
        <pre>(In reply to Tobias Klausmann from <a href="show_bug.cgi?id=88514#c5">comment #5</a>)
<span class="quote">&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=88514#c4">comment #4</a>)
&gt; &gt; <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="show_bug.cgi?id=70354">https://bugs.freedesktop.org/show_bug.cgi?id=70354</a>
&gt; &gt; 
&gt; &gt; From the backtrace, the crash appears to be happening in core X though...
&gt; &gt; but perhaps as a result of something nouveau or intel is doing wrong.
&gt; 
&gt; That seems to be likely the case. Try to remove xf86-video-nouveau or
&gt; blacklist nouveau_drv.so to let nouveau fallback to modesettings. Or you
&gt; could alternatively try the DRI3 variant of prime offloading:
&gt; <a href="http://nouveau.freedesktop.org/wiki/Optimus/">http://nouveau.freedesktop.org/wiki/Optimus/</a>
&gt; 
&gt; That wont fix the actual bug but may help to work around this.</span >

I might try one of these solutions.  A couple questions for DRI3: how do I
check if X and mesa have DRI3 support?  Also, what setup do I need to do?  Do I
just need to use DRI_PRIME=1, without using xrandr --setprovideroffloadsink
(like I would for DRI2)?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421456465.282b1.30885--

--===============1464925678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1464925678==--
