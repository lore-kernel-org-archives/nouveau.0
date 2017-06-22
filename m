From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101553] [GP107] failed to create kernel channel, -22
Date: Thu, 22 Jun 2017 15:00:55 +0000
Message-ID: <bug-101553-8800-38j1PsMNQa@http.bugs.freedesktop.org/>
References: <bug-101553-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0263968322=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101553-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0263968322==
Content-Type: multipart/alternative; boundary="14981436550.279FA00c.17274";
 charset="UTF-8"


--14981436550.279FA00c.17274
Date: Thu, 22 Jun 2017 15:00:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101553

Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #3 from Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Anton,

There's a bug report already (bz#100228) that tracks support for the
GP107/nv137 chip. Take a look there for the software packages that you will
need.

As outlined by Ilia Mirkin, you will need at minimum (numbers are the mainl=
ine
version or Debian packages, not sure how Gentoo handles these):

Linux kernel >=3D 4.12
xf86-video-nouveau >=3D 1.0.15
linux-firmware >=3D 1.165
mesa git

This stack provides *preliminary* support for GP10x.

However, additionally for your XPS 9560 which uses the GP107, you will need=
 to
get around a current ACPI bug.

There are reports of this ACPI bug affecting the graphics card regardless of
whether you use the proprietary nvidia driver or the open source nouveau
driver. So it's not a nouveau problem, but is causing the issues with soft
lockups.

You need to set acpi_rev_override=3D1 (any positive non-zero number works) =
in
your GRUB boot line. The kernel must have been built with
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE.

https://github.com/Bumblebee-Project/bbswitch/issues/148#issuecomment-28363=
9754

*** This bug has been marked as a duplicate of bug 100228 ***

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14981436550.279FA00c.17274
Date: Thu, 22 Jun 2017 15:00:55 +0000
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
   title=3D"RESOLVED DUPLICATE - [GP107] failed to create kernel channel, -=
22"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101553">bug 10155=
3</a>
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
           <td>DUPLICATE
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - [GP107] failed to create kernel channel, -=
22"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101553#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - [GP107] failed to create kernel channel, -=
22"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101553">bug 10155=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rhyskidd&#64;gmail.com" title=3D"Rhys Kidd &lt;rhyskidd&#64;gmail.com&gt;">=
 <span class=3D"fn">Rhys Kidd</span></a>
</span></b>
        <pre>Hi Anton,

There's a bug report already (bz#100228) that tracks support for the
GP107/nv137 chip. Take a look there for the software packages that you will
need.

As outlined by Ilia Mirkin, you will need at minimum (numbers are the mainl=
ine
version or Debian packages, not sure how Gentoo handles these):

Linux kernel &gt;=3D 4.12
xf86-video-nouveau &gt;=3D 1.0.15
linux-firmware &gt;=3D 1.165
mesa git

This stack provides *preliminary* support for GP10x.

However, additionally for your XPS 9560 which uses the GP107, you will need=
 to
get around a current ACPI bug.

There are reports of this ACPI bug affecting the graphics card regardless of
whether you use the proprietary nvidia driver or the open source nouveau
driver. So it's not a nouveau problem, but is causing the issues with soft
lockups.

You need to set acpi_rev_override=3D1 (any positive non-zero number works) =
in
your GRUB boot line. The kernel must have been built with
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE.

<a href=3D"https://github.com/Bumblebee-Project/bbswitch/issues/148#issueco=
mment-283639754">https://github.com/Bumblebee-Project/bbswitch/issues/148#i=
ssuecomment-283639754</a>

*** This bug has been marked as a duplicate of <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] unknown chipset (137000a1)"
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

--14981436550.279FA00c.17274--

--===============0263968322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0263968322==--
