From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58984] DRM NOUVEAU: probe of 0001:01:00.0 failed
	with error -12
Date: Wed, 13 Mar 2013 23:46:18 +0000
Message-ID: <bug-58984-8800-PvILnOGyHU@http.bugs.freedesktop.org/>
References: <bug-58984-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1850957537=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58984-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1850957537==
Content-Type: multipart/alternative; boundary="1363218378.1FddF2.3463"; charset="us-ascii"


--1363218378.1FddF2.3463
Date: Wed, 13 Mar 2013 23:46:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D58984

--- Comment #16 from Marcin Ko=C5=9Bcielnicki <koriakin-mP9o5jsk0RY@public.gmane.org> ---
(In reply to comment #15)

> Which makes sense / is the right route? A private PAGE_SHIFT|MASK|SIZE for
> GPUs or using the system page size consistently? Are all NV GPUs that
> support paging using 4K pages? (I say "support paging" because I had an N=
V17
> GPU that worked fine on SPARC, OpenGL games worked and all).
>=20

All nvidia GPUs all the way back to NV01 support 4kB pages (with NV50-gen o=
nes
also supporting 16kB + 64kB and NVC0-gen also supporting 128kB, but these s=
izes
are usually only used for VRAM and not system RAM).

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1363218378.1FddF2.3463
Date: Wed, 13 Mar 2013 23:46:18 +0000
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
   title=3D"NEW --- - DRM NOUVEAU: probe of 0001:01:00.0 failed with error =
-12"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D58984#c16">Commen=
t # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - DRM NOUVEAU: probe of 0001:01:00.0 failed with error =
-12"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D58984">bug 58984<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
koriakin&#64;0x04.net" title=3D"Marcin Ko=C5=9Bcielnicki &lt;koriakin&#64;0=
x04.net&gt;"> <span class=3D"fn">Marcin Ko=C5=9Bcielnicki</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D58984#c15">comment #=
15</a>)

<span class=3D"quote">&gt; Which makes sense / is the right route? A privat=
e PAGE_SHIFT|MASK|SIZE for
&gt; GPUs or using the system page size consistently? Are all NV GPUs that
&gt; support paging using 4K pages? (I say &quot;support paging&quot; becau=
se I had an NV17
&gt; GPU that worked fine on SPARC, OpenGL games worked and all).
&gt; </span >

All nvidia GPUs all the way back to NV01 support 4kB pages (with NV50-gen o=
nes
also supporting 16kB + 64kB and NVC0-gen also supporting 128kB, but these s=
izes
are usually only used for VRAM and not system RAM).</pre>
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

--1363218378.1FddF2.3463--

--===============1850957537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1850957537==--
