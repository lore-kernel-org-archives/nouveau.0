From: Patrick Baggett <baggett.patrick@gmail.com>
Subject: Re: [PATCH v2 2/2] xorg/nouveau: blacklist all pre NV30
	cards
Date: Sun, 5 Jun 2011 14:22:19 -0500
Message-ID: <BANLkTikUFyF69p8bUCmLm9jwNvPBNDfFBg@mail.gmail.com>
References: <20110516195110.GB5456@joi.lan> <20110516222014.GH5456@joi.lan>
	<20110605190626.GE22091@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0512036521=="
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <20110605190626.GE22091@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============0512036521==
Content-Type: multipart/alternative; boundary=90e6ba1f0020c715da04a4fbe775

--90e6ba1f0020c715da04a4fbe775
Content-Type: text/plain; charset=ISO-8859-1

Wasn't nouveau targeted to provide HW acceleration for old cards like the
TNT2, or has that idea been killed?

Patrick

On Sun, Jun 5, 2011 at 2:06 PM, Marcin Slusarz <marcin.slusarz@gmail.com>wrote:

> On Tue, May 17, 2011 at 12:20:14AM +0200, Marcin Slusarz wrote:
> > Bail out early in probe, so other driver can take control of the card.
> > Doing it in screen_create would be too late.
> > ---
> >  src/gallium/targets/xorg-nouveau/nouveau_xorg.c |   44
> ++++++++++++++++++-----
> >  1 files changed, 35 insertions(+), 9 deletions(-)
>
> ping
>
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/mesa-dev
>

--90e6ba1f0020c715da04a4fbe775
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Wasn&#39;t nouveau targeted to provide HW acceleration for old cards like t=
he TNT2, or has that idea been killed?<div><br></div><div>Patrick<br><br><d=
iv class=3D"gmail_quote">On Sun, Jun 5, 2011 at 2:06 PM, Marcin Slusarz <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:marcin.slusarz@gmail.com">marcin.slusa=
rz@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;">On Tue, May 17, 2011 at 12:20:14AM +0200, M=
arcin Slusarz wrote:<br>
&gt; Bail out early in probe, so other driver can take control of the card.=
<br>
&gt; Doing it in screen_create would be too late.<br>
&gt; ---<br>
&gt; =A0src/gallium/targets/xorg-nouveau/nouveau_xorg.c | =A0 44 ++++++++++=
++++++++-----<br>
&gt; =A01 files changed, 35 insertions(+), 9 deletions(-)<br>
<br>
ping<br>
<br>
_______________________________________________<br>
mesa-dev mailing list<br>
<a href=3D"mailto:mesa-dev@lists.freedesktop.org">mesa-dev@lists.freedeskto=
p.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/mesa-dev" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/mesa-dev</a><br>
</blockquote></div><br></div>

--90e6ba1f0020c715da04a4fbe775--

--===============0512036521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
mesa-dev mailing list
mesa-dev@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/mesa-dev

--===============0512036521==--
