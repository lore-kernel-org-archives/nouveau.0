From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99532] Compute shader doesn't give right result
 under some circumstances
Date: Tue, 14 Feb 2017 02:14:11 +0000
Message-ID: <bug-99532-8800-kZ1UT32Lgc@http.bugs.freedesktop.org/>
References: <bug-99532-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1080498840=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99532-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1080498840==
Content-Type: multipart/alternative; boundary="14870384500.B37E.9983";
 charset="UTF-8"


--14870384500.B37E.9983
Date: Tue, 14 Feb 2017 02:14:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99532

Boyan Ding <stu_dby-KN7UnAbNpbg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #19 from Boyan Ding <stu_dby-KN7UnAbNpbg@public.gmane.org> ---
commit 956556b3c30ce3d38d0af795f9383df3bc2cf8a2
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Mon Feb 13 11:14:51 2017 -0500

    nvc0: disable linked tsc mode in compute launch descriptor

    Empirically, this makes things work. Presumably this was originally
    copied from the blob, which does make use of linked tsc mode.

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D99532
    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
    Reviewed-by: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    Cc: mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14870384500.B37E.9983
Date: Tue, 14 Feb 2017 02:14:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:stu_dby&#=
64;126.com" title=3D"Boyan Ding &lt;stu_dby&#64;126.com&gt;"> <span class=
=3D"fn">Boyan Ding</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Compute shader doesn't give right result under=
 some circumstances"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99532">bug 99532<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Compute shader doesn't give right result under=
 some circumstances"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99532#c19">Commen=
t # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Compute shader doesn't give right result under=
 some circumstances"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99532">bug 99532<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stu_dby&#64;126.com" title=3D"Boyan Ding &lt;stu_dby&#64;126.com&gt;"> <spa=
n class=3D"fn">Boyan Ding</span></a>
</span></b>
        <pre>commit 956556b3c30ce3d38d0af795f9383df3bc2cf8a2
Author: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.edu">imirkin=
&#64;alum.mit.edu</a>&gt;
Date:   Mon Feb 13 11:14:51 2017 -0500

    nvc0: disable linked tsc mode in compute launch descriptor

    Empirically, this makes things work. Presumably this was originally
    copied from the blob, which does make use of linked tsc mode.

    Bugzilla: <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Compute shader doesn't give right result under=
 some circumstances"
   href=3D"show_bug.cgi?id=3D99532">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D99532</a>
    Signed-off-by: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.e=
du">imirkin&#64;alum.mit.edu</a>&gt;
    Reviewed-by: Samuel Pitoiset &lt;<a href=3D"mailto:samuel.pitoiset&#64;=
gmail.com">samuel.pitoiset&#64;gmail.com</a>&gt;
    Cc: <a href=3D"mailto:mesa-stable&#64;lists.freedesktop.org">mesa-stabl=
e&#64;lists.freedesktop.org</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14870384500.B37E.9983--

--===============1080498840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1080498840==--
