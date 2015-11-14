From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92307] G98/GM206: WARNING: ... at
 include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90
 [drm_kms_helper]()
Date: Sat, 14 Nov 2015 19:17:43 +0000
Message-ID: <bug-92307-8800-pCNipfzTmg@http.bugs.freedesktop.org/>
References: <bug-92307-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0688542652=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92307-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0688542652==
Content-Type: multipart/alternative; boundary="1447528663.A47E1.16976"; charset="UTF-8"


--1447528663.A47E1.16976
Date: Sat, 14 Nov 2015 19:17:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D92307

--- Comment #12 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to poma from comment #8)
> (In reply to poma from comment #7)
> > FTR procedure:
> >=20
> > $ uname -r
> > 4.3.0-0.rc6.git2.1.fc24.x86_64
> >=20
> > $ git clone git://people.freedesktop.org/~darktama/nouveau
> > $ cd nouveau/drm/
> > $ make
> > $ su
> >=20
> > # cp nouveau/nouveau.ko /usr/lib/modules/$(uname -r)/updates/
> > # depmod
> > # dracut --kver $(uname -r) -f
> > # systemctl reboot
>=20
>=20
> Update to commit f787ef9
>=20
> nouveau/drm/nouveau/nouveau_drm.c:935:24: error: =E2=80=98drm_vblank_no_h=
w_counter=E2=80=99
> undeclared here (not in a function)
>   .get_vblank_counter =3D drm_vblank_no_hw_counter,
>                         ^

It was the current compilation breakage within ~darktama/nouveau, not relat=
ed
to the actual bug.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1447528663.A47E1.16976
Date: Sat, 14 Nov 2015 19:17:43 +0000
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
   title=3D"NEW - G98/GM206: WARNING: ... at include/drm/drm_crtc.h:1577 dr=
m_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92307#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - G98/GM206: WARNING: ... at include/drm/drm_crtc.h:1577 dr=
m_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92307">bug 92307<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pomidorabelisima&#64;gmail.com" title=3D"poma &lt;pomidorabelisima&#64;gmai=
l.com&gt;"> <span class=3D"fn">poma</span></a>
</span></b>
        <pre>(In reply to poma from <a href=3D"show_bug.cgi?id=3D92307#c8">=
comment #8</a>)
<span class=3D"quote">&gt; (In reply to poma from <a href=3D"show_bug.cgi?i=
d=3D92307#c7">comment #7</a>)
&gt; &gt; FTR procedure:
&gt; &gt;=20
&gt; &gt; $ uname -r
&gt; &gt; 4.3.0-0.rc6.git2.1.fc24.x86_64
&gt; &gt;=20
&gt; &gt; $ git clone git://people.freedesktop.org/~darktama/nouveau
&gt; &gt; $ cd nouveau/drm/
&gt; &gt; $ make
&gt; &gt; $ su
&gt; &gt;=20
&gt; &gt; # cp nouveau/nouveau.ko /usr/lib/modules/$(uname -r)/updates/
&gt; &gt; # depmod
&gt; &gt; # dracut --kver $(uname -r) -f
&gt; &gt; # systemctl reboot
&gt;=20
&gt;=20
&gt; Update to commit f787ef9
&gt;=20
&gt; nouveau/drm/nouveau/nouveau_drm.c:935:24: error: =E2=80=98drm_vblank_n=
o_hw_counter=E2=80=99
&gt; undeclared here (not in a function)
&gt;   .get_vblank_counter =3D drm_vblank_no_hw_counter,
&gt;                         ^</span >

It was the current compilation breakage within ~darktama/nouveau, not relat=
ed
to the actual bug.</pre>
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

--1447528663.A47E1.16976--

--===============0688542652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0688542652==--
