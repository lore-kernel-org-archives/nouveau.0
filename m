From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: 3.19.0-rc1 nouvea build failure on GeForce GT 610 only
Date: Mon, 22 Dec 2014 14:54:53 +0100
Message-ID: <1419256493.30945.53.camel@x220>
References: <54981647.8010409@blueyonder.co.uk>
	 <1419255471.30945.47.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419255471.30945.47.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Sid Boyce <sboyce@blueyonder.co.uk>
Cc: Mark Hounschell <markh@compro.net>, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Mon, 2014-12-22 at 14:37 +0100, Paul Bolle wrote:
> On Mon, 2014-12-22 at 13:01 +0000, Sid Boyce wrote:
> >    CHK     kernel/config_data.h
> >    CC [M]  drivers/gpu/drm/nouveau/core/engine/dmaobj/nvd0.o
> > drivers/gpu/drm/nouveau/core/engine/dmaobj/nvd0.c: In function=20
> > =E2=80=98nvd0_dmaobj_bind=E2=80=99:
> > drivers/gpu/drm/nouveau/core/engine/dmaobj/nvd0.c:54:8: error:=20
> > =E2=80=98GM204_DISP_CORE_CHANNEL_DMA=E2=80=99 undeclared (first use=
 in this function)
> >     case GM204_DISP_CORE_CHANNEL_DMA:
> >          ^
> > drivers/gpu/drm/nouveau/core/engine/dmaobj/nvd0.c:54:8: note: each=20
> > undeclared identifier is reported only once for each function it ap=
pears in
> > scripts/Makefile.build:257: recipe for target=20
> > 'drivers/gpu/drm/nouveau/core/engine/dmaobj/nvd0.o' failed
> > make[4]: *** [drivers/gpu/drm/nouveau/core/engine/dmaobj/nvd0.o] Er=
ror 1
> > scripts/Makefile.build:402: recipe for target 'drivers/gpu/drm/nouv=
eau'=20
> > failed
> > make[3]: *** [drivers/gpu/drm/nouveau] Error 2
> > scripts/Makefile.build:402: recipe for target 'drivers/gpu/drm' fai=
led
> > make[2]: *** [drivers/gpu/drm] Error 2
> > scripts/Makefile.build:402: recipe for target 'drivers/gpu' failed
> > make[1]: *** [drivers/gpu] Error 2
> > Makefile:938: recipe for target 'drivers' failed
> > make: *** [drivers] Error 2
> >=20
> > 01:00.0 VGA compatible controller: NVIDIA Corporation GF119 [GeForc=
e GT=20
> > 610] (rev a1)
>=20
> Why would that controller influence the build?
>=20
> > No problems on 2 other boxes with GeForce 8600 GT] (rev a1)
>=20
> I ran into this error twice, while building Fedora 21 kernel rpms for
> v3.19-rc1 on my outdated ThinkPad X41 (which uses i915, for what it's
> worth). The error made very little sense to me. Especially since it
> didn't happen when building in the local git repository.
>=20
> So I basically, well, scrubbed the rpmbuild environment. And then the
> the third attempt to build kernels rpm succeeded! I assumed a hardwar=
e
> failure (see outdated above) and made a mental note to investigate th=
at
> one of these days.
>=20
> But your report makes me think it's not my hardware. Could there be s=
ome
> _random_ failure with this driver in the build? Very odd...

A theory based on Mark's message in
https://lkml.org/lkml/2014/12/8/602 :

My two failed builds somehow used previous version of class.h, that
didn't yet have commit 1f89b4756fb8 ("drm/gm204/disp: initial support")
applied. It's that commit which added the define for
GM204_DISP_CORE_CHANNEL_DMA.

Is that even possible? Perhaps rpmbuild has a surprising way to handle
symlinks? All very puzzling...


Paul Bolle
