From: Pekka Paalanen <pq@iki.fi>
Subject: Re: [PATCH] drm: Remove DRIVER_DATE and CORE_DATE
Date: Mon, 3 Jan 2011 20:04:59 +0200
Message-ID: <20110103200459.64b7b4db@daedalus.pq.iki.fi>
References: <AANLkTi=nE87vGVvYQQgAjYXBRZtcq=j5Do1S47WQFLt1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <AANLkTi=nE87vGVvYQQgAjYXBRZtcq=j5Do1S47WQFLt1@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: sedat.dilek@gmail.com
Cc: nouveau@lists.freedesktop.org, =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org, sedat.dilek@googlemail.com, Michel@freedesktop.org
List-Id: nouveau.vger.kernel.org

On Wed, 22 Dec 2010 10:51:26 +0100
Sedat Dilek <sedat.dilek@googlemail.com> wrote:

> DRIVER_DATE is not maintained or upgraded on changes in many drm
> drivers.
> 
> For example radeon has one DRIVER_DATE for User and Kernel
> ModeSetting driver, this makes no sense as UMS and KMS driver
> have different versions. And of course this all increases
> maintenance, too. For radeon it is enough to bump
> {KMS_}DRIVER_MAJOR, {KMS_}DRIVER_MINOR and
> {KMS_}DRIVER_PATCHLEVEL defines.
> 
> Furthermore, I also removed CORE_DATE.
> 
> With radeon-KMS my dmesg looks now like this:
> 
> [   12.328937] [drm] Initialized drm 1.1.0
> [   13.144019] [drm] Initialized radeon 2.8.0 for 0000:01:00.0 on
> minor 0
> 
> Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
> 
> Note: Tested with radeon RV250 (KMS) and linux-next
> (next-20101221).
...
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
> index bb17057..50abca3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
> @@ -416,11 +416,6 @@ static struct drm_driver driver = {
>  
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
> -#ifdef GIT_REVISION
> -	.date = GIT_REVISION,
> -#else
> -	.date = DRIVER_DATE,
> -#endif
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,

Just a reminder, why this hunk was there in the first place:
it is quite usual for the Nouveau DRM to be compiled out-of-tree,
from different kernel git sources than the hosting kernel.
This was an attempt to record in the kernel log which exact
revision is being used. GIT_REVISION is defined by the Makefile
that is recommended to be used for out-of-tree building.

I didn't check if this patch has been accepted, but I believe
maintaining differences between nouveau/linux-2.6 and upstream
kernel trees is a burden.

Is there a better way to add revision information to an
out-of-tree built kernel module?
Or maybe this is not useful at all?


Cheers.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
