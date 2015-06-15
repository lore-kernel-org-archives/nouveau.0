From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90347] [NVE0+] Failure to insert texbar under some
 circumstances (causing bad colors in Terasology)
Date: Mon, 15 Jun 2015 18:46:11 +0000
Message-ID: <bug-90347-8800-JeFFrwtAry@http.bugs.freedesktop.org/>
References: <bug-90347-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1964662682=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90347-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1964662682==
Content-Type: multipart/alternative; boundary="1434393971.EbBBbDE0.2142"; charset="UTF-8"


--1434393971.EbBBbDE0.2142
Date: Mon, 15 Jun 2015 18:46:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90347

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Should be fixed by

commit a2af42c1d2dc91f4c31e25ff9fff15a89a9b6ead
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Fri Jun 12 16:09:05 2015 +0200

    nvc0/ir: fix collection of first uses for texture barrier insertion

    One of the places we have to insert texbars is in situations where the
    result of the tex gets overwritten by a different instruction (e.g. in a
    conditional statement). However in some situations it can actually
    appear as though the original tex itself is an overwriting instruction.
    This can naturally never really happen, so just ignore the tex
    instruction when it comes up.

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=90347
    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
    Cc: "10.5 10.6" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1434393971.EbBBbDE0.2142
Date: Mon, 15 Jun 2015 18:46:11 +0000
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
   title="RESOLVED FIXED - [NVE0+] Failure to insert texbar under some circumstances (causing bad colors in Terasology)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90347">bug 90347</a>
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
   title="RESOLVED FIXED - [NVE0+] Failure to insert texbar under some circumstances (causing bad colors in Terasology)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90347#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE0+] Failure to insert texbar under some circumstances (causing bad colors in Terasology)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90347">bug 90347</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Should be fixed by

commit a2af42c1d2dc91f4c31e25ff9fff15a89a9b6ead
Author: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
Date:   Fri Jun 12 16:09:05 2015 +0200

    nvc0/ir: fix collection of first uses for texture barrier insertion

    One of the places we have to insert texbars is in situations where the
    result of the tex gets overwritten by a different instruction (e.g. in a
    conditional statement). However in some situations it can actually
    appear as though the original tex itself is an overwriting instruction.
    This can naturally never really happen, so just ignore the tex
    instruction when it comes up.

    Bugzilla: <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE0+] Failure to insert texbar under some circumstances (causing bad colors in Terasology)"
   href="show_bug.cgi?id=90347">https://bugs.freedesktop.org/show_bug.cgi?id=90347</a>
    Signed-off-by: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
    Cc: &quot;10.5 10.6&quot; &lt;<a href="mailto:mesa-stable&#64;lists.freedesktop.org">mesa-stable&#64;lists.freedesktop.org</a>&gt;</pre>
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

--1434393971.EbBBbDE0.2142--

--===============1964662682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1964662682==--
