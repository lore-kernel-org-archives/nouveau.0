From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93828] Xorg hangs randomly with nouveau driver
Date: Wed, 24 Aug 2016 13:01:54 +0000
Message-ID: <bug-93828-8800-NI2nsMnv3D@http.bugs.freedesktop.org/>
References: <bug-93828-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0028083778=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93828-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0028083778==
Content-Type: multipart/alternative; boundary="14720437142.dB6eC4.390";
 charset="UTF-8"


--14720437142.dB6eC4.390
Date: Wed, 24 Aug 2016 13:01:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93828

--- Comment #4 from joni-rk22IFkJM19Wk0Htik3J/w@public.gmane.org ---
I think I faced this exactly same crash today on Slackware 14.2 x86 system.

Chromium was loading some page while whole X freezes. i was able to SSH in =
to
the system but only restart really fixed the system.

OS info :
Slackware 14.2

kernel : 4.4.14 #2 SMP Fri Jun 24 13:38:27 CDT 2016 x86_64 Intel(R) Core(TM=
)2
Quad CPU    Q6600  @ 2.40GHz GenuineIntel GNU/Linux

GPU: 01:00.0 VGA compatible controller: NVIDIA Corporation G84GL [Quadro FX
370] (rev a1)

Packet / library info & versions
kernel-huge-4.4.14-x86_64-1
mesa-11.2.2-x86_64-1
xf86-video-nouveau-1.0.12-x86_64-1
xorg-server-1.18.3-x86_64-2

I attach some xorg log and kernel log

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14720437142.dB6eC4.390
Date: Wed, 24 Aug 2016 13:01:54 +0000
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
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828">bug 93828<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
joni&#64;shade-fx.com" title=3D"joni&#64;shade-fx.com">joni&#64;shade-fx.co=
m</a>
</span></b>
        <pre>I think I faced this exactly same crash today on Slackware 14.=
2 x86 system.

Chromium was loading some page while whole X freezes. i was able to SSH in =
to
the system but only restart really fixed the system.

OS info :
Slackware 14.2

kernel : 4.4.14 #2 SMP Fri Jun 24 13:38:27 CDT 2016 x86_64 Intel(R) Core(TM=
)2
Quad CPU    Q6600  &#64; 2.40GHz GenuineIntel GNU/Linux

GPU: 01:00.0 VGA compatible controller: NVIDIA Corporation G84GL [Quadro FX
370] (rev a1)

Packet / library info &amp; versions
kernel-huge-4.4.14-x86_64-1
mesa-11.2.2-x86_64-1
xf86-video-nouveau-1.0.12-x86_64-1
xorg-server-1.18.3-x86_64-2

I attach some xorg log and kernel log</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14720437142.dB6eC4.390--

--===============0028083778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0028083778==--
