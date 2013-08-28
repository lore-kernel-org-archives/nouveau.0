From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 6/6] drm/nouveau: use MSI interrupts
Date: Wed, 28 Aug 2013 09:54:17 -0400
Message-ID: <CAKb7Uvini5fD0JRLg4hnc2U7Cq51y0EWzR_yAUuSU0TtQeDvQw@mail.gmail.com>
References: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
	<1377648050-6649-7-git-send-email-dev@lynxeye.de>
	<CACAvsv5shyLkE-WdJj6yDx1hhFtNRkuzujxQasWd2MAaVMjJ7A@mail.gmail.com>
	<1377674937.1624.2.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1377674937.1624.2.camel@tellur>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Lucas Stach <dev@lynxeye.de>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Wed, Aug 28, 2013 at 3:28 AM, Lucas Stach <dev@lynxeye.de> wrote:
> Am Mittwoch, den 28.08.2013, 17:09 +1000 schrieb Ben Skeggs:
>> On Wed, Aug 28, 2013 at 10:00 AM, Lucas Stach <dev@lynxeye.de> wrote:
>> > MSIs were only problematic on some old, broken chipsets. But now that we
>> > already see systems where PCI legacy interrupts are somewhat flaky, it's
>> > really time to move to MSIs.
>> >
>> > Signed-off-by: Lucas Stach <dev@lynxeye.de>
>> > ---
>> >  drivers/gpu/drm/nouveau/core/include/subdev/mc.h |  1 +
>> >  drivers/gpu/drm/nouveau/core/subdev/mc/base.c    | 17 +++++++++++++++++
>> >  2 files changed, 18 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/mc.h b/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
>> > index 9d2cd20..ce6569f 100644
>> > --- a/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
>> > +++ b/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
>> > @@ -12,6 +12,7 @@ struct nouveau_mc_intr {
>> >  struct nouveau_mc {
>> >         struct nouveau_subdev base;
>> >         const struct nouveau_mc_intr *intr_map;
>> > +       bool use_msi;
>> >  };
>> >
>> >  static inline struct nouveau_mc *
>> > diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
>> > index ec9cd6f..02b337e 100644
>> > --- a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
>> > +++ b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
>> > @@ -23,6 +23,7 @@
>> >   */
>> >
>> >  #include <subdev/mc.h>
>> > +#include <core/option.h>
>> >
>> >  static irqreturn_t
>> >  nouveau_mc_intr(int irq, void *arg)
>> > @@ -43,6 +44,9 @@ nouveau_mc_intr(int irq, void *arg)
>> >                 map++;
>> >         }
>> >
>> > +       if (pmc->use_msi)
>> > +               nv_wr08(pmc->base.base.parent, 0x00088068, 0xff);
>> Register not present everywhere.
>>
>> At the very least, the enabling of MSI should be disallowed on the
>> earlier chipsets where it's not supported.  Though, it's perhaps
>> possible that the pci_enable_msi() call will fail in all of these
>> cases anyway.. I'm not certain.
>>
> MSIs are required property for everything doing PCIe. So the only cases
> where this should fail is plain PCI/AGP devices. I don't really have a
> test system for those old cards set up.
>
> But I remember Ilia having some legacy things plugged in, so maybe he
> could test this patch and see how it goes?

Sure, let me know what you need -- I have nv18 PCI, nv34 PCIe (note
that it's not native PCIe, but some sort of bridge thing IIRC), nv42
PCIe, nv44 PCIe, nv96 PCIe.

Can I just apply this patch, or do I need to do the whole series? What
constitutes a success?

  -ilia
