From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100177] [GM206] Misrendering in XCOM Ennemy Within
Date: Mon, 30 Jul 2018 16:23:10 +0000
Message-ID: <bug-100177-8800-RaSBpoM4n1@http.bugs.freedesktop.org/>
References: <bug-100177-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0361724182=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100177-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0361724182==
Content-Type: multipart/alternative; boundary="15329677900.E2828.20235"
Content-Transfer-Encoding: 7bit


--15329677900.E2828.20235
Date: Mon, 30 Jul 2018 16:23:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100177

Rhys Perry <pendingchaos02+fdobugzilla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #6 from Rhys Perry <pendingchaos02+fdobugzilla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Fixed by:

commit f310e86a4200d8ecc74f9ae682386b6ecd1d09d2
Author: Rhys Perry <pendingchaos02-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Sun Jul 15 23:14:41 2018 +0100

    nvc0: serialize before updating some constant buffer bindings on Maxwel=
l+

    To avoid serializing, this has the user constant buffer always be 65536
    bytes and enabled unless it's required that something else is used for
    constant buffer 0.

    Fixes artifacts with at least XCOM: Enemy Within, 0 A.D. and Unigine
    Valley, Heaven and Superposition.

    v2: changed uniform_buffer_bound to be bool instead of a uint32_t
    v3: remove magic constants
    v3: remove pointless code in nvc0_validate_driverconst

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D100177
    Signed-off-by: Rhys Perry <pendingchaos02-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15329677900.E2828.20235
Date: Mon, 30 Jul 2018 16:23:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:pendingch=
aos02+fdobugzilla&#64;gmail.com" title=3D"Rhys Perry &lt;pendingchaos02+fdo=
bugzilla&#64;gmail.com&gt;"> <span class=3D"fn">Rhys Perry</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [GM206] Misrendering in XCOM Ennemy Within"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100177">bug 10017=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [GM206] Misrendering in XCOM Ennemy Within"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100177#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [GM206] Misrendering in XCOM Ennemy Within"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100177">bug 10017=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pendingchaos02+fdobugzilla&#64;gmail.com" title=3D"Rhys Perry &lt;pendingch=
aos02+fdobugzilla&#64;gmail.com&gt;"> <span class=3D"fn">Rhys Perry</span><=
/a>
</span></b>
        <pre>Fixed by:

commit f310e86a4200d8ecc74f9ae682386b6ecd1d09d2
Author: Rhys Perry &lt;<a href=3D"mailto:pendingchaos02&#64;gmail.com">pend=
ingchaos02&#64;gmail.com</a>&gt;
Date:   Sun Jul 15 23:14:41 2018 +0100

    nvc0: serialize before updating some constant buffer bindings on Maxwel=
l+

    To avoid serializing, this has the user constant buffer always be 65536
    bytes and enabled unless it's required that something else is used for
    constant buffer 0.

    Fixes artifacts with at least XCOM: Enemy Within, 0 A.D. and Unigine
    Valley, Heaven and Superposition.

    v2: changed uniform_buffer_bound to be bool instead of a uint32_t
    v3: remove magic constants
    v3: remove pointless code in nvc0_validate_driverconst

    Bugzilla: <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [GM206] Misrendering in XCOM Ennemy Within"
   href=3D"show_bug.cgi?id=3D100177">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D100177</a>
    Signed-off-by: Rhys Perry &lt;<a href=3D"mailto:pendingchaos02&#64;gmai=
l.com">pendingchaos02&#64;gmail.com</a>&gt;
    Reviewed-by: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.edu=
">imirkin&#64;alum.mit.edu</a>&gt;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15329677900.E2828.20235--

--===============0361724182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0361724182==--
