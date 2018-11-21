From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108615] [NVE7] changing resolution causes blank
 screen
Date: Wed, 21 Nov 2018 19:08:42 +0000
Message-ID: <bug-108615-8800-2ZvNTVBALH@http.bugs.freedesktop.org/>
References: <bug-108615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1200459236=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1200459236==
Content-Type: multipart/alternative; boundary="15428273221.4cB4e8.30381"
Content-Transfer-Encoding: 7bit


--15428273221.4cB4e8.30381
Date: Wed, 21 Nov 2018 19:08:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108615

--- Comment #3 from Phil Turmel <philip-xiX+HWoRdKcdnm+yROfE0A@public.gmane.org> ---
I have what is likely a related problem -- any change to resolution or
re-enabling an output on my system, via xrandr or the equivalent KDE dialog,
yields a black screen and/or artifacts from the framebuffer console.  When
multiple monitors are enabled, the affected outputs are black until the mou=
se
pointer moves in their region, yielding artifacts plus *correct* mouse poin=
ter.

Until recently, operation was restored solely by restarting X.  With kernel
4.19.3, operation can be restored by switching to a text console (all conne=
cted
outputs turn on) and switching back to X.  The phenomenon occurs on all mon=
itor
ports, on the dock or not, whether docked or not, and both before and after
suspend/resume.

Laptop is an HP ZBook 17 with GK107GLM (K1100M) with gentoo unstable:

Linux corvus 4.19.3 #305 SMP PREEMPT Wed Nov 21 12:21:12 EST 2018 x86_64
Intel(R) Core(TM) i7-4800MQ CPU @ 2.70GHz GenuineIntel GNU/Linux

x11-base/xorg-server-1.20.3
x11-drivers/xf86-video-nouveau-1.0.15-r1
media-libs/mesa-18.3.0_rc3
x11-libs/libdrm-2.4.96

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15428273221.4cB4e8.30381
Date: Wed, 21 Nov 2018 19:08:42 +0000
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
   title=3D"NEW - [NVE7] changing resolution causes blank screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108615#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] changing resolution causes blank screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108615">bug 10861=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
philip&#64;turmel.org" title=3D"Phil Turmel &lt;philip&#64;turmel.org&gt;">=
 <span class=3D"fn">Phil Turmel</span></a>
</span></b>
        <pre>I have what is likely a related problem -- any change to resol=
ution or
re-enabling an output on my system, via xrandr or the equivalent KDE dialog,
yields a black screen and/or artifacts from the framebuffer console.  When
multiple monitors are enabled, the affected outputs are black until the mou=
se
pointer moves in their region, yielding artifacts plus *correct* mouse poin=
ter.

Until recently, operation was restored solely by restarting X.  With kernel
4.19.3, operation can be restored by switching to a text console (all conne=
cted
outputs turn on) and switching back to X.  The phenomenon occurs on all mon=
itor
ports, on the dock or not, whether docked or not, and both before and after
suspend/resume.

Laptop is an HP ZBook 17 with GK107GLM (K1100M) with gentoo unstable:

Linux corvus 4.19.3 #305 SMP PREEMPT Wed Nov 21 12:21:12 EST 2018 x86_64
Intel(R) Core(TM) i7-4800MQ CPU &#64; 2.70GHz GenuineIntel GNU/Linux

x11-base/xorg-server-1.20.3
x11-drivers/xf86-video-nouveau-1.0.15-r1
media-libs/mesa-18.3.0_rc3
x11-libs/libdrm-2.4.96</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15428273221.4cB4e8.30381--

--===============1200459236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1200459236==--
