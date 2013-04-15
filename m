From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62914] ZaphodHeads doesn't work after upgrading to
	xorg 1.14
Date: Mon, 15 Apr 2013 07:19:34 +0000
Message-ID: <bug-62914-8800-GNLXu1Nokk@http.bugs.freedesktop.org/>
References: <bug-62914-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1669052017=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62914-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1669052017==
Content-Type: multipart/alternative; boundary="1366010374.4AeEF1.26619"; charset="us-ascii"


--1366010374.4AeEF1.26619
Date: Mon, 15 Apr 2013 07:19:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D62914

--- Comment #5 from Maxim P. Dementiev <max-sDaPYKTrDkuHXe+LvDLADg@public.gmane.org> ---
Unfortunately, I cannot use stand-alone drm module with my 3.7.10 kernel:

/var/tmp/portage/x11-base/nouveau-drm-20121015/work/master/drivers/gpu/drm/=
drm_gem.c:
In function =E2=80=98drm_gem_mmap=E2=80=99:
/var/tmp/portage/x11-base/nouveau-drm-20121015/work/master/drivers/gpu/drm/=
drm_gem.c:709:19:
error: =E2=80=98VM_RESERVED=E2=80=99 undeclared (first use in this function)
/var/tmp/portage/x11-base/nouveau-drm-20121015/work/master/drivers/gpu/drm/=
drm_gem.c:709:19:
note: each undeclared identifier is reported only once for each function it
appears in

New 3.8.7 kernel contains the same version of drm:

/usr/src/linux-3.7.10-gentoo/drivers/gpu/drm/nouveau/nouveau_drm.h:#define
DRIVER_DATE        "20120801"
/usr/src/linux-3.8.7-gentoo/drivers/gpu/drm/nouveau/nouveau_drm.h:#define
DRIVER_DATE        "20120801"

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1366010374.4AeEF1.26619
Date: Mon, 15 Apr 2013 07:19:34 +0000
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
   title=3D"NEW --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D62914#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D62914">bug 62914<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
max&#64;e-soft.ru" title=3D"Maxim P. Dementiev &lt;max&#64;e-soft.ru&gt;"> =
<span class=3D"fn">Maxim P. Dementiev</span></a>
</span></b>
        <pre>Unfortunately, I cannot use stand-alone drm module with my 3.7=
.10 kernel:

/var/tmp/portage/x11-base/nouveau-drm-20121015/work/master/drivers/gpu/drm/=
drm_gem.c:
In function =E2=80=98drm_gem_mmap=E2=80=99:
/var/tmp/portage/x11-base/nouveau-drm-20121015/work/master/drivers/gpu/drm/=
drm_gem.c:709:19:
error: =E2=80=98VM_RESERVED=E2=80=99 undeclared (first use in this function)
/var/tmp/portage/x11-base/nouveau-drm-20121015/work/master/drivers/gpu/drm/=
drm_gem.c:709:19:
note: each undeclared identifier is reported only once for each function it
appears in

New 3.8.7 kernel contains the same version of drm:

/usr/src/linux-3.7.10-gentoo/drivers/gpu/drm/nouveau/nouveau_drm.h:#define
DRIVER_DATE        &quot;20120801&quot;
/usr/src/linux-3.8.7-gentoo/drivers/gpu/drm/nouveau/nouveau_drm.h:#define
DRIVER_DATE        &quot;20120801&quot;</pre>
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

--1366010374.4AeEF1.26619--

--===============1669052017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1669052017==--
