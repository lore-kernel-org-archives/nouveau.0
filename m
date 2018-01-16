From: Brock York <twunknown-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 0/4] Implement full clockgating for Kepler1 and 2
Date: Tue, 16 Jan 2018 11:03:57 +1100
Message-ID: <CACY=MfXvNEwZVJSR4hp4nmq1UYLdvmopPTAq8MdmQyyjcio5DA@mail.gmail.com>
References: <20180115220755.16780-1-lyude@redhat.com>
 <CACY=MfW3b0qXALO1Y7bt=F7jMCfrdgi3qmmzKOXehJK5Xc5MmQ@mail.gmail.com>
 <CACY=MfVkNPsvNWGiy9o9A=YAZciV5k=jCJ4hrNUBocThgA56sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1759990536=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACY=MfVkNPsvNWGiy9o9A=YAZciV5k=jCJ4hrNUBocThgA56sQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1759990536==
Content-Type: multipart/alternative; boundary="f403045c20e49e90a30562d977ce"

--f403045c20e49e90a30562d977ce
Content-Type: text/plain; charset="UTF-8"

Hello Paul

I have a GTX 480 (GF100 I believe) at home in an old machine. Is the rest
of the Fermi patch set available somewhere for me to test?

Thank you
Regards Brock



On 16 Jan. 2018 9:08 am, "Lyude Paul" <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

It's here! After a lot of investigation, rewrites, and traces, I present
the patch series to implement all known )levels of clockgating for
Kepler1 and Kepler2 GPUs.

Starting with Fermi GPUs (this is probably present on earlier GPUs as
well, but with a far less easy to manage interface), nvidia added two
clockgating levels that are handled mostly in firmware (with the
exception of course, of the driver initially programming all of the
register values containing engine delays and that stuff):
  - CG_CTRL - Main register for enabling/disabling clockgating for
    engines and hw blocks
  - BLCG - "Block-level clockgating", a deeper level of clockgating
Starting with kepler2 as well, nvidia also introduced:
  - SLCG - "??? clockgating" even deeper level of clockgating

Originally this patchset was going to include work for making this work
on Fermi, however on closer investigation it seems that Fermi has one
pretty big difference in it's requirements that we don't entirely
understand yet. On Fermi the CG_CTRL register for the gr needs to be
adjusted during reclocking, while kepler and later generations need no
such adjustments. Since this requires more research; the current plan is
to leave fermi out of this patchset, and then just rework the code at a
later point in time to support Fermi once we understand more.

For the time being however, we put as much code we're sure Fermi will be
sharing into gf100 files for the future.

For the time being; this patchset supports every GPU in the kepler1 and
kepler2 family. The main kernel config option to enable this is
        config=NvPmEnableGating=<level>
Where <level> is the deepest level of powersaving to enable. The levels
being:
        0. NOCG
        1. CG (just CG_CTRL)
        2. BLCG
        3. SLCG

Additionally, we leave a couple of small TODO comments to mark spots
we'll eventually need to add code for the final level of power saving we
have yet to implement or understand: ELPG (engine-level powergating).

Here's some very lazily done benchmarks on how much power this saves as
well. It should be noted that chances are, these patches save a lot more
power then you see here since clockgating works best when the GPU is
under load. I have a feeling this will be especially true with SLCG.

GK104 stats:
  Idle (1 4k display @ fbcon):
    NOCG:
      07: 20.53W
      0a: 44.12W
      0e: 61.23W
      0f: 62.23W
    CG:
      07: 18.95W-19.02W
      0a: 34.95W-37.48W
      0e: 52.70W-54.32W
      0f: 53.53W-55.68W
    BLCG:
      07: 18.64W-19.02W
      0a: 32.68W-34.78W
      0e: 49.14W-50.51W
      0f: 49.75W-51.73W
GK110 stats:
  Idle (1 4k display @ fbcon):
    NOCG:
      07: 25.68W
      0a: 36.16W
      0d: 64.71W
      0f: 64.99W
    CG:
      07: 25.68W
      0a: 35.58W
      0d: 61.54W-61.74W
      0f: 61.93W-62.12W
    BLCG:
      07: 25W-25.2W
      0a: 33.85W-34.04W
      0d: 59.25W-59.44W
      0f: 59.35W-59.54W
    SLCG:
      07: 25W-25.2W
      0a: 33.85W-33.95W (spikes to 34.04W briefly every now and then)
      0d: 59.15W-59.35W
      0f: 59.35W-59.54W

For the time being, this will be disabled by default in the kernel as we
wait to get more widespread testing with this patchset. If you're
willing to put up with the potential of instability, please feel free to
try this patchset and let us know how well it works for you!

