From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28095] X crash with PFIFO_CACHE_ERROR. (Nouveau on
	Riva TNT).
Date: Sat, 14 Feb 2015 20:54:55 +0000
Message-ID: <bug-28095-8800-g1gJjN3QRS@http.bugs.freedesktop.org/>
References: <bug-28095-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1042354215=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28095-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1042354215==
Content-Type: multipart/alternative; boundary="1423947295.16ca62.7502"; charset="UTF-8"


--1423947295.16ca62.7502
Date: Sat, 14 Feb 2015 20:54:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=28095

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
So by the sounds of it, we broke the display stuff at some point between
pre-history (i.e. before nouveau was in mainline) and... now. I'm fairly sure
that it's a fairly self-contained problem -- my NV05 TNT2 M64 works fine (or at
least did recently, I think I last tested after 3.10 or so). Another user's
NV04 also worked OK on linux-3.9 (from bug 68854), although it was the Creative
Labs one. However he also had the resolution issue (maxing out at 1024x768).

You have one of the (infamous?) BMP v0 vbioses, may be interesting to attach it
to this bug, although I sincerely doubt that is the source of the issues
(before BMP v2 or so, we just ignore it entirely). Without nouveau loaded, you
can get it from /sys/kernel/debug/dri/0/vbios.rom .

The unfortunate reality here is that you are in posession of fairly unique
piece of hardware, and that (I believe) similar HW works fine. So... it's
something "funny" going on. 

You might try booting with

nouveau.debug=debug drm.debug=14

and capturing the kernel messages from that. Perhaps something interesting will
come up.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423947295.16ca62.7502
Date: Sat, 14 Feb 2015 20:54:55 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO - X crash with PFIFO_CACHE_ERROR. (Nouveau on Riva TNT)."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28095#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - X crash with PFIFO_CACHE_ERROR. (Nouveau on Riva TNT)."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28095">bug 28095</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>So by the sounds of it, we broke the display stuff at some point between
pre-history (i.e. before nouveau was in mainline) and... now. I'm fairly sure
that it's a fairly self-contained problem -- my NV05 TNT2 M64 works fine (or at
least did recently, I think I last tested after 3.10 or so). Another user's
NV04 also worked OK on linux-3.9 (from <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV04] PROTECTION_ERROR / PROTECTION_FAULT"
   href="show_bug.cgi?id=68854">bug 68854</a>), although it was the Creative
Labs one. However he also had the resolution issue (maxing out at 1024x768).

You have one of the (infamous?) BMP v0 vbioses, may be interesting to attach it
to this bug, although I sincerely doubt that is the source of the issues
(before BMP v2 or so, we just ignore it entirely). Without nouveau loaded, you
can get it from /sys/kernel/debug/dri/0/vbios.rom .

The unfortunate reality here is that you are in posession of fairly unique
piece of hardware, and that (I believe) similar HW works fine. So... it's
something &quot;funny&quot; going on. 

You might try booting with

nouveau.debug=debug drm.debug=14

and capturing the kernel messages from that. Perhaps something interesting will
come up.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423947295.16ca62.7502--

--===============1042354215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1042354215==--
