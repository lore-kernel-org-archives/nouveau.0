From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91526] World of Warcraft (on Wine) has UI corruption
 with nouveau
Date: Thu, 10 Sep 2015 01:58:46 +0000
Message-ID: <bug-91526-8800-ohTQdxFCcQ@http.bugs.freedesktop.org/>
References: <bug-91526-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1524988308=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91526-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1524988308==
Content-Type: multipart/alternative; boundary="1441850326.dc301.1884"; charset="UTF-8"


--1441850326.dc301.1884
Date: Thu, 10 Sep 2015 01:58:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91526

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Actually I ended up just pushing something that removes it on Fermi and newer.
I tried to get the blob to use that format, but couldn't. This leads me to
believe that for whatever reason it is no longer supported. Or... something. I
double-checked that it still works on tesla though.

commit 342e68dc60eebb20ac1be9f47800ee9e604354f0
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Wed Sep 9 21:50:03 2015 -0400

    nvc0: remove BGRA4 format support

    Something is wrong with the support somewhere. I couldn't get the blob
    driver to use it either, although it happily used RGB5_A1.
    teximage-colors works, but WoW seems to fail in the menus for drawing
    text.

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=91526
    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
    Cc: "10.6 11.0" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1441850326.dc301.1884
Date: Thu, 10 Sep 2015 01:58:46 +0000
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
   title="RESOLVED FIXED - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526">bug 91526</a>
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
   title="RESOLVED FIXED - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91526">bug 91526</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Actually I ended up just pushing something that removes it on Fermi and newer.
I tried to get the blob to use that format, but couldn't. This leads me to
believe that for whatever reason it is no longer supported. Or... something. I
double-checked that it still works on tesla though.

commit 342e68dc60eebb20ac1be9f47800ee9e604354f0
Author: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
Date:   Wed Sep 9 21:50:03 2015 -0400

    nvc0: remove BGRA4 format support

    Something is wrong with the support somewhere. I couldn't get the blob
    driver to use it either, although it happily used RGB5_A1.
    teximage-colors works, but WoW seems to fail in the menus for drawing
    text.

    Bugzilla: <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - World of Warcraft (on Wine) has UI corruption with nouveau"
   href="show_bug.cgi?id=91526">https://bugs.freedesktop.org/show_bug.cgi?id=91526</a>
    Signed-off-by: Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt;
    Cc: &quot;10.6 11.0&quot; &lt;<a href="mailto:mesa-stable&#64;lists.freedesktop.org">mesa-stable&#64;lists.freedesktop.org</a>&gt;</pre>
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

--1441850326.dc301.1884--

--===============1524988308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1524988308==--
