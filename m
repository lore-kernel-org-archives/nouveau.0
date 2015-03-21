From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89572] [NV86] Video playback corruption with nouveau,
	vdpau
Date: Sat, 21 Mar 2015 17:33:46 +0000
Message-ID: <bug-89572-8800-ddR4H3luiN@http.bugs.freedesktop.org/>
References: <bug-89572-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0057114601=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89572-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0057114601==
Content-Type: multipart/alternative; boundary="1426959226.263a2.27443"; charset="UTF-8"


--1426959226.263a2.27443
Date: Sat, 21 Mar 2015 17:33:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D89572

S=C3=A9bastien P. <sebastien.picavet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sebastien.picavet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #6 from S=C3=A9bastien P. <sebastien.picavet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Same thing on NV96.

Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- RT_FAULT - Address 002048c080
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- e0c: 00000000, e18: 00000000, e1c: 07a40020, e20: 00001100, e24: 00030000
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- RT_FAULT - Address 002048c0c0
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- e0c: 00000000, e18: 00000000, e1c: 07a40030, e20: 00001100, e24: 00030000
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] ch 6
[0x001f622000 mplayer[21538]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f0=
10
Mar 21 18:13:20 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x002048c0c0 on channel 0x0001f622 [mplayer[21538]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- RT_FAULT - Address 002047c080
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- e0c: 00000000, e18: 00000000, e1c: 06a40020, e20: 00001100, e24: 00030000
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- RT_FAULT - Address 002047c0c0
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- e0c: 00000000, e18: 00000000, e1c: 06a40030, e20: 00001100, e24: 00030000
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] ch 6
[0x001f622000 mplayer[21538]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f0=
10
Mar 21 18:13:20 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x002047c0c0 on channel 0x0001f622 [mplayer[21538]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 21 18:13:20 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x0020539080 on channel 0x0001f622 [mplayer[21538]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 21 18:13:20 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x00410a00c0 on channel 0x0001f622 [mplayer[21538]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1426959226.263a2.27443
Date: Sat, 21 Mar 2015 17:33:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:sebastien=
.picavet&#64;gmail.com" title=3D"S=C3=A9bastien P. &lt;sebastien.picavet&#6=
4;gmail.com&gt;"> <span class=3D"fn">S=C3=A9bastien P.</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV86] Video playback corruption with nouveau, vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89572">bug 89572<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>sebastien.picavet&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV86] Video playback corruption with nouveau, vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89572#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV86] Video playback corruption with nouveau, vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89572">bug 89572<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sebastien.picavet&#64;gmail.com" title=3D"S=C3=A9bastien P. &lt;sebastien.p=
icavet&#64;gmail.com&gt;"> <span class=3D"fn">S=C3=A9bastien P.</span></a>
</span></b>
        <pre>Same thing on NV96.

Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- RT_FAULT - Address 002048c080
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- e0c: 00000000, e18: 00000000, e1c: 07a40020, e20: 00001100, e24: 00030000
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- RT_FAULT - Address 002048c0c0
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- e0c: 00000000, e18: 00000000, e1c: 07a40030, e20: 00001100, e24: 00030000
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] ch 6
[0x001f622000 mplayer[21538]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f0=
10
Mar 21 18:13:20 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x002048c0c0 on channel 0x0001f622 [mplayer[21538]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- RT_FAULT - Address 002047c080
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- e0c: 00000000, e18: 00000000, e1c: 06a40020, e20: 00001100, e24: 00030000
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- RT_FAULT - Address 002047c0c0
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- e0c: 00000000, e18: 00000000, e1c: 06a40030, e20: 00001100, e24: 00030000
Mar 21 18:13:20 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] ch 6
[0x001f622000 mplayer[21538]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f0=
10
Mar 21 18:13:20 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x002047c0c0 on channel 0x0001f622 [mplayer[21538]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 21 18:13:20 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x0020539080 on channel 0x0001f622 [mplayer[21538]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 21 18:13:20 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x00410a00c0 on channel 0x0001f622 [mplayer[21538]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT</pre>
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

--1426959226.263a2.27443--

--===============0057114601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0057114601==--