Lyude Paul (4):
  drm/nouveau: Add support for basic clockgating on Kepler1
  drm/nouveau: Add support for BLCG clockgating for Kepler1
  drm/nouveau: Add BLCG clockgating for Kepler2
  drm/nouveau: Add SLCG clockgating for Kepler2

 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h   |   1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/therm.h    |  25 +++
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  25 +--
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h     |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.c     | 215
++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.h     |  55 ++++++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110.c     | 176 +++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild      |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c     |   6 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c     |  53 +++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.h     |  35 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c     |  77 ++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h      |   3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/Kbuild   |   2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c   |  84 +++++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.c  |  77 ++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.h  |  35 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c  |   8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.c  | 136 +++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.h  |  56 ++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gt215.c  |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h   |  23 ++-
 22 files changed, 1069 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.h

--
2.14.3

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--f403045c20e49e90a30562d977ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello Paul<div dir=3D"auto"><br></div><div dir=3D"au=
to">I have a GTX 480 (GF100 I believe) at home in an old machine. Is the re=
st of the Fermi patch set available somewhere for me to test?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thank you</div><div dir=3D"auto">Rega=
rds Brock</div><div dir=3D"auto"><br></div><br><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On 16 Jan. 2018 9:08 am, &quot;Lyude Paul&quo=
t; &lt;<a href=3D"mailto:lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt; wrote:<=
br type=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">It&#39;s here! After a lot=
 of investigation, rewrites, and traces, I present<br>
