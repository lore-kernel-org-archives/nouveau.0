From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92991] Nouveau module loading regression in 4.4-rc1
 on optimus system
Date: Thu, 26 Nov 2015 17:06:31 +0000
Message-ID: <bug-92991-8800-BOVR2GWyu6@http.bugs.freedesktop.org/>
References: <bug-92991-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1934837644=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92991-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1934837644==
Content-Type: multipart/alternative; boundary="1448557590.Bbec1.25797"; charset="UTF-8"


--1448557590.Bbec1.25797
Date: Thu, 26 Nov 2015 17:06:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92991

--- Comment #13 from Karol Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> ---
(In reply to Oliver Neukum from comment #12)
> (In reply to Ilia Mirkin from comment #9)
> 
> > Those connector names look like they're from xf86-video-modesetting, not
> > xf86-video-nouveau. Could you try with xf86-video-nouveau installed? What
> > version of xf86-video-intel are you using? SNA or UXA?
> 
> xf86-video-modesetting is definitely not used. I've deinstalled it and
> rebooted. The result is the same.

It is part of the Xserver now, so you can't just deinstall it ;)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1448557590.Bbec1.25797
Date: Thu, 26 Nov 2015 17:06:30 +0000
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
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991">bug 92991</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;karolherbst.de" title="Karol Herbst &lt;freedesktop&#64;karolherbst.de&gt;"> <span class="fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Oliver Neukum from <a href="show_bug.cgi?id=92991#c12">comment #12</a>)
<span class="quote">&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=92991#c9">comment #9</a>)
&gt; 
&gt; &gt; Those connector names look like they're from xf86-video-modesetting, not
&gt; &gt; xf86-video-nouveau. Could you try with xf86-video-nouveau installed? What
&gt; &gt; version of xf86-video-intel are you using? SNA or UXA?
&gt; 
&gt; xf86-video-modesetting is definitely not used. I've deinstalled it and
&gt; rebooted. The result is the same.</span >

It is part of the Xserver now, so you can't just deinstall it ;)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1448557590.Bbec1.25797--

--===============1934837644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1934837644==--
