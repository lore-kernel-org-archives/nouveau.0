From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Mon, 19 Jan 2015 16:21:57 +0000
Message-ID: <bug-70354-8800-ZedmaQQxqT@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1723954629=="
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


--===============1723954629==
Content-Type: multipart/alternative; boundary="1421684517.3B72aB5.5597"; charset="UTF-8"


--1421684517.3B72aB5.5597
Date: Mon, 19 Jan 2015 16:21:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D70354

--- Comment #46 from Vitaly Torshyn <vitaly.torshyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to bruno.pagani from comment #45)
> (In reply to Vitaly Torshyn from comment #43)
> > (In reply to aidan from comment #40)
> > > (In reply to Vitaly Torshyn from comment #39)
> > > > Hi folks,
> > > > Please see previously attached dmesg and xorg logs.
> > > > I was using Ben's git repo to apply a patch for 3.18.2 kernel.
> > > > Actually, the patch is only removed INIT HUB error. In addition, X =
was
> > > > managed to start with AIGLX enabled but nouveau crashed on start an=
y GL
> > > > enabled application.
> > > > Please note, the same behavior with SLI enabled.=20
> > > > HW is Lenovo Y510P with dual GT 755M video.
> > > >=20
> > > > Please, feel free to request additional information.
> > >=20
> > > I have a similar laptop, and I think the X crashing is this
> > > (https://bugs.freedesktop.org/show_bug.cgi?id=3D88514) issue.
> >=20
> > I don't think so. The X crashing even with second nvidia GPU installed.=
 In
> > case intel gpu is turned off by notebooks firmware.
>=20
> I don=E2=80=99t understand your message Vitaly, but I think he is right, =
this is the
> same bug. I=E2=80=99m having the same symptoms he has.

Sorry, I wasn't clear in my earlier message. I have an SLI enabled laptop a=
nd
second GPU can be removed. Without second GPU intel's GPU is turned on by B=
IOS
(firmware).=20
So, X crashed with/without second GPU.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1421684517.3B72aB5.5597
Date: Mon, 19 Jan 2015 16:21:57 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354#c46">Commen=
t # 46</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn=
't help"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354">bug 70354<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
vitaly.torshyn&#64;gmail.com" title=3D"Vitaly Torshyn &lt;vitaly.torshyn&#6=
4;gmail.com&gt;"> <span class=3D"fn">Vitaly Torshyn</span></a>
</span></b>
        <pre>(In reply to bruno.pagani from <a href=3D"show_bug.cgi?id=3D70=
354#c45">comment #45</a>)
<span class=3D"quote">&gt; (In reply to Vitaly Torshyn from <a href=3D"show=
_bug.cgi?id=3D70354#c43">comment #43</a>)
&gt; &gt; (In reply to aidan from <a href=3D"show_bug.cgi?id=3D70354#c40">c=
omment #40</a>)
&gt; &gt; &gt; (In reply to Vitaly Torshyn from <a href=3D"show_bug.cgi?id=
=3D70354#c39">comment #39</a>)
&gt; &gt; &gt; &gt; Hi folks,
&gt; &gt; &gt; &gt; Please see previously attached dmesg and xorg logs.
&gt; &gt; &gt; &gt; I was using Ben's git repo to apply a patch for 3.18.2 =
kernel.
&gt; &gt; &gt; &gt; Actually, the patch is only removed INIT HUB error. In =
addition, X was
&gt; &gt; &gt; &gt; managed to start with AIGLX enabled but nouveau crashed=
 on start any GL
&gt; &gt; &gt; &gt; enabled application.
&gt; &gt; &gt; &gt; Please note, the same behavior with SLI enabled.=20
&gt; &gt; &gt; &gt; HW is Lenovo Y510P with dual GT 755M video.
&gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; Please, feel free to request additional information.
&gt; &gt; &gt;=20
&gt; &gt; &gt; I have a similar laptop, and I think the X crashing is this
&gt; &gt; &gt; (<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X segfaults when using prime offloading to nouveau card"
   href=3D"show_bug.cgi?id=3D88514">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D88514</a>) issue.
&gt; &gt;=20
&gt; &gt; I don't think so. The X crashing even with second nvidia GPU inst=
alled. In
&gt; &gt; case intel gpu is turned off by notebooks firmware.
&gt;=20
&gt; I don=E2=80=99t understand your message Vitaly, but I think he is righ=
t, this is the
&gt; same bug. I=E2=80=99m having the same symptoms he has.</span >

Sorry, I wasn't clear in my earlier message. I have an SLI enabled laptop a=
nd
second GPU can be removed. Without second GPU intel's GPU is turned on by B=
IOS
(firmware).=20
So, X crashed with/without second GPU.</pre>
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

--1421684517.3B72aB5.5597--

--===============1723954629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1723954629==--
