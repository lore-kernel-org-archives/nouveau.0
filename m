From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90350] [G96] Portal's portal are incorrectly rendered
Date: Sat, 09 May 2015 17:57:52 +0000
Message-ID: <bug-90350-8800-zPUM3t4hod@http.bugs.freedesktop.org/>
References: <bug-90350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0733560651=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0733560651==
Content-Type: multipart/alternative; boundary="1431194272.E4dFCa0.22684"; charset="UTF-8"


--1431194272.E4dFCa0.22684
Date: Sat, 9 May 2015 17:57:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90350

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looks like I was right in my guess. Since NVAC tends to have the same things as
NVA0, I'm assuming that FMUL.SAT becomes a thing on G200+. Fix pushed:

commit da136dc07ddb6147d181c96f475b94f6281efd73
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Sat May 9 03:26:07 2015 -0400

    nv50/ir: only enable mul saturate on G200+

    Commit 44673512a84 enabled support for saturating fmul. However
    experimentally this does not seem to work on the older chips. Restrict
    the feature to G200 (NVA0) and later.

    Reported-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=90350
    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
    Tested-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
    Reviewed-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
    Cc: mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1431194272.E4dFCa0.22684
Date: Sat, 9 May 2015 17:57:52 +0000
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
   title="RESOLVED FIXED - [G96] Portal's portal are incorrectly rendered"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90350">bug 90350</a>
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
   title="RESOLVED FIXED - [G96] Portal's portal are incorrectly rendered"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90350#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [G96] Portal's portal are incorrectly rendered"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90350">bug 90350</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looks like I was right in my guess. Since NVAC tends to have the same things as
NVA0, I'm assuming that FMUL.SAT becomes a thing on G200+. Fix pushed:

commit da136dc07ddb6147d181c96f475b94f6281efd73
Author: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
Date:   Sat May 9 03:26:07 2015 -0400

    nv50/ir: only enable mul saturate on G200+

    Commit 44673512a84 enabled support for saturating fmul. However
    experimentally this does not seem to work on the older chips. Restrict
    the feature to G200 (NVA0) and later.

    Reported-by: Pierre Moreau &lt;<a href="mailto:pierre.morrow&#64;free.fr">pierre.morrow&#64;free.fr</a>&gt;
    Bugzilla: <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [G96] Portal's portal are incorrectly rendered"
   href="show_bug.cgi?id=90350">https://bugs.freedesktop.org/show_bug.cgi?id=90350</a>
    Signed-off-by: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
    Tested-by: Pierre Moreau &lt;<a href="mailto:pierre.morrow&#64;free.fr">pierre.morrow&#64;free.fr</a>&gt;
    Reviewed-by: Tobias Klausmann &lt;<a href="mailto:tobias.johannes.klausmann&#64;mni.thm.de">tobias.johannes.klausmann&#64;mni.thm.de</a>&gt;
    Cc: <a href="mailto:mesa-stable&#64;lists.freedesktop.org">mesa-stable&#64;lists.freedesktop.org</a></pre>
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

--1431194272.E4dFCa0.22684--

--===============0733560651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0733560651==--
