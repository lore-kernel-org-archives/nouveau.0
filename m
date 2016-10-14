From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98240] Kernel module fails to load on HP Pavilion
 V3A33AV laptop.
Date: Fri, 14 Oct 2016 02:26:16 +0000
Message-ID: <bug-98240-8800-ga8PcOaxPE@http.bugs.freedesktop.org/>
References: <bug-98240-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0983802082=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98240-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0983802082==
Content-Type: multipart/alternative; boundary="14764119760.D188aAd.28133";
 charset="UTF-8"


--14764119760.D188aAd.28133
Date: Fri, 14 Oct 2016 02:26:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98240

--- Comment #5 from Sergey Okhapkin <sos-iE5g+WOE291eeLb3ft/vUmD2FQJk+8+b@public.gmane.org> ---
Xorg driver (xf86-video-nouveau-1.0.12) fails:

[  1596.906] (II) NOUVEAU driver
[  1596.906] (II) NOUVEAU driver for NVIDIA chipset families :
[  1596.906]    RIVA TNT        (NV04)
[  1596.906]    RIVA TNT2       (NV05)
[  1596.906]    GeForce 256     (NV10)
[  1596.906]    GeForce 2       (NV11, NV15)
[  1596.906]    GeForce 4MX     (NV17, NV18)
[  1596.906]    GeForce 3       (NV20)
[  1596.906]    GeForce 4Ti     (NV25, NV28)
[  1596.906]    GeForce FX      (NV3x)
[  1596.906]    GeForce 6       (NV4x)
[  1596.906]    GeForce 7       (G7x)
[  1596.906]    GeForce 8       (G8x)
[  1596.906]    GeForce GTX 200 (NVA0)
[  1596.906]    GeForce GTX 400 (NVC0)
[  1596.906] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[  1596.906] (++) using VT number 7

[  1596.907] (II) intel(0): Using Kernel Mode Setting driver: i915, version
1.6.0 20160711
[  1596.907] (II) [drm] nouveau interface version: 1.3.1
[  1596.907] (EE) Unknown chipset: NV117

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14764119760.D188aAd.28133
Date: Fri, 14 Oct 2016 02:26:16 +0000
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
   title=3D"NEW - Kernel module fails to load on HP Pavilion V3A33AV laptop=
."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98240#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel module fails to load on HP Pavilion V3A33AV laptop=
."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98240">bug 98240<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sos&#64;sokhapkin.dyndns.org" title=3D"Sergey Okhapkin &lt;sos&#64;sokhapki=
n.dyndns.org&gt;"> <span class=3D"fn">Sergey Okhapkin</span></a>
</span></b>
        <pre>Xorg driver (xf86-video-nouveau-1.0.12) fails:

[  1596.906] (II) NOUVEAU driver
[  1596.906] (II) NOUVEAU driver for NVIDIA chipset families :
[  1596.906]    RIVA TNT        (NV04)
[  1596.906]    RIVA TNT2       (NV05)
[  1596.906]    GeForce 256     (NV10)
[  1596.906]    GeForce 2       (NV11, NV15)
[  1596.906]    GeForce 4MX     (NV17, NV18)
[  1596.906]    GeForce 3       (NV20)
[  1596.906]    GeForce 4Ti     (NV25, NV28)
[  1596.906]    GeForce FX      (NV3x)
[  1596.906]    GeForce 6       (NV4x)
[  1596.906]    GeForce 7       (G7x)
[  1596.906]    GeForce 8       (G8x)
[  1596.906]    GeForce GTX 200 (NVA0)
[  1596.906]    GeForce GTX 400 (NVC0)
[  1596.906] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[  1596.906] (++) using VT number 7

[  1596.907] (II) intel(0): Using Kernel Mode Setting driver: i915, version
1.6.0 20160711
[  1596.907] (II) [drm] nouveau interface version: 1.3.1
[  1596.907] (EE) Unknown chipset: NV117</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14764119760.D188aAd.28133--

--===============0983802082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0983802082==--
