From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88514] X segfaults when using prime offloading to
	nouveau card
Date: Mon, 26 Jan 2015 10:36:01 +0000
Message-ID: <bug-88514-8800-154z8iPNNs@http.bugs.freedesktop.org/>
References: <bug-88514-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2025313917=="
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


--===============2025313917==
Content-Type: multipart/alternative; boundary="1422268560.28e82.9742"; charset="UTF-8"


--1422268560.28e82.9742
Date: Mon, 26 Jan 2015 10:36:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88514

Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #13 from Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org> ---
commit 082931014811e587a9734cbf4d88fd948979b641
Author: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>
Date:   Sat Jan 17 10:09:54 2015 +0000

    dri2: SourceOffloads may be for DRI3 only

    As a DDX may declare offload support without supporting DRI2
    (because it is using an alternative acceleration mechanism like DRI3),
    when iterating the list of offload_source Screens to find a matching
    DRI2 provider we need to check before assuming it is DRI2 capable.

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=88514
    Signed-off-by: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>
    Reviewed-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Signed-off-by: Keith Packard <keithp-aN4HjG94KOLQT0dZR+AlfA@public.gmane.org>

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422268560.28e82.9742
Date: Mon, 26 Jan 2015 10:36:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:chris&#64;chris-wilson.co.uk" title="Chris Wilson &lt;chris&#64;chris-wilson.co.uk&gt;"> <span class="fn">Chris Wilson</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - X segfaults when using prime offloading to nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88514">bug 88514</a>
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
   title="RESOLVED FIXED - X segfaults when using prime offloading to nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88514#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - X segfaults when using prime offloading to nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88514">bug 88514</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;chris-wilson.co.uk" title="Chris Wilson &lt;chris&#64;chris-wilson.co.uk&gt;"> <span class="fn">Chris Wilson</span></a>
</span></b>
        <pre>commit 082931014811e587a9734cbf4d88fd948979b641
Author: Chris Wilson &lt;<a href="mailto:chris&#64;chris-wilson.co.uk">chris&#64;chris-wilson.co.uk</a>&gt;
Date:   Sat Jan 17 10:09:54 2015 +0000

    dri2: SourceOffloads may be for DRI3 only

    As a DDX may declare offload support without supporting DRI2
    (because it is using an alternative acceleration mechanism like DRI3),
    when iterating the list of offload_source Screens to find a matching
    DRI2 provider we need to check before assuming it is DRI2 capable.

    Bugzilla: <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - X segfaults when using prime offloading to nouveau card"
   href="show_bug.cgi?id=88514">https://bugs.freedesktop.org/show_bug.cgi?id=88514</a>
    Signed-off-by: Chris Wilson &lt;<a href="mailto:chris&#64;chris-wilson.co.uk">chris&#64;chris-wilson.co.uk</a>&gt;
    Reviewed-by: Dave Airlie &lt;<a href="mailto:airlied&#64;redhat.com">airlied&#64;redhat.com</a>&gt;
    Signed-off-by: Keith Packard &lt;<a href="mailto:keithp&#64;keithp.com">keithp&#64;keithp.com</a>&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422268560.28e82.9742--

--===============2025313917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2025313917==--
