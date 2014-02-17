From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70213] [git-v3.12-rc3 + nouveau HEAD] Vmalloc
 failure -> pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x50 returns -12
Date: Mon, 17 Feb 2014 05:31:38 +0000
Message-ID: <bug-70213-8800-xQENKGh3VY@http.bugs.freedesktop.org/>
References: <bug-70213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1961911241=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70213-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1961911241==
Content-Type: multipart/alternative; boundary="1392615098.BD172.2209"; charset="us-ascii"


--1392615098.BD172.2209
Date: Mon, 17 Feb 2014 05:31:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D70213

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #6)
> I tried this:
>=20
> nv84_fence_suspend(struct nouveau_drm *drm)
> {
> 	struct nouveau_fifo *pfifo =3D nouveau_fifo(drm->device);
> 	struct nv84_fence_priv *priv =3D drm->fence;
> 	int i;
>=20
> 	priv->suspend =3D vmalloc((pfifo->max + 1) * sizeof(u32));
> 	if (priv->suspend) {
> 		for (i =3D 0; i <=3D pfifo->max; i++)
> 			priv->suspend[i] =3D nouveau_bo_rd32(priv->bo, i*4);
> 	}
>=20
> 	/*return priv->suspend !=3D NULL;*/
> 	return false;
> }
>=20
> This did not work, the laptop suspended (which is actually good news since
> it started working for this hardware).

I find that very hard to believe. The suspend should have been aborted... W=
as
this on the NVD9? Or on your NV4E/whatever else you have? If it was on a
pre-nv84 card, there is no suspend function, and so that code path isn't hi=
t.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1392615098.BD172.2209
Date: Mon, 17 Feb 2014 05:31:38 +0000
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
   title=3D"NEW --- - [git-v3.12-rc3 + nouveau HEAD] Vmalloc failure -&gt; =
pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x50 returns -12"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70213#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [git-v3.12-rc3 + nouveau HEAD] Vmalloc failure -&gt; =
pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x50 returns -12"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70213">bug 70213<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D70213#c6">comment #6=
</a>)
<span class=3D"quote">&gt; I tried this:
&gt;=20
&gt; nv84_fence_suspend(struct nouveau_drm *drm)
&gt; {
&gt; 	struct nouveau_fifo *pfifo =3D nouveau_fifo(drm-&gt;device);
&gt; 	struct nv84_fence_priv *priv =3D drm-&gt;fence;
&gt; 	int i;
&gt;=20
&gt; 	priv-&gt;suspend =3D vmalloc((pfifo-&gt;max + 1) * sizeof(u32));
&gt; 	if (priv-&gt;suspend) {
&gt; 		for (i =3D 0; i &lt;=3D pfifo-&gt;max; i++)
&gt; 			priv-&gt;suspend[i] =3D nouveau_bo_rd32(priv-&gt;bo, i*4);
&gt; 	}
&gt;=20
&gt; 	/*return priv-&gt;suspend !=3D NULL;*/
&gt; 	return false;
&gt; }
&gt;=20
&gt; This did not work, the laptop suspended (which is actually good news s=
ince
&gt; it started working for this hardware).</span >

I find that very hard to believe. The suspend should have been aborted... W=
as
this on the NVD9? Or on your NV4E/whatever else you have? If it was on a
pre-nv84 card, there is no suspend function, and so that code path isn't hi=
t.</pre>
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

--1392615098.BD172.2209--

--===============1961911241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1961911241==--
