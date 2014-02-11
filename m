From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: handle -EACCES runtime PM return
	code
Date: Tue, 11 Feb 2014 13:14:53 +0900
Message-ID: <CAAVeFuLgopbCSE2u_paxUJC-dsZU=XwJxHen-jWMADQKZuuucQ@mail.gmail.com>
References: <1392011892-4339-1-git-send-email-acourbot@nvidia.com>
	<20140210123424.GE20143@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140210123424.GE20143-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Feb 10, 2014 at 9:34 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Feb 10, 2014 at 02:58:12PM +0900, Alexandre Courbot wrote:
>> pm_runtime_get*() may return -EACCESS to indicate a device does not have
>
> s/-EACCESS/-EACCES/

Oops.

>> runtime PM enabled. This is the case when the nouveau.runpm parameter is
>> set to 0, and is not an error in that context. Handle this case without
>> failure.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/gpu/drm/nouveau/dispnv04/crtc.c     | 2 +-
>>  drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
>>  drivers/gpu/drm/nouveau/nouveau_drm.c       | 4 ++--
>>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> I'm not sure if the commit message is entirely accurate. Looking at the
> various runtime power-management functions in nouveau_drm.c (such as
> nouveau_pmops_runtime_suspend() for example), they seem to return
> -EINVAL if the nouveau.runpm parameter is set to 0.
>
> However it seems like -EACCES is indeed returned when runtime power-
> management hasn't been enabled for a device. This is done automatically
> for PCI devices, but not for platform devices. We don't support runtime
> power-management on gk20a yet, therefore pm_runtime_enable() is never
> called, causing disable_depth to remain at -1 and therefore runtime PM
> helpers return -EACCES.

I will fix the commit message, as indeed the -EACCES code is not
directly related to the runpm parameter, but rather to the fact
pm_runtime_enable() is not called for platform devices yet.

Do we however agree on the issue that this patch addresses, and the
way it addresses it?

Thanks,
Alex.
