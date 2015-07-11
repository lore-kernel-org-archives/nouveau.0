From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91284] xf86-video-nouveau fails to build with latest
	xorg
Date: Sat, 11 Jul 2015 21:00:04 +0000
Message-ID: <bug-91284-8800-KFhD3WqNyY@http.bugs.freedesktop.org/>
References: <bug-91284-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1770639874=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91284-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1770639874==
Content-Type: multipart/alternative; boundary="1436648404.6dDD5dfF1.18477"; charset="UTF-8"


--1436648404.6dDD5dfF1.18477
Date: Sat, 11 Jul 2015 21:00:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91284

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Pushed as

commit fdc528306e4018b314f2efcb2be4e37672bddd75
Author: Vadim Rutkovsky <vrutkovs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Thu Jul 9 23:23:37 2015 +0200

    Adapt to new dirty tracking api

    Mirrors commit b6d871bf2 (radeon: adopt for new X server dirty tracking
    APIs.) in xf86-video-ati.

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=91284

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436648404.6dDD5dfF1.18477
Date: Sat, 11 Jul 2015 21:00:04 +0000
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
   title="RESOLVED FIXED - xf86-video-nouveau fails to build with latest xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91284">bug 91284</a>
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
   title="RESOLVED FIXED - xf86-video-nouveau fails to build with latest xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91284#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - xf86-video-nouveau fails to build with latest xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91284">bug 91284</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Pushed as

commit fdc528306e4018b314f2efcb2be4e37672bddd75
Author: Vadim Rutkovsky &lt;<a href="mailto:vrutkovs&#64;redhat.com">vrutkovs&#64;redhat.com</a>&gt;
Date:   Thu Jul 9 23:23:37 2015 +0200

    Adapt to new dirty tracking api

    Mirrors commit b6d871bf2 (radeon: adopt for new X server dirty tracking
    APIs.) in xf86-video-ati.

    Bugzilla: <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - xf86-video-nouveau fails to build with latest xorg"
   href="show_bug.cgi?id=91284">https://bugs.freedesktop.org/show_bug.cgi?id=91284</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436648404.6dDD5dfF1.18477--

--===============1770639874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1770639874==--
