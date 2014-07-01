From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80738] New: Possible wrong variable used in
 nouveau_allocate_surface
Date: Tue, 01 Jul 2014 02:27:04 +0000
Message-ID: <bug-80738-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1645276858=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1645276858==
Content-Type: multipart/alternative; boundary="1404181624.e1bD1.13067"; charset="us-ascii"


--1404181624.e1bD1.13067
Date: Tue, 1 Jul 2014 02:27:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D80738

          Priority: medium
            Bug ID: 80738
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Possible wrong variable used in
                    nouveau_allocate_surface
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: pstglia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Hi,

I was analyzing xf86 video nouveau code and found a possible bug on
nouveau_allocate_surface (nv_accel_common.c src file)


When setting tile_mode for NV_FERMI/NVC0 or higher families, it uses tile_m=
ode
to calculate height. However, instead of using "cfg.nvc0.tile_mode" it is u=
sing
"cfg.nv50.tile_mode". See bellow:


                if (pNv->Architecture >=3D NV_FERMI) {
                        if      (height > 64) cfg.nvc0.tile_mode =3D 0x040;
                        else if (height > 32) cfg.nvc0.tile_mode =3D 0x030;
                        else if (height > 16) cfg.nvc0.tile_mode =3D 0x020;
                        else if (height >  8) cfg.nvc0.tile_mode =3D 0x010;
                        else                  cfg.nvc0.tile_mode =3D 0x000;

                        if (usage_hint & NOUVEAU_CREATE_PIXMAP_ZETA)
                                cfg.nvc0.memtype =3D (bpp =3D=3D 16) ? 0x01=
 : 0x11;
                        else
                                cfg.nvc0.memtype =3D 0xfe;

                        height =3D NOUVEAU_ALIGN(height,
                                 NVC0_TILE_HEIGHT(cfg.nv50.tile_mode));


If this is intentional, please mark this bug as Invalid and sorry for
disturbing.

Regards,
Paulo S=C3=A9rgio Travaglia

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1404181624.e1bD1.13067
Date: Tue, 1 Jul 2014 02:27:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Possible wrong variable used in nouveau_allocate_surf=
ace"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80738">80738</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Possible wrong variable used in nouveau_allocate_surface
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>pstglia&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi,

I was analyzing xf86 video nouveau code and found a possible bug on
nouveau_allocate_surface (nv_accel_common.c src file)


When setting tile_mode for NV_FERMI/NVC0 or higher families, it uses tile_m=
ode
to calculate height. However, instead of using &quot;cfg.nvc0.tile_mode&quo=
t; it is using
&quot;cfg.nv50.tile_mode&quot;. See bellow:


                if (pNv-&gt;Architecture &gt;=3D NV_FERMI) {
                        if      (height &gt; 64) cfg.nvc0.tile_mode =3D 0x0=
40;
                        else if (height &gt; 32) cfg.nvc0.tile_mode =3D 0x0=
30;
                        else if (height &gt; 16) cfg.nvc0.tile_mode =3D 0x0=
20;
                        else if (height &gt;  8) cfg.nvc0.tile_mode =3D 0x0=
10;
                        else                  cfg.nvc0.tile_mode =3D 0x000;

                        if (usage_hint &amp; NOUVEAU_CREATE_PIXMAP_ZETA)
                                cfg.nvc0.memtype =3D (bpp =3D=3D 16) ? 0x01=
 : 0x11;
                        else
                                cfg.nvc0.memtype =3D 0xfe;

                        height =3D NOUVEAU_ALIGN(height,
                                 NVC0_TILE_HEIGHT(cfg.nv50.tile_mode));


If this is intentional, please mark this bug as Invalid and sorry for
disturbing.

Regards,
Paulo S=C3=A9rgio Travaglia</pre>
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

--1404181624.e1bD1.13067--

--===============1645276858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1645276858==--
