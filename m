From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82835] [NV92] GeForce 8800 GS VDPAU h264 decoding
	hang
Date: Sat, 21 Mar 2015 17:46:58 +0000
Message-ID: <bug-82835-8800-pEe5Wy6UkR@http.bugs.freedesktop.org/>
References: <bug-82835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0741231531=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0741231531==
Content-Type: multipart/alternative; boundary="1426960018.6CB14.30431"; charset="UTF-8"


--1426960018.6CB14.30431
Date: Sat, 21 Mar 2015 17:46:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D82835

S=C3=A9bastien P. <sebastien.picavet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sebastien.picavet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #15 from S=C3=A9bastien P. <sebastien.picavet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
> Same problem here when trying to use vdpau on a G92 card

Same thing on NV96:
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- RT_FAULT - Address 00204150c0
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- e0c: 00000000, e18: 00000000, e1c: 00340030, e20: 00001100, e24: 00030000
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- RT_FAULT - Address 0020415080
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- e0c: 00000000, e18: 00000000, e1c: 00340020, e20: 00001100, e24: 00030000
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] ch 5
[0x001f7a8000 mplayer[31053]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f0=
10
Mar 20 23:36:15 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x0020415080 on channel 0x0001f7a8 [mplayer[31053]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 20 23:36:15 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x00204b7c40 on channel 0x0001f7a8 [mplayer[31053]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- RT_FAULT - Address 00204990c0
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- e0c: 00000000, e18: 00000000, e1c: 08740030, e20: 00001100, e24: 00030000
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- RT_FAULT - Address 0020499080
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- e0c: 00000000, e18: 00000000, e1c: 08740020, e20: 00001100, e24: 00030000
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] ch 5
[0x001f7a8000 mplayer[31053]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f0=
10
Mar 20 23:36:15 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x0020499080 on channel 0x0001f7a8 [mplayer[31053]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 20 23:36:15 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x0020533c40 on channel 0x0001f7a8 [mplayer[31053]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- RT_FAULT - Address 0040840080
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- e0c: 00000000, e18: 00000000, e1c: 05ac0020, e20: 00001100, e24: 00030000
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- RT_FAULT - Address 00408400c0
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- e0c: 00000000, e18: 00000000, e1c: 05ac0030, e20: 00001100, e24: 00030000
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] ch 5
[0x001f7a8000 mplayer[31053]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f0=
10
Mar 20 23:36:15 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x00408400c0 on channel 0x0001f7a8 [mplayer[31053]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 20 23:36:15 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x00408df000 on channel 0x0001f7a8 [mplayer[31053]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT

I have also notice that It happens when the load average of my system is qu=
ite
hight (compilation, backup).
=3D> Hang happenned during the playback.

Or when I openned two files too quickly.
=3D> Hang happenned immedialety.

mplayer 1.2 (20130729)
kernel 3.18.7
mesa 10.3.7
nvidia-firmware 340.32
xf86-video-nouveau 1.0.11
libva-vdpau-driver 0.7.4-r2
libvdpau 0.9
X 1.16.4

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1426960018.6CB14.30431
Date: Sat, 21 Mar 2015 17:46:58 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82835">bug 82835<=
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82835#c15">Commen=
t # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82835">bug 82835<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sebastien.picavet&#64;gmail.com" title=3D"S=C3=A9bastien P. &lt;sebastien.p=
icavet&#64;gmail.com&gt;"> <span class=3D"fn">S=C3=A9bastien P.</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; Same problem here when trying to us=
e vdpau on a G92 card</span >

Same thing on NV96:
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- RT_FAULT - Address 00204150c0
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- e0c: 00000000, e18: 00000000, e1c: 00340030, e20: 00001100, e24: 00030000
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- RT_FAULT - Address 0020415080
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- e0c: 00000000, e18: 00000000, e1c: 00340020, e20: 00001100, e24: 00030000
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] ch 5
[0x001f7a8000 mplayer[31053]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f0=
10
Mar 20 23:36:15 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x0020415080 on channel 0x0001f7a8 [mplayer[31053]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 20 23:36:15 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x00204b7c40 on channel 0x0001f7a8 [mplayer[31053]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- RT_FAULT - Address 00204990c0
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- e0c: 00000000, e18: 00000000, e1c: 08740030, e20: 00001100, e24: 00030000
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- RT_FAULT - Address 0020499080
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- e0c: 00000000, e18: 00000000, e1c: 08740020, e20: 00001100, e24: 00030000
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] ch 5
[0x001f7a8000 mplayer[31053]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f0=
10
Mar 20 23:36:15 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x0020499080 on channel 0x0001f7a8 [mplayer[31053]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 20 23:36:15 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x0020533c40 on channel 0x0001f7a8 [mplayer[31053]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- RT_FAULT - Address 0040840080
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 0
- e0c: 00000000, e18: 00000000, e1c: 05ac0020, e20: 00001100, e24: 00030000
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- RT_FAULT - Address 00408400c0
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] TRAP_PROP - =
TP 1
- e0c: 00000000, e18: 00000000, e1c: 05ac0030, e20: 00001100, e24: 00030000
Mar 20 23:36:15 fixe kernel: nouveau E[  PGRAPH][0000:02:00.0] ch 5
[0x001f7a8000 mplayer[31053]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f0=
10
Mar 20 23:36:15 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x00408400c0 on channel 0x0001f7a8 [mplayer[31053]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT
Mar 20 23:36:15 fixe kernel: nouveau E[     PFB][0000:02:00.0] trapped writ=
e at
0x00408df000 on channel 0x0001f7a8 [mplayer[31053]] PGRAPH/PROP/RT0 reason:
PAGE_NOT_PRESENT

I have also notice that It happens when the load average of my system is qu=
ite
hight (compilation, backup).
=3D&gt; Hang happenned during the playback.

Or when I openned two files too quickly.
=3D&gt; Hang happenned immedialety.

mplayer 1.2 (20130729)
kernel 3.18.7
mesa 10.3.7
nvidia-firmware 340.32
xf86-video-nouveau 1.0.11
libva-vdpau-driver 0.7.4-r2
libvdpau 0.9
X 1.16.4</pre>
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

--1426960018.6CB14.30431--

--===============0741231531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0741231531==--
