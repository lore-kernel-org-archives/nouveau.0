From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93004] Guild Wars 2 crash on nouveau DX11 cards
Date: Wed, 09 Dec 2015 20:51:28 +0000
Message-ID: <bug-93004-8800-asaj1qmyB9@http.bugs.freedesktop.org/>
References: <bug-93004-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1065789887=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93004-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1065789887==
Content-Type: multipart/alternative; boundary="1449694288.c12b61.14472"; charset="UTF-8"


--1449694288.c12b61.14472
Date: Wed, 9 Dec 2015 20:51:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93004

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Pushed this out as:

commit 432a798cf5c7fab18a3e32d4073840df7d0d37cb
Author: Patrick Rudolph <siro-afHDD34IFkZrovVCs/uTlw@public.gmane.org>
Date:   Sun Dec 6 10:11:59 2015 +0100

    nv50,nvc0: fix use-after-free when vertex buffers are unbound

    Always reset the vertex bufctx to make sure there's no pointer to
    an already freed pipe_resource left after unbinding buffers.
    Fixes use after free crash in nvc0_bufctx_fence().

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=93004
    Signed-off-by: Patrick Rudolph <siro-afHDD34IFkZrovVCs/uTlw@public.gmane.org>
    [imirkin: simplify nvc0 fix, apply to nv50]
    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
    Cc: "11.0 11.1" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>

I believe this should fix everything. Not sure why you didn't see issues with a
G84... probably gets lucky somehow. Thanks for debugging it and tracking the
issue down!

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1449694288.c12b61.14472
Date: Wed, 9 Dec 2015 20:51:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Guild Wars 2 crash on nouveau DX11 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93004">bug 93004</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Guild Wars 2 crash on nouveau DX11 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93004#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Guild Wars 2 crash on nouveau DX11 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93004">bug 93004</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Pushed this out as:

commit 432a798cf5c7fab18a3e32d4073840df7d0d37cb
Author: Patrick Rudolph &lt;<a href="mailto:siro&#64;das-labor.org">siro&#64;das-labor.org</a>&gt;
Date:   Sun Dec 6 10:11:59 2015 +0100

    nv50,nvc0: fix use-after-free when vertex buffers are unbound

    Always reset the vertex bufctx to make sure there's no pointer to
    an already freed pipe_resource left after unbinding buffers.
    Fixes use after free crash in nvc0_bufctx_fence().

    Bugzilla: <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Guild Wars 2 crash on nouveau DX11 cards"
   href="show_bug.cgi?id=93004">https://bugs.freedesktop.org/show_bug.cgi?id=93004</a>
    Signed-off-by: Patrick Rudolph &lt;<a href="mailto:siro&#64;das-labor.org">siro&#64;das-labor.org</a>&gt;
    [imirkin: simplify nvc0 fix, apply to nv50]
    Signed-off-by: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
    Cc: &quot;11.0 11.1&quot; &lt;<a href="mailto:mesa-stable&#64;lists.freedesktop.org">mesa-stable&#64;lists.freedesktop.org</a>&gt;

I believe this should fix everything. Not sure why you didn't see issues with a
G84... probably gets lucky somehow. Thanks for debugging it and tracking the
issue down!</pre>
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

--1449694288.c12b61.14472--

--===============1065789887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1065789887==--
