From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54587] [NV1F] Flickering screen on Geforce 4
Date: Fri, 03 Jun 2016 04:23:59 +0000
Message-ID: <bug-54587-8800-Mj7vs0nBhZ@http.bugs.freedesktop.org/>
References: <bug-54587-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0393950049=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54587-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0393950049==
Content-Type: multipart/alternative; boundary="14649278381.c16231B9.3424";
 charset="UTF-8"


--14649278381.c16231B9.3424
Date: Fri, 3 Jun 2016 04:23:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D54587

--- Comment #34 from Patrick McMunn <doctorwhoguy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I wonder if this bug may either be related to, or may actually be the same =
as,
bug 61537. I also have this same issue with a PC using an nVidia GeForce 4 =
MX
IGP, and I know that the monitor attached to it has a bad EDID. I suspect V=
esa
may also have a monitor with a bad EDID; that would explain why his monitor=
's
resolution was not correctly detected by Xorg (see comment #12).

I applied the above patch to Linux 4.4.11 sources, recompiled my kernel, and
rebooted. The problem is not completely fixed, but it is noticeably improve=
d.
Whereas before the whole screen would intermittently jump, now there are si=
mply
random flashes of horizontal lines on random places on the screen. I genera=
lly
run this box as a light-duty server, so I mainly ssh into it from my deskto=
p,
and I didn't boot into a GUI for testing. I just booted it and observed the
text console.

I wouldn't consider this patch a fix, but it is perhaps a mitigation. In any
case, since I suspect that this may actually be the same as bug 61537, it w=
ould
probably be wise to discuss with other devs, per Martin Peres' comment, bef=
ore
submitting any changes to the tree.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14649278381.c16231B9.3424
Date: Fri, 3 Jun 2016 04:23:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV1F] Flickering screen on Geforce 4"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D54587#c34">Commen=
t # 34</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV1F] Flickering screen on Geforce 4"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D54587">bug 54587<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
doctorwhoguy&#64;gmail.com" title=3D"Patrick McMunn &lt;doctorwhoguy&#64;gm=
ail.com&gt;"> <span class=3D"fn">Patrick McMunn</span></a>
</span></b>
        <pre>I wonder if this bug may either be related to, or may actually=
 be the same as,
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flicker when using display with incorrect EDID"
   href=3D"show_bug.cgi?id=3D61537">bug 61537</a>. I also have this same is=
sue with a PC using an nVidia GeForce 4 MX
IGP, and I know that the monitor attached to it has a bad EDID. I suspect V=
esa
may also have a monitor with a bad EDID; that would explain why his monitor=
's
resolution was not correctly detected by Xorg (see <a href=3D"show_bug.cgi?=
id=3D54587#c12">comment #12</a>).

I applied the above patch to Linux 4.4.11 sources, recompiled my kernel, and
rebooted. The problem is not completely fixed, but it is noticeably improve=
d.
Whereas before the whole screen would intermittently jump, now there are si=
mply
random flashes of horizontal lines on random places on the screen. I genera=
lly
run this box as a light-duty server, so I mainly ssh into it from my deskto=
p,
and I didn't boot into a GUI for testing. I just booted it and observed the
text console.

I wouldn't consider this patch a fix, but it is perhaps a mitigation. In any
case, since I suspect that this may actually be the same as <a class=3D"bz_=
bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flicker when using display with incorrect EDID"
   href=3D"show_bug.cgi?id=3D61537">bug 61537</a>, it would
probably be wise to discuss with other devs, per Martin Peres' comment, bef=
ore
submitting any changes to the tree.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14649278381.c16231B9.3424--

--===============0393950049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0393950049==--
