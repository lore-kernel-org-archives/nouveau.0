From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27680] Misaligned reg ... nVidia Corporation C67
 [GeForce 7150M / nForce 630M] (rev a2)
Date: Mon, 08 Oct 2012 20:01:03 +0000
Message-ID: <bug-27680-8800-P5kdLrB0Dk@http.bugs.freedesktop.org/>
References: <bug-27680-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0262111320=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27680-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0262111320==
Content-Type: multipart/alternative; boundary="1349726463.6F4752.5531"; charset="us-ascii"


--1349726463.6F4752.5531
Date: Mon, 8 Oct 2012 20:01:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D27680

--- Comment #4 from M=C4=81ris Vilks <kaaposc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
A small additional info.
This error msg occurs during VBIOS parsing:
Oct 08 21:56:28 fractal kernel: [drm] nouveau 0000:00:12.0: Parsing VBIOS i=
nit
table 0 at offset 0xE2EF
Oct 08 21:56:28 fractal kernel: [drm] nouveau 0000:00:12.0: =3D=3D=3D=3D=3D=
=3D=3D misaligned
reg 0x001020FB =3D=3D=3D=3D=3D=3D=3D
Oct 08 21:56:28 fractal kernel: [drm] nouveau 0000:00:12.0: =3D=3D=3D=3D=3D=
=3D=3D misaligned
reg 0x001020FB =3D=3D=3D=3D=3D=3D=3D
Oct 08 21:56:28 fractal kernel: [drm] nouveau 0000:00:12.0: Parsing VBIOS i=
nit
table 1 at offset 0xE440

See complete (and somewhat censored) dmesg and Xorg.0.log attached. Although
Xorg log is scarcely relevant because these error messages do not seem to
correlate to any visible problem.

Distro: Archlinux
uname -a: Linux fractal 3.5.6-1-ARCH #1 SMP PREEMPT Sun Oct 7 19:30:49 CEST
2012 x86_64 GNU/Linux
Machine: Acer Aspire 5520 laptop with NVIDIA GeForce(R) 7000M

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1349726463.6F4752.5531
Date: Mon, 8 Oct 2012 20:01:03 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO --- - Misaligned reg ... nVidia Corporation C67 [GeFor=
ce 7150M / nForce 630M] (rev a2)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D27680#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO --- - Misaligned reg ... nVidia Corporation C67 [GeFor=
ce 7150M / nForce 630M] (rev a2)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D27680">bug 27680<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kaaposc&#64;gmail.com" title=3D"M=C4=81ris Vilks &lt;kaaposc&#64;gmail.com&=
gt;"> <span class=3D"fn">M=C4=81ris Vilks</span></a>
</span></b>
        <pre>A small additional info.
This error msg occurs during VBIOS parsing:
Oct 08 21:56:28 fractal kernel: [drm] nouveau 0000:00:12.0: Parsing VBIOS i=
nit
table 0 at offset 0xE2EF
Oct 08 21:56:28 fractal kernel: [drm] nouveau 0000:00:12.0: =3D=3D=3D=3D=3D=
=3D=3D misaligned
reg 0x001020FB =3D=3D=3D=3D=3D=3D=3D
Oct 08 21:56:28 fractal kernel: [drm] nouveau 0000:00:12.0: =3D=3D=3D=3D=3D=
=3D=3D misaligned
reg 0x001020FB =3D=3D=3D=3D=3D=3D=3D
Oct 08 21:56:28 fractal kernel: [drm] nouveau 0000:00:12.0: Parsing VBIOS i=
nit
table 1 at offset 0xE440

See complete (and somewhat censored) dmesg and Xorg.0.log attached. Although
Xorg log is scarcely relevant because these error messages do not seem to
correlate to any visible problem.

Distro: Archlinux
uname -a: Linux fractal 3.5.6-1-ARCH #1 SMP PREEMPT Sun Oct 7 19:30:49 CEST
2012 x86_64 GNU/Linux
Machine: Acer Aspire 5520 laptop with NVIDIA GeForce(R) 7000M</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1349726463.6F4752.5531--

--===============0262111320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0262111320==--
