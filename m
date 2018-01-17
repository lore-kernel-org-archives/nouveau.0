From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104621] [GP107] Nouveau prevents booting on Pascal
	Gpu
Date: Wed, 17 Jan 2018 04:54:13 +0000
Message-ID: <bug-104621-8800-p5jxnS4Tpv@http.bugs.freedesktop.org/>
References: <bug-104621-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0811756831=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104621-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0811756831==
Content-Type: multipart/alternative; boundary="15161648534.42dDddDb9.14639"
Content-Transfer-Encoding: 7bit


--15161648534.42dDddDb9.14639
Date: Wed, 17 Jan 2018 04:54:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104621

Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
            Summary|Nouveau prevents booting on |[GP107] Nouveau prevents
                   |Pascal Gpu                  |booting on Pascal Gpu
           See Also|                            |https://bugs.freedesktop.or
                   |                            |g/show_bug.cgi?id=3D101553
         Resolution|---                         |DUPLICATE

--- Comment #4 from Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Based on the kernel backtrace and system this is a duplicate of a bug report
already (bz#100228) that tracks support for the GP107/nv137 chip. Take a lo=
ok
there for the software packages that you will need and ongoing development
work.

Given you can run with 'nouveau.runpm=3D0', you likely have all of the curr=
ent
required software packages for *preliminary* support for GP10x. The prior
downstream kernel shipped by Linux Mint 18.2 probably lacked any software
support attempting the bring up the GP107 graphics card.

As outlined by Ilia Mirkin, you will need at minimum (numbers are the mainl=
ine
version or Debian packages, not sure which kernel fixes/features Arch
backports):

Linux kernel >=3D 4.12
xf86-video-nouveau >=3D 1.0.15
linux-firmware >=3D 1.165
mesa git

Double check your linux-firmware as there was incorrect Pascal firmware loa=
ded
during early 2017.

*** This bug has been marked as a duplicate of bug 100228 ***

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15161648534.42dDddDb9.14639
Date: Wed, 17 Jan 2018 04:54:13 +0000
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
   title=3D"RESOLVED DUPLICATE - [GP107] Nouveau prevents booting on Pascal=
 Gpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104621">bug 10462=
1</a>
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
           <td style=3D"text-align:right;">Summary</td>
           <td>Nouveau prevents booting on Pascal Gpu
           </td>
           <td>[GP107] Nouveau prevents booting on Pascal Gpu
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">See Also</td>
           <td>
               &nbsp;
           </td>
           <td>https://bugs.freedesktop.org/show_bug.cgi?id=3D101553
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>DUPLICATE
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - [GP107] Nouveau prevents booting on Pascal=
 Gpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104621#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - [GP107] Nouveau prevents booting on Pascal=
 Gpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104621">bug 10462=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rhyskidd&#64;gmail.com" title=3D"Rhys Kidd &lt;rhyskidd&#64;gmail.com&gt;">=
 <span class=3D"fn">Rhys Kidd</span></a>
</span></b>
        <pre>Based on the kernel backtrace and system this is a duplicate o=
f a bug report
already (bz#100228) that tracks support for the GP107/nv137 chip. Take a lo=
ok
there for the software packages that you will need and ongoing development
work.

Given you can run with 'nouveau.runpm=3D0', you likely have all of the curr=
ent
required software packages for *preliminary* support for GP10x. The prior
downstream kernel shipped by Linux Mint 18.2 probably lacked any software
support attempting the bring up the GP107 graphics card.

As outlined by Ilia Mirkin, you will need at minimum (numbers are the mainl=
ine
version or Debian packages, not sure which kernel fixes/features Arch
backports):

Linux kernel &gt;=3D 4.12
xf86-video-nouveau &gt;=3D 1.0.15
linux-firmware &gt;=3D 1.165
mesa git

Double check your linux-firmware as there was incorrect Pascal firmware loa=
ded
during early 2017.

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

--15161648534.42dDddDb9.14639--

--===============0811756831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0811756831==--
