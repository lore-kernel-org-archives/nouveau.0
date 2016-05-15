From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95403] [GK110] misaligned_gpr spamming dmesg when
 playing victor vran
Date: Sun, 15 May 2016 14:54:40 +0000
Message-ID: <bug-95403-8800-eDSWAcrh4t@http.bugs.freedesktop.org/>
References: <bug-95403-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1546065474=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95403-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1546065474==
Content-Type: multipart/alternative; boundary="14633240800.0AF5900.22224";
 charset="UTF-8"


--14633240800.0AF5900.22224
Date: Sun, 15 May 2016 14:54:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95403

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Should be fixed by:

commit 2ef3cdb07e42d985103b5a3e930b2bba676e920b
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Sat May 14 19:25:15 2016 -0400

    nvc0/ir: make sure to align the second arg of TXD to 4, as we do for TEX

    This was handled in handleTEX(), however the way the logic works, those
    extra arguments aren't added on by then, so it did nothing. Instead we
    must duplicate that bit here. GK110 appears to complain about
    MISALIGNED_GPR, however it's reasonable to believe that GK104 has the
    same requirements.

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D95403
    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
    Cc: mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
    Reviewed-by: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14633240800.0AF5900.22224
Date: Sun, 15 May 2016 14:54:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:imirkin&#=
64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <s=
pan class=3D"fn">Ilia Mirkin</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [GK110] misaligned_gpr spamming dmesg when pla=
ying victor vran"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95403">bug 95403<=
/a>
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
   title=3D"RESOLVED FIXED - [GK110] misaligned_gpr spamming dmesg when pla=
ying victor vran"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95403#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [GK110] misaligned_gpr spamming dmesg when pla=
ying victor vran"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95403">bug 95403<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Should be fixed by:

commit 2ef3cdb07e42d985103b5a3e930b2bba676e920b
Author: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.edu">imirkin=
&#64;alum.mit.edu</a>&gt;
Date:   Sat May 14 19:25:15 2016 -0400

    nvc0/ir: make sure to align the second arg of TXD to 4, as we do for TEX

    This was handled in handleTEX(), however the way the logic works, those
    extra arguments aren't added on by then, so it did nothing. Instead we
    must duplicate that bit here. GK110 appears to complain about
    MISALIGNED_GPR, however it's reasonable to believe that GK104 has the
    same requirements.

    Bugzilla: <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [GK110] misaligned_gpr spamming dmesg when pla=
ying victor vran"
   href=3D"show_bug.cgi?id=3D95403">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D95403</a>
    Signed-off-by: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.e=
du">imirkin&#64;alum.mit.edu</a>&gt;
    Cc: <a href=3D"mailto:mesa-stable&#64;lists.freedesktop.org">mesa-stabl=
e&#64;lists.freedesktop.org</a>
    Reviewed-by: Samuel Pitoiset &lt;<a href=3D"mailto:samuel.pitoiset&#64;=
gmail.com">samuel.pitoiset&#64;gmail.com</a>&gt;</pre>
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

--14633240800.0AF5900.22224--

--===============1546065474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1546065474==--
