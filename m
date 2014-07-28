From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54437] [NVC8] linux-nouveau2.6 (3.6.0-rc4) : GTX580
 : Xorg freezes when using accel
Date: Mon, 28 Jul 2014 18:36:53 +0000
Message-ID: <bug-54437-8800-R7IUopHwJ9@http.bugs.freedesktop.org/>
References: <bug-54437-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1454232372=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54437-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1454232372==
Content-Type: multipart/alternative; boundary="1406572613.a26A2fAD4.21217"; charset="us-ascii"


--1406572613.a26A2fAD4.21217
Date: Mon, 28 Jul 2014 18:36:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D54437

--- Comment #16 from Kelly Doran <kel.p.doran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #13)
> (In reply to comment #12)
> > This bug is affecting me also, see the last duplicated bug. Any progres=
s in
> > fixing this? Maybe some help in testing (for ex.) required?
>=20
> It's a bit of a mystery unfortunately. Adding to the annoyance, Ben said
> that it does work just fine on his NVC8, although he has the less powerful
> versions. Could be something with high ROP/TPC/GPC counts not being handl=
ed.
> (Or multiple PARTs?)
>=20
> That might actually be an interesting experiment -- before loading nouvea=
u,
> mask out a bunch of the units and see if it helps. If it does, find the
> "breaking" point.
>=20
> This is the code that computes that stuff:
>=20
> http://cgit.freedesktop.org/~darktama/nouveau/tree/nvkm/engine/graph/nvc0.
> c#n1330
>=20
> 	priv->rop_nr =3D (nv_rd32(priv, 0x409604) & 0x001f0000) >> 16;
> 	priv->gpc_nr =3D  nv_rd32(priv, 0x409604) & 0x0000001f;
> 	for (i =3D 0; i < priv->gpc_nr; i++) {
> 		priv->tpc_nr[i]  =3D nv_rd32(priv, GPC_UNIT(i, 0x2608));
> 		priv->tpc_total +=3D priv->tpc_nr[i];
> 	}
>=20
> Step 1: Print out the various values (i.e. number of ROPs, GPCs, and the
> per-GPC TPC counts).
> Step 2: Artificially lower them (to, e.g., 1) and see if it helps. If it
> does, figure out which of the values matter and where the breaking points
> are.
>=20
> If it doesn't help, perhaps the units need to be disabled a little harder,
> e.g. by setting 0x22584/0x22588.

Heres the printed out values:
[    3.185455] Rop nr: 6
[    3.185457] Gpc nr: 4
[    3.185460] Tpc nr for gpc 0: 4
[    3.185463] Tpc nr for gpc 1: 4
[    3.185466] Tpc nr for gpc 2: 4
[    3.185469] Tpc nr for gpc 3: 4

I tried setting them all to 1, the card freezes pretty much immediately aft=
er
logging into kwin (which is when I suspect opengl rendering starts), althou=
gh
oddly enough there was no read fault in the dmesg.  I also tried setting th=
em
all to 2, and it froze pretty quickly too, and the machine became completely
unrecoverable.  Note that I also tried using the blob firmware with all val=
ues
set to 2, so I think not having them at their natural amounts simply pisses=
 the
card off.  Didn't try directly disabling stuff with 0x22584/0x22588, not
entirely sure where I would do that even.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1406572613.a26A2fAD4.21217
Date: Mon, 28 Jul 2014 18:36:53 +0000
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
   title=3D"NEW --- - [NVC8] linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg f=
reezes when using accel"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D54437#c16">Commen=
t # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVC8] linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg f=
reezes when using accel"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D54437">bug 54437<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kel.p.doran&#64;gmail.com" title=3D"Kelly Doran &lt;kel.p.doran&#64;gmail.c=
om&gt;"> <span class=3D"fn">Kelly Doran</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D54437#c13">comment #=
13</a>)
<span class=3D"quote">&gt; (In reply to <a href=3D"show_bug.cgi?id=3D54437#=
c12">comment #12</a>)
&gt; &gt; This bug is affecting me also, see the last duplicated bug. Any p=
rogress in
&gt; &gt; fixing this? Maybe some help in testing (for ex.) required?
&gt;=20
&gt; It's a bit of a mystery unfortunately. Adding to the annoyance, Ben sa=
id
&gt; that it does work just fine on his NVC8, although he has the less powe=
rful
&gt; versions. Could be something with high ROP/TPC/GPC counts not being ha=
ndled.
&gt; (Or multiple PARTs?)
&gt;=20
&gt; That might actually be an interesting experiment -- before loading nou=
veau,
&gt; mask out a bunch of the units and see if it helps. If it does, find the
&gt; &quot;breaking&quot; point.
&gt;=20
&gt; This is the code that computes that stuff:
&gt;=20
&gt; <a href=3D"http://cgit.freedesktop.org/~darktama/nouveau/tree/nvkm/eng=
ine/graph/nvc0">http://cgit.freedesktop.org/~darktama/nouveau/tree/nvkm/eng=
ine/graph/nvc0</a>.
&gt; c#n1330
&gt;=20
&gt; 	priv-&gt;rop_nr =3D (nv_rd32(priv, 0x409604) &amp; 0x001f0000) &gt;&g=
t; 16;
&gt; 	priv-&gt;gpc_nr =3D  nv_rd32(priv, 0x409604) &amp; 0x0000001f;
&gt; 	for (i =3D 0; i &lt; priv-&gt;gpc_nr; i++) {
&gt; 		priv-&gt;tpc_nr[i]  =3D nv_rd32(priv, GPC_UNIT(i, 0x2608));
&gt; 		priv-&gt;tpc_total +=3D priv-&gt;tpc_nr[i];
&gt; 	}
&gt;=20
&gt; Step 1: Print out the various values (i.e. number of ROPs, GPCs, and t=
he
&gt; per-GPC TPC counts).
&gt; Step 2: Artificially lower them (to, e.g., 1) and see if it helps. If =
it
&gt; does, figure out which of the values matter and where the breaking poi=
nts
&gt; are.
&gt;=20
&gt; If it doesn't help, perhaps the units need to be disabled a little har=
der,
&gt; e.g. by setting 0x22584/0x22588.</span >

Heres the printed out values:
[    3.185455] Rop nr: 6
[    3.185457] Gpc nr: 4
[    3.185460] Tpc nr for gpc 0: 4
[    3.185463] Tpc nr for gpc 1: 4
[    3.185466] Tpc nr for gpc 2: 4
[    3.185469] Tpc nr for gpc 3: 4

I tried setting them all to 1, the card freezes pretty much immediately aft=
er
logging into kwin (which is when I suspect opengl rendering starts), althou=
gh
oddly enough there was no read fault in the dmesg.  I also tried setting th=
em
all to 2, and it froze pretty quickly too, and the machine became completely
unrecoverable.  Note that I also tried using the blob firmware with all val=
ues
set to 2, so I think not having them at their natural amounts simply pisses=
 the
card off.  Didn't try directly disabling stuff with 0x22584/0x22588, not
entirely sure where I would do that even.</pre>
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

--1406572613.a26A2fAD4.21217--

--===============1454232372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1454232372==--
