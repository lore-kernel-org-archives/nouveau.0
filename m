From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91551] DXTn compressed normal maps produce severe
 artifacts on all NV5x and NVDx chipsets
Date: Thu, 10 Sep 2015 08:37:26 +0000
Message-ID: <bug-91551-8800-9nKaogkv7n@http.bugs.freedesktop.org/>
References: <bug-91551-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0540552085=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91551-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0540552085==
Content-Type: multipart/alternative; boundary="1441874245.5B8fF1.21040"; charset="UTF-8"


--1441874245.5B8fF1.21040
Date: Thu, 10 Sep 2015 08:37:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91551

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
As I suspected, nothing to do with compressed textures. Should be at least
partially fixed by

commit ce28ca713364dbe83cb3c371ca034bc2c2947616
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Thu Sep 10 03:55:06 2015 -0400

    nv50/ir: fix emission of 8-byte wide interp instruction

    This can come up if the target register number is > 63, which is fairly
    rare.

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=91551
    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
    Cc: "11.0" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>

It still doesn't seem to render quite the same as nvc0 and llvmpipe. The
lighting on the back of the spinning models is much brighter. Not sure why...
those shaders are ENORMOUS by the way.

I thought it might be due to glShadeModel(GL_FLAT) at first, which isn't
properly handled, but that's not it -- it only ever calls
glShadeModel(GL_SMOOTH) in the trace.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1441874245.5B8fF1.21040
Date: Thu, 10 Sep 2015 08:37:25 +0000
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
   title="NEW - DXTn compressed normal maps produce severe artifacts on all NV5x and NVDx chipsets"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91551#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DXTn compressed normal maps produce severe artifacts on all NV5x and NVDx chipsets"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91551">bug 91551</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>As I suspected, nothing to do with compressed textures. Should be at least
partially fixed by

commit ce28ca713364dbe83cb3c371ca034bc2c2947616
Author: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
Date:   Thu Sep 10 03:55:06 2015 -0400

    nv50/ir: fix emission of 8-byte wide interp instruction

    This can come up if the target register number is &gt; 63, which is fairly
    rare.

    Bugzilla: <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DXTn compressed normal maps produce severe artifacts on all NV5x and NVDx chipsets"
   href="show_bug.cgi?id=91551">https://bugs.freedesktop.org/show_bug.cgi?id=91551</a>
    Signed-off-by: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
    Cc: &quot;11.0&quot; &lt;<a href="mailto:mesa-stable&#64;lists.freedesktop.org">mesa-stable&#64;lists.freedesktop.org</a>&gt;

It still doesn't seem to render quite the same as nvc0 and llvmpipe. The
lighting on the back of the spinning models is much brighter. Not sure why...
those shaders are ENORMOUS by the way.

I thought it might be due to glShadeModel(GL_FLAT) at first, which isn't
properly handled, but that's not it -- it only ever calls
glShadeModel(GL_SMOOTH) in the trace.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441874245.5B8fF1.21040--

--===============0540552085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0540552085==--
