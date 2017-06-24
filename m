From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101573] GP107 crash with no HDMI connected on
	4.12.rc6
Date: Sat, 24 Jun 2017 14:36:30 +0000
Message-ID: <bug-101573-8800-L0qDuHYjpZ@http.bugs.freedesktop.org/>
References: <bug-101573-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0887922852=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101573-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0887922852==
Content-Type: multipart/alternative; boundary="14983149902.Ed89F6B.31490";
 charset="UTF-8"


--14983149902.Ed89F6B.31490
Date: Sat, 24 Jun 2017 14:36:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101573

Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |DUPLICATE
             Status|NEW                         |RESOLVED

--- Comment #3 from Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi harry_x,

This timeout fault with the GP107 (nv137) is already being tracked in
bz#100228.

It's helpful that you've seen in testing that the NVIDIA card is brought up
when a HDMI output is connected to it, but not when the NVIDIA card has no
connected output.

*** This bug has been marked as a duplicate of bug 100228 ***

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14983149902.Ed89F6B.31490
Date: Sat, 24 Jun 2017 14:36:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:rhyskidd&=
#64;gmail.com" title=3D"Rhys Kidd &lt;rhyskidd&#64;gmail.com&gt;"> <span cl=
ass=3D"fn">Rhys Kidd</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - GP107 crash with no HDMI connected on 4.12=
.rc6"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101573">bug 10157=
3</a>
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
           <td>DUPLICATE
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
   title=3D"RESOLVED DUPLICATE - GP107 crash with no HDMI connected on 4.12=
.rc6"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101573#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - GP107 crash with no HDMI connected on 4.12=
.rc6"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101573">bug 10157=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rhyskidd&#64;gmail.com" title=3D"Rhys Kidd &lt;rhyskidd&#64;gmail.com&gt;">=
 <span class=3D"fn">Rhys Kidd</span></a>
</span></b>
        <pre>Hi harry_x,

This timeout fault with the GP107 (nv137) is already being tracked in
bz#100228.

It's helpful that you've seen in testing that the NVIDIA card is brought up
when a HDMI output is connected to it, but not when the NVIDIA card has no
connected output.

*** This bug has been marked as a duplicate of <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"show_bug.cgi?id=3D100228">bug 100228</a> ***</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14983149902.Ed89F6B.31490--

--===============0887922852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0887922852==--
