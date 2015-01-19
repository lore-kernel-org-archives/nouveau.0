From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Mon, 19 Jan 2015 16:14:34 +0000
Message-ID: <bug-70354-8800-GKTiQOqMGV@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0934520292=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0934520292==
Content-Type: multipart/alternative; boundary="1421684074.df867a275.3190"; charset="UTF-8"


--1421684074.df867a275.3190
Date: Mon, 19 Jan 2015 16:14:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D70354

--- Comment #45 from bruno.pagani-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org ---
(In reply to Vitaly Torshyn from comment #43)
> (In reply to aidan from comment #40)
> > (In reply to Vitaly Torshyn from comment #39)
> > > Hi folks,
> > > Please see previously attached dmesg and xorg logs.
> > > I was using Ben's git repo to apply a patch for 3.18.2 kernel.
> > > Actually, the patch is only removed INIT HUB error. In addition, X was
> > > managed to start with AIGLX enabled but nouveau crashed on start any =
GL
> > > enabled application.
> > > Please note, the same behavior with SLI enabled.=20
> > > HW is Lenovo Y510P with dual GT 755M video.
> > >=20
> > > Please, feel free to request additional information.
> >=20
> > I have a similar laptop, and I think the X crashing is this
> > (https://bugs.freedesktop.org/show_bug.cgi?id=3D88514) issue.
>=20
> I don't think so. The X crashing even with second nvidia GPU installed. In
> case intel gpu is turned off by notebooks firmware.

I don=E2=80=99t understand your message Vitaly, but I think he is right, th=
is is the
same bug. I=E2=80=99m having the same symptoms he has.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1421684074.df867a275.3190
Date: Mon, 19 Jan 2015 16:14:34 +0000
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
   title=3D"NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn=
't help"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354#c45">Commen=
t # 45</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn=
't help"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354">bug 70354<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.pagani&#64;ens-lyon.org" title=3D"bruno.pagani&#64;ens-lyon.org">brun=
o.pagani&#64;ens-lyon.org</a>
</span></b>
        <pre>(In reply to Vitaly Torshyn from <a href=3D"show_bug.cgi?id=3D=
70354#c43">comment #43</a>)
<span class=3D"quote">&gt; (In reply to aidan from <a href=3D"show_bug.cgi?=
id=3D70354#c40">comment #40</a>)
&gt; &gt; (In reply to Vitaly Torshyn from <a href=3D"show_bug.cgi?id=3D703=
54#c39">comment #39</a>)
&gt; &gt; &gt; Hi folks,
&gt; &gt; &gt; Please see previously attached dmesg and xorg logs.
&gt; &gt; &gt; I was using Ben's git repo to apply a patch for 3.18.2 kerne=
l.
&gt; &gt; &gt; Actually, the patch is only removed INIT HUB error. In addit=
ion, X was
&gt; &gt; &gt; managed to start with AIGLX enabled but nouveau crashed on s=
tart any GL
&gt; &gt; &gt; enabled application.
&gt; &gt; &gt; Please note, the same behavior with SLI enabled.=20
&gt; &gt; &gt; HW is Lenovo Y510P with dual GT 755M video.
&gt; &gt; &gt;=20
&gt; &gt; &gt; Please, feel free to request additional information.
&gt; &gt;=20
&gt; &gt; I have a similar laptop, and I think the X crashing is this
&gt; &gt; (<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X segfaults when using prime offloading to nouveau card"
   href=3D"show_bug.cgi?id=3D88514">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D88514</a>) issue.
&gt;=20
&gt; I don't think so. The X crashing even with second nvidia GPU installed=
. In
&gt; case intel gpu is turned off by notebooks firmware.</span >

I don=E2=80=99t understand your message Vitaly, but I think he is right, th=
is is the
same bug. I=E2=80=99m having the same symptoms he has.</pre>
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

--1421684074.df867a275.3190--

--===============0934520292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0934520292==--
