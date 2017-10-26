From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103467] [NVC0/GF108] fifo: read fault at cd90f4d000
 engine 07 [PFIFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on
 channel 1 [003fe11000 DRM]
Date: Thu, 26 Oct 2017 16:23:59 +0000
Message-ID: <bug-103467-8800-k5amRk09xA@http.bugs.freedesktop.org/>
References: <bug-103467-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1028203401=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103467-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1028203401==
Content-Type: multipart/alternative; boundary="15090350390.c4338247.13960";
 charset="UTF-8"


--15090350390.c4338247.13960
Date: Thu, 26 Oct 2017 16:23:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103467

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to erhard_f from comment #8)
> Sorry, but that's the best I can do at the moment... When booting up the
> console gets flooded with debug messages, logging in is only possible
> afterwards. The dmesg > kernel_debug-log.txt I create at that time does n=
ot
> show the boot process from the beginning but only repeats:
> [   18.488344] nouveau: DRM:00000000:00000000: ioctl: size 48
> [   18.488346] nouveau: DRM:00000000:00000000: ioctl: vers 0 type 04 obje=
ct
> c000000459bba070 owner ff
> [   18.488347] nouveau: DRM:00000000:00000080: ioctl: mthd size 24
> [   18.488348] nouveau: DRM:00000000:00000080: ioctl: mthd vers 0 mthd 01
> [   18.488350] nouveau: DRM:00000000:00000080: ioctl: device mthd 00000001
> [   18.488351] nouveau: DRM:00000000:00000080: ioctl: device time size 16
> [   18.488352] nouveau: DRM:00000000:00000080: ioctl: device time vers 0
> [   18.488356] nouveau: DRM:00000000:00000000: ioctl: return 0
>=20
> even if the log buffer ist set to 4M. As an alternative I can only offer =
the
> ouput of systemd's journalctl -k.

OK, let's try it with nouveau.debug=3Ddebug -- that should generate conside=
rably
less junk.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15090350390.c4338247.13960
Date: Thu, 26 Oct 2017 16:23:59 +0000
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
   title=3D"NEW - [NVC0/GF108] fifo: read fault at cd90f4d000 engine 07 [PF=
IFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel 1 [003fe110=
00 DRM]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103467#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC0/GF108] fifo: read fault at cd90f4d000 engine 07 [PF=
IFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel 1 [003fe110=
00 DRM]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103467">bug 10346=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to erhard_f from <a href=3D"show_bug.cgi?id=3D103467=
#c8">comment #8</a>)
<span class=3D"quote">&gt; Sorry, but that's the best I can do at the momen=
t... When booting up the
&gt; console gets flooded with debug messages, logging in is only possible
&gt; afterwards. The dmesg &gt; kernel_debug-log.txt I create at that time =
does not
&gt; show the boot process from the beginning but only repeats:
&gt; [   18.488344] nouveau: DRM:00000000:00000000: ioctl: size 48
&gt; [   18.488346] nouveau: DRM:00000000:00000000: ioctl: vers 0 type 04 o=
bject
&gt; c000000459bba070 owner ff
&gt; [   18.488347] nouveau: DRM:00000000:00000080: ioctl: mthd size 24
&gt; [   18.488348] nouveau: DRM:00000000:00000080: ioctl: mthd vers 0 mthd=
 01
&gt; [   18.488350] nouveau: DRM:00000000:00000080: ioctl: device mthd 0000=
0001
&gt; [   18.488351] nouveau: DRM:00000000:00000080: ioctl: device time size=
 16
&gt; [   18.488352] nouveau: DRM:00000000:00000080: ioctl: device time vers=
 0
&gt; [   18.488356] nouveau: DRM:00000000:00000000: ioctl: return 0
&gt;=20
&gt; even if the log buffer ist set to 4M. As an alternative I can only off=
er the
&gt; ouput of systemd's journalctl -k.</span >

OK, let's try it with nouveau.debug=3Ddebug -- that should generate conside=
rably
less junk.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15090350390.c4338247.13960--

--===============1028203401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1028203401==--
