From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93458] page allocation failure: order:5,
	mode:0x240c0c0
Date: Sun, 17 Apr 2016 14:52:02 +0000
Message-ID: <bug-93458-8800-8mrZbGhyCw@http.bugs.freedesktop.org/>
References: <bug-93458-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1338068730=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93458-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1338068730==
Content-Type: multipart/alternative; boundary="14609047223.8cfe3.16080";
 charset="UTF-8"


--14609047223.8cfe3.16080
Date: Sun, 17 Apr 2016 14:52:02 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93458

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This should be now upstream with

commit 78a121d82da8aff3aca2a6a1c40f5061081760f0
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Sun Mar 6 16:06:06 2016 -0500

    drm/nouveau/core: use vzalloc for allocating ramht

    Most calls to nvkm_ramht_new use 0x8000 as the size. This results in a
    fairly sizeable chunk of memory to be allocated, which may not be
    available with kzalloc. Since this is done fairly rarely (once per
    channel), use vzalloc instead.

    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Zlatko - I didn't realize (or perhaps totally forgot) you had provided the same
patch, didn't mean to steal credit or anything like that. Just ran into the
same issue myself and sent a patch. In the future, feel free to send patches to
the mailing list.

This issue should be resolved in v4.6-rc1+.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14609047223.8cfe3.16080
Date: Sun, 17 Apr 2016 14:52:02 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458">bug 93458</a>
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
   title="RESOLVED FIXED - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458">bug 93458</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This should be now upstream with

commit 78a121d82da8aff3aca2a6a1c40f5061081760f0
Author: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
Date:   Sun Mar 6 16:06:06 2016 -0500

    drm/nouveau/core: use vzalloc for allocating ramht

    Most calls to nvkm_ramht_new use 0x8000 as the size. This results in a
    fairly sizeable chunk of memory to be allocated, which may not be
    available with kzalloc. Since this is done fairly rarely (once per
    channel), use vzalloc instead.

    Signed-off-by: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

Zlatko - I didn't realize (or perhaps totally forgot) you had provided the same
patch, didn't mean to steal credit or anything like that. Just ran into the
same issue myself and sent a patch. In the future, feel free to send patches to
the mailing list.

This issue should be resolved in v4.6-rc1+.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14609047223.8cfe3.16080--

--===============1338068730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1338068730==--
