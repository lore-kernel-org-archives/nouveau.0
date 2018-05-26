From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106657] nouveau driver causes black graphic issues
 on gnome apps
Date: Sat, 26 May 2018 22:39:36 +0000
Message-ID: <bug-106657-8800-rYzvKw5zrQ@http.bugs.freedesktop.org/>
References: <bug-106657-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1408899029=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-106657-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1408899029==
Content-Type: multipart/alternative; boundary="15273743760.35F8B929.29124"
Content-Transfer-Encoding: 7bit


--15273743760.35F8B929.29124
Date: Sat, 26 May 2018 22:39:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106657

--- Comment #7 from Geroge T <reportbug-gQOQsHldK/Xzs492ZWNkEA@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #5)
> What GPU is this?
>=20
> Check your xorg log. Are you using nouveau or modeset? If the latter, ple=
ase
> use nouveau.

Do you mean this:

[    18.750] (=3D=3D) Matched modesetting as autoconfigured driver 2
[    18.750] (II) LoadModule: "modesetting"
[    18.750] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[    18.750] (II) Module modesetting: vendor=3D"X.Org Foundation"
[    18.750] (=3D=3D) Matched modesetting as autoconfigured driver 2
[    18.751] (II) LoadModule: "modesetting"
[    18.751] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[    18.751] (II) Module modesetting: vendor=3D"X.Org Foundation"
[    18.751] (II) UnloadModule: "modesetting"
[    18.751] (II) Unloading modesetting
[    18.751] (II) Failed to load module "modesetting" (already loaded, 0)
[    18.751] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[    18.751] (II) modeset(0): using drv /dev/dri/card0
[    18.751] (II) modeset(0): Creating default Display subsection in Screen
section


lspci:
01:00.0 VGA compatible controller: NVIDIA Corporation GP104M [GeForce GTX 1=
080
Mobile] (rev a1)
        Subsystem: Micro-Star International Co., Ltd. [MSI] GP104M [GeForce=
 GTX
1080 Mobile]
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15273743760.35F8B929.29124
Date: Sat, 26 May 2018 22:39:36 +0000
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
   title=3D"NEW - nouveau driver causes black graphic issues on gnome apps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106657#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau driver causes black graphic issues on gnome apps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106657">bug 10665=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reportbug&#64;mailna.biz" title=3D"Geroge T &lt;reportbug&#64;mailna.biz&gt=
;"> <span class=3D"fn">Geroge T</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D106=
657#c5">comment #5</a>)
<span class=3D"quote">&gt; What GPU is this?
&gt;=20
&gt; Check your xorg log. Are you using nouveau or modeset? If the latter, =
please
&gt; use nouveau.</span >

Do you mean this:

[    18.750] (=3D=3D) Matched modesetting as autoconfigured driver 2
[    18.750] (II) LoadModule: &quot;modesetting&quot;
[    18.750] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[    18.750] (II) Module modesetting: vendor=3D&quot;X.Org Foundation&quot;
[    18.750] (=3D=3D) Matched modesetting as autoconfigured driver 2
[    18.751] (II) LoadModule: &quot;modesetting&quot;
[    18.751] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[    18.751] (II) Module modesetting: vendor=3D&quot;X.Org Foundation&quot;
[    18.751] (II) UnloadModule: &quot;modesetting&quot;
[    18.751] (II) Unloading modesetting
[    18.751] (II) Failed to load module &quot;modesetting&quot; (already lo=
aded, 0)
[    18.751] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[    18.751] (II) modeset(0): using drv /dev/dri/card0
[    18.751] (II) modeset(0): Creating default Display subsection in Screen
section


lspci:
01:00.0 VGA compatible controller: NVIDIA Corporation GP104M [GeForce GTX 1=
080
Mobile] (rev a1)
        Subsystem: Micro-Star International Co., Ltd. [MSI] GP104M [GeForce=
 GTX
1080 Mobile]
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15273743760.35F8B929.29124--

--===============1408899029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1408899029==--
