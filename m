From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81485] [NVE4] dmesg spam on startup
Date: Fri, 22 Aug 2014 01:32:26 +0000
Message-ID: <bug-81485-8800-SD8QaoMEp6@http.bugs.freedesktop.org/>
References: <bug-81485-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0239877758=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81485-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0239877758==
Content-Type: multipart/alternative; boundary="1408671146.E48BB12.23568"; charset="us-ascii"


--1408671146.E48BB12.23568
Date: Fri, 22 Aug 2014 01:32:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D81485

--- Comment #12 from Konstantin Svist <fry.kun-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
got compilation error...

/home/kostya/projects/nouveau/darktama/drm/nouveau_drm.c: In function
=E2=80=98nouveau_platform_device_create_=E2=80=99:
/home/kostya/projects/nouveau/darktama/drm/nouveau_drm.c:1087:2: error:
implicit declaration of function =E2=80=98drm_dev_set_unique=E2=80=99
[-Werror=3Dimplicit-function-declaration]
  err =3D drm_dev_set_unique(drm, "%s", dev_name(&pdev->dev));
  ^
cc1: some warnings being treated as errors
make[2]: *** [/home/kostya/projects/nouveau/darktama/drm/nouveau_drm.o] Err=
or 1

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1408671146.E48BB12.23568
Date: Fri, 22 Aug 2014 01:32:26 +0000
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
   title=3D"NEW --- - [NVE4] dmesg spam on startup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D81485#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE4] dmesg spam on startup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D81485">bug 81485<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fry.kun&#64;gmail.com" title=3D"Konstantin Svist &lt;fry.kun&#64;gmail.com&=
gt;"> <span class=3D"fn">Konstantin Svist</span></a>
</span></b>
        <pre>got compilation error...

/home/kostya/projects/nouveau/darktama/drm/nouveau_drm.c: In function
=E2=80=98nouveau_platform_device_create_=E2=80=99:
/home/kostya/projects/nouveau/darktama/drm/nouveau_drm.c:1087:2: error:
implicit declaration of function =E2=80=98drm_dev_set_unique=E2=80=99
[-Werror=3Dimplicit-function-declaration]
  err =3D drm_dev_set_unique(drm, &quot;%s&quot;, dev_name(&amp;pdev-&gt;de=
v));
  ^
cc1: some warnings being treated as errors
make[2]: *** [/home/kostya/projects/nouveau/darktama/drm/nouveau_drm.o] Err=
or 1</pre>
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

--1408671146.E48BB12.23568--

--===============0239877758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0239877758==--
