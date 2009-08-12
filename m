From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 10/12] drm: Import driver for the ch7006 I2C
 TV encoder chip.
Date: Wed, 12 Aug 2009 11:04:35 +0300
Message-ID: <20090812110435.1c9628cd@daedalus.pq.iki.fi>
References: <1250036108-28655-1-git-send-email-currojerez@riseup.net>
	<1250036108-28655-11-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250036108-28655-11-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 12 Aug 2009 02:15:06 +0200
Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wrote:

> 
> Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
> ---
>  drivers/gpu/drm/Kconfig           |   14 +
>  drivers/gpu/drm/Makefile          |    1 +
>  drivers/gpu/drm/i2c/Makefile      |    3 +
>  drivers/gpu/drm/i2c/ch7006_drv.c  |  479 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/i2c/ch7006_mode.c |  470 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/i2c/ch7006_priv.h |  332 +++++++++++++++++++++++++
>  include/drm/i2c/ch7006.h          |   86 +++++++
>  7 files changed, 1385 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/gpu/drm/i2c/Makefile
>  create mode 100644 drivers/gpu/drm/i2c/ch7006_drv.c
>  create mode 100644 drivers/gpu/drm/i2c/ch7006_mode.c
>  create mode 100644 drivers/gpu/drm/i2c/ch7006_priv.h
>  create mode 100644 include/drm/i2c/ch7006.h

This patch should probably go in via dri-devel@ and airlied, like
the other two DRM patches. Would that work?

It would be unused without Nouveau, so it probably won't get to
Linus' before Nouveau does. Airlied?

Does Nouveau build and work otherwise without this patch?

If we take it to the nouveau/linux-2.6 master branch, we would
have to remember to revert it when submitting Nouveau upstream.
OTOH, we could apply it to master-compat branch for testing.
How's that sound?


Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
