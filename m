From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78116] Auto fan speed management doesn't do anything
 in non critical temperature range (NVC0)
Date: Sun, 25 May 2014 21:36:09 +0000
Message-ID: <bug-78116-8800-qZ5P3LVXUh@http.bugs.freedesktop.org/>
References: <bug-78116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1250806475=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1250806475==
Content-Type: multipart/alternative; boundary="1401053769.EF6F5e41.19468"; charset="us-ascii"


--1401053769.EF6F5e41.19468
Date: Sun, 25 May 2014 21:36:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D78116

--- Comment #20 from Marcel Dopita <mdop-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> ---
(In reply to comment #19)
> Hmm, seems like the problem is not where I thought it was. Let's see what=
's
> the output with this patch applied!

I cannot compile because of following error:

In file included from drivers/gpu/drm/nouveau/core/include/core/object.h:5:=
0,
                 from drivers/gpu/drm/nouveau/core/subdev/therm/base.c:25:
drivers/gpu/drm/nouveau/core/subdev/therm/base.c: In function
=E2=80=98nouveau_therm_update=E2=80=99:
drivers/gpu/drm/nouveau/core/subdev/therm/base.c:136:25: error: =E2=80=98st=
ruct
nvbios_therm_fan=E2=80=99 has no member named =E2=80=98fan_mode=E2=80=99
    duty, priv->fan->bios.fan_mode);
                         ^
drivers/gpu/drm/nouveau/core/include/core/printk.h:14:45: note: in definiti=
on
of macro =E2=80=98nv_printk=E2=80=99
   nv_printk_(nv_object(o), NV_DBG_##l, f, ##a);                  \
                                             ^
drivers/gpu/drm/nouveau/core/subdev/therm/base.c:132:2: note: in expansion =
of
macro =E2=80=98nv_debug=E2=80=99
  nv_debug(therm, "nouveau_therm_update; mode =3D %d, poll =3D %d, "
  ^
  CC [M]  drivers/infiniband/ulp/ipoib/ipoib_cm.o
  CC [M]  drivers/infiniband/hw/qib/qib_ud.o
scripts/Makefile.build:308: recipe for target
'drivers/gpu/drm/nouveau/core/subdev/therm/base.o' failed
make[4]: *** [drivers/gpu/drm/nouveau/core/subdev/therm/base.o] Error 1
scripts/Makefile.build:455: recipe for target 'drivers/gpu/drm/nouveau' fai=
led
make[3]: *** [drivers/gpu/drm/nouveau] Error 2
scripts/Makefile.build:455: recipe for target 'drivers/gpu/drm' failed
make[2]: *** [drivers/gpu/drm] Error 2
scripts/Makefile.build:455: recipe for target 'drivers/gpu' failed
make[1]: *** [drivers/gpu] Error 2

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1401053769.EF6F5e41.19468
Date: Sun, 25 May 2014 21:36:09 +0000
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
          bz_status_NEW "
   title=3D"NEW --- - Auto fan speed management doesn't do anything in non =
critical temperature range (NVC0)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78116#c20">Commen=
t # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Auto fan speed management doesn't do anything in non =
critical temperature range (NVC0)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78116">bug 78116<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mdop&#64;seznam.cz" title=3D"Marcel Dopita &lt;mdop&#64;seznam.cz&gt;"> <sp=
an class=3D"fn">Marcel Dopita</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D78116#c19">comment #=
19</a>)
<span class=3D"quote">&gt; Hmm, seems like the problem is not where I thoug=
ht it was. Let's see what's
&gt; the output with this patch applied!</span >

I cannot compile because of following error:

In file included from drivers/gpu/drm/nouveau/core/include/core/object.h:5:=
0,
                 from drivers/gpu/drm/nouveau/core/subdev/therm/base.c:25:
drivers/gpu/drm/nouveau/core/subdev/therm/base.c: In function
=E2=80=98nouveau_therm_update=E2=80=99:
drivers/gpu/drm/nouveau/core/subdev/therm/base.c:136:25: error: =E2=80=98st=
ruct
nvbios_therm_fan=E2=80=99 has no member named =E2=80=98fan_mode=E2=80=99
    duty, priv-&gt;fan-&gt;bios.fan_mode);
                         ^
drivers/gpu/drm/nouveau/core/include/core/printk.h:14:45: note: in definiti=
on
of macro =E2=80=98nv_printk=E2=80=99
   nv_printk_(nv_object(o), NV_DBG_##l, f, ##a);                  \
                                             ^
drivers/gpu/drm/nouveau/core/subdev/therm/base.c:132:2: note: in expansion =
of
macro =E2=80=98nv_debug=E2=80=99
  nv_debug(therm, &quot;nouveau_therm_update; mode =3D %d, poll =3D %d, &qu=
ot;
  ^
  CC [M]  drivers/infiniband/ulp/ipoib/ipoib_cm.o
  CC [M]  drivers/infiniband/hw/qib/qib_ud.o
scripts/Makefile.build:308: recipe for target
'drivers/gpu/drm/nouveau/core/subdev/therm/base.o' failed
make[4]: *** [drivers/gpu/drm/nouveau/core/subdev/therm/base.o] Error 1
scripts/Makefile.build:455: recipe for target 'drivers/gpu/drm/nouveau' fai=
led
make[3]: *** [drivers/gpu/drm/nouveau] Error 2
scripts/Makefile.build:455: recipe for target 'drivers/gpu/drm' failed
make[2]: *** [drivers/gpu/drm] Error 2
scripts/Makefile.build:455: recipe for target 'drivers/gpu' failed
make[1]: *** [drivers/gpu] Error 2</pre>
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

--1401053769.EF6F5e41.19468--

--===============1250806475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1250806475==--
