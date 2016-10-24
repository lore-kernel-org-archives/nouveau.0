From: Karol Herbst <karolherbst@gmail.com>
Subject: Re: [Nouveau] [PATCH 01/17] drm/nouveau/core: add missing header dependencies
Date: Mon, 24 Oct 2016 17:43:20 +0200
Message-ID: <CAEXux-Y+MXCawYsWm3gNgjA+7y6iVqqJN0n_cLNqR2U33GRWrA@mail.gmail.com>
References: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
 <CAEXux-ZYknEnU=D4qA_xv162vXF4UpVG-W9eNk68ahQoPP0ozQ@mail.gmail.com> <CA+DQWkwyKzpU+oPxsz1LAPB34gQRuJGchHqzj-4262dnYdsFFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+DQWkwyKzpU+oPxsz1LAPB34gQRuJGchHqzj-4262dnYdsFFw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Alexandre Courbot <acourbot@nvidia.com>, Ilia Mirkin <imirkin@alum.mit.edu>, Julia Lawall <Julia.Lawall@lip6.fr>, Martin Peres <martin.peres@free.fr>, rspliet@eclipso.eu, Karol Herbst <nouveau@karolherbst.de>, Arnd Bergmann <arnd@arndb.de>, ML nouveau <nouveau@lists.freedesktop.org>, tang.qiang007@zte.com.cn, xie.baoyou@zte.com.cn, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, han.fei@zte.com.cn
List-Id: nouveau.vger.kernel.org

2016-10-24 9:13 GMT+02:00 Baoyou Xie <baoyou.xie@linaro.org>:
>
>
> On 23 October 2016 at 01:32, Karol Herbst <karolherbst@gmail.com> wrote:
>>
>> I think it would be better to squash those commits:
>> 1. for the includes
>> 2. for static declerations
>>
> OK, I have resent new patch that squash those commits.
>

thanks, this is much easier to review and keeps the git history clean :)
Will try to make a test with those patches over the next days, but it
looks fine as it is already.

>>
>> 2016-10-22 11:41 GMT+02:00 Baoyou Xie <baoyou.xie@linaro.org>:
>> > We get 2 warnings when building kernel with W=1:
>> > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:34:1: warning: no previous
>> > prototype for 'nvkm_firmware_get' [-Wmissing-prototypes]
>> > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:58:1: warning: no previous
>> > prototype for 'nvkm_firmware_put' [-Wmissing-prototypes]
>> >
>> > In fact, these functions are declared in
>> > drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h.
>> > So this patch adds missing header dependencies.
>> >
>> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
>> > ---
>> >  drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
>> > b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
>> > index 34ecd4a..058ff46 100644
>> > --- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
>> > +++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
>> > @@ -20,6 +20,7 @@
>> >   * DEALINGS IN THE SOFTWARE.
>> >   */
>> >  #include <core/device.h>
>> > +#include <core/firmware.h>
>> >
>> >  /**
>> >   * nvkm_firmware_get - load firmware from the official nvidia/chip/
>> > directory
>> > --
>> > 2.7.4
>> >
>> > _______________________________________________
>> > Nouveau mailing list
>> > Nouveau@lists.freedesktop.org
>> > https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>
