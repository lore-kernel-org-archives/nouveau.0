From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28095] X crash with PFIFO_CACHE_ERROR. (Nouveau on
	Riva TNT).
Date: Wed, 11 Mar 2015 18:41:12 +0000
Message-ID: <bug-28095-8800-qAxvpcZA2c@http.bugs.freedesktop.org/>
References: <bug-28095-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1342968803=="
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


--===============1342968803==
Content-Type: multipart/alternative; boundary="1426099272.361602.14779"; charset="UTF-8"


--1426099272.361602.14779
Date: Wed, 11 Mar 2015 18:41:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=28095

--- Comment #20 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Brent from comment #19)
> Been trying to track down the oldest kernel that shows the corrupted
> display, but have run into further problems.  It seems nouveau with the
> early 3.x kernels does not work at all on this NV04 video card.  I think 3.4
> is the first version with nouveau included in the kernel?  Have tried 3.1
> (Slacko Puppy 5.3.3), a 3.4.106 kernel I built on the Arch Linux system with
> the 2.6.35 kernel that does work, and 3.5 (AntiX Linux 12).  Puppy and AntiX
> fall back to the VESA driver, and Arch with the custom 3.4.106 kernel and X
> 1.8.1.902 just drops to a text screen.  All try to use nouveau, and all give
> the same "(EE) [drm] failed to open device" message in Xorg.0.log.

nouveau was first merged in 2.6.33 as a staging driver. It moved out of staging
in kernel 3.4. It's possible that your userspace expects a newer abi than the
old nouveau provided.

This feels like some sort of tiling fail. Do things work better if you boot
with

nouveau.noaccel=1 nouveau.nofbaccel=1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426099272.361602.14779
Date: Wed, 11 Mar 2015 18:41:12 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28095#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - X crash with PFIFO_CACHE_ERROR. (Nouveau on Riva TNT)."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28095">bug 28095</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Brent from <a href="show_bug.cgi?id=28095#c19">comment #19</a>)
<span class="quote">&gt; Been trying to track down the oldest kernel that shows the corrupted
&gt; display, but have run into further problems.  It seems nouveau with the
&gt; early 3.x kernels does not work at all on this NV04 video card.  I think 3.4
&gt; is the first version with nouveau included in the kernel?  Have tried 3.1
&gt; (Slacko Puppy 5.3.3), a 3.4.106 kernel I built on the Arch Linux system with
&gt; the 2.6.35 kernel that does work, and 3.5 (AntiX Linux 12).  Puppy and AntiX
&gt; fall back to the VESA driver, and Arch with the custom 3.4.106 kernel and X
&gt; 1.8.1.902 just drops to a text screen.  All try to use nouveau, and all give
&gt; the same &quot;(EE) [drm] failed to open device&quot; message in Xorg.0.log.</span >

nouveau was first merged in 2.6.33 as a staging driver. It moved out of staging
in kernel 3.4. It's possible that your userspace expects a newer abi than the
old nouveau provided.

This feels like some sort of tiling fail. Do things work better if you boot
with

nouveau.noaccel=1 nouveau.nofbaccel=1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426099272.361602.14779--

--===============1342968803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1342968803==--