the patch series to implement all known )levels of clockgating for<br>
Kepler1 and Kepler2 GPUs.<br>
<br>
Starting with Fermi GPUs (this is probably present on earlier GPUs as<br>
well, but with a far less easy to manage interface), nvidia added two<br>
clockgating levels that are handled mostly in firmware (with the<br>
exception of course, of the driver initially programming all of the<br>
register values containing engine delays and that stuff):<br>
=C2=A0 - CG_CTRL - Main register for enabling/disabling clockgating for<br>
=C2=A0 =C2=A0 engines and hw blocks<br>
=C2=A0 - BLCG - &quot;Block-level clockgating&quot;, a deeper level of cloc=
kgating<br>
Starting with kepler2 as well, nvidia also introduced:<br>
=C2=A0 - SLCG - &quot;??? clockgating&quot; even deeper level of clockgatin=
g<br>
<br>
Originally this patchset was going to include work for making this work<br>
on Fermi, however on closer investigation it seems that Fermi has one<br>
pretty big difference in it&#39;s requirements that we don&#39;t entirely<b=
r>
understand yet. On Fermi the CG_CTRL register for the gr needs to be<br>
adjusted during reclocking, while kepler and later generations need no<br>
such adjustments. Since this requires more research; the current plan is<br=
>
to leave fermi out of this patchset, and then just rework the code at a<br>
later point in time to support Fermi once we understand more.<br>
<br>
For the time being however, we put as much code we&#39;re sure Fermi will b=
e<br>
sharing into gf100 files for the future.<br>
<br>
For the time being; this patchset supports every GPU in the kepler1 and<br>
kepler2 family. The main kernel config option to enable this is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 config=3DNvPmEnableGating=3D&lt;<wbr>level&gt;<=
br>
Where &lt;level&gt; is the deepest level of powersaving to enable. The leve=
ls<br>
being:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0. NOCG<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1. CG (just CG_CTRL)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2. BLCG<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 3. SLCG<br>
<br>
Additionally, we leave a couple of small TODO comments to mark spots<br>
we&#39;ll eventually need to add code for the final level of power saving w=
e<br>
have yet to implement or understand: ELPG (engine-level powergating).<br>
<br>
Here&#39;s some very lazily done benchmarks on how much power this saves as=
<br>
well. It should be noted that chances are, these patches save a lot more<br=
>
power then you see here since clockgating works best when the GPU is<br>
under load. I have a feeling this will be especially true with SLCG.<br>
<br>
GK104 stats:<br>
=C2=A0 Idle (1 4k display @ fbcon):<br>
=C2=A0 =C2=A0 NOCG:<br>
=C2=A0 =C2=A0 =C2=A0 07: 20.53W<br>
=C2=A0 =C2=A0 =C2=A0 0a: 44.12W<br>
=C2=A0 =C2=A0 =C2=A0 0e: 61.23W<br>
=C2=A0 =C2=A0 =C2=A0 0f: 62.23W<br>
=C2=A0 =C2=A0 CG:<br>
=C2=A0 =C2=A0 =C2=A0 07: 18.95W-19.02W<br>
=C2=A0 =C2=A0 =C2=A0 0a: 34.95W-37.48W<br>
=C2=A0 =C2=A0 =C2=A0 0e: 52.70W-54.32W<br>
=C2=A0 =C2=A0 =C2=A0 0f: 53.53W-55.68W<br>
=C2=A0 =C2=A0 BLCG:<br>
=C2=A0 =C2=A0 =C2=A0 07: 18.64W-19.02W<br>
=C2=A0 =C2=A0 =C2=A0 0a: 32.68W-34.78W<br>
=C2=A0 =C2=A0 =C2=A0 0e: 49.14W-50.51W<br>
=C2=A0 =C2=A0 =C2=A0 0f: 49.75W-51.73W<br>
GK110 stats:<br>
=C2=A0 Idle (1 4k display @ fbcon):<br>
=C2=A0 =C2=A0 NOCG:<br>
=C2=A0 =C2=A0 =C2=A0 07: 25.68W<br>
=C2=A0 =C2=A0 =C2=A0 0a: 36.16W<br>
=C2=A0 =C2=A0 =C2=A0 0d: 64.71W<br>
=C2=A0 =C2=A0 =C2=A0 0f: 64.99W<br>
=C2=A0 =C2=A0 CG:<br>
=C2=A0 =C2=A0 =C2=A0 07: 25.68W<br>
=C2=A0 =C2=A0 =C2=A0 0a: 35.58W<br>
=C2=A0 =C2=A0 =C2=A0 0d: 61.54W-61.74W<br>
=C2=A0 =C2=A0 =C2=A0 0f: 61.93W-62.12W<br>
=C2=A0 =C2=A0 BLCG:<br>
=C2=A0 =C2=A0 =C2=A0 07: 25W-25.2W<br>
=C2=A0 =C2=A0 =C2=A0 0a: 33.85W-34.04W<br>
=C2=A0 =C2=A0 =C2=A0 0d: 59.25W-59.44W<br>
=C2=A0 =C2=A0 =C2=A0 0f: 59.35W-59.54W<br>
=C2=A0 =C2=A0 SLCG:<br>
=C2=A0 =C2=A0 =C2=A0 07: 25W-25.2W<br>
=C2=A0 =C2=A0 =C2=A0 0a: 33.85W-33.95W (spikes to 34.04W briefly every now =
and then)<br>
=C2=A0 =C2=A0 =C2=A0 0d: 59.15W-59.35W<br>
=C2=A0 =C2=A0 =C2=A0 0f: 59.35W-59.54W<br>
<br>
For the time being, this will be disabled by default in the kernel as we<br=
>
wait to get more widespread testing with this patchset. If you&#39;re<br>
willing to put up with the potential of instability, please feel free to<br=
>
try this patchset and let us know how well it works for you!<br>
<br>
Lyude Paul (4):<br>
=C2=A0 drm/nouveau: Add support for basic clockgating on Kepler1<br>
=C2=A0 drm/nouveau: Add support for BLCG clockgating for Kepler1<br>
=C2=A0 drm/nouveau: Add BLCG clockgating for Kepler2<br>
=C2=A0 drm/nouveau: Add SLCG clockgating for Kepler2<br>
<br>
=C2=A0drivers/gpu/drm/nouveau/<wbr>include/nvkm/subdev/fb.h=C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0.../gpu/drm/nouveau/include/<wbr>nvkm/subdev/therm.h=C2=A0 =C2=A0 |=
=C2=A0 25 +++<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>engine/device/base.c=C2=A0 |=C2=A0 =
25 +--<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>engine/gr/gf100.h=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>engine/gr/gk104.c=C2=A0 =C2=A0 =C2=
=A0| 215 ++++++++++++++++++++-<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>engine/gr/gk104.h=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 55 ++++++<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>engine/gr/gk110.c=C2=A0 =C2=A0 =C2=
=A0| 176 +++++++++++++++++<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/fb/Kbuild=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/fb/gf100.c=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/fb/gk104.c=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 53 +++++<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/fb/gk104.h=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 35 ++++<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/fb/gk110.c=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 77 ++++++++<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/fb/priv.h=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/Kbuild=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/base.c=C2=A0 =C2=A0|=
=C2=A0 84 +++++++-<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/gf100.c=C2=A0 |=C2=A0 =
77 ++++++++<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/gf100.h=C2=A0 |=C2=A0 =
35 ++++<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/gf119.c=C2=A0 |=C2=A0 =
=C2=A08 +-<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/gk104.c=C2=A0 | 136 ++=
+++++++++++<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/gk104.h=C2=A0 |=C2=A0 =
56 ++++++<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/gt215.c=C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/priv.h=C2=A0 =C2=A0|=
=C2=A0 23 ++-<br>
=C2=A022 files changed, 1069 insertions(+), 27 deletions(-)<br>
=C2=A0create mode 100644 drivers/gpu/drm/nouveau/nvkm/<wbr>engine/gr/gk104.=
h<br>
=C2=A0create mode 100644 drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/fb/gk104.=
h<br>
=C2=A0create mode 100644 drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/fb/gk110.=
c<br>
=C2=A0create mode 100644 drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/gf1=
00.c<br>
=C2=A0create mode 100644 drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/gf1=
00.h<br>
=C2=A0create mode 100644 drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/gk1=
04.c<br>
=C2=A0create mode 100644 drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/gk1=
04.h<br>
<font color=3D"#888888"><br>
--<br>
2.14.3<br>
<br>
______________________________<wbr>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/lis=
tinfo/nouveau</a><br>
</font></blockquote></div><br></div></div></div>

--f403045c20e49e90a30562d977ce--

--===============1759990536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1759990536==--
