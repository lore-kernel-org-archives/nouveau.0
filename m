From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [RFC] Explicit synchronization for Nouveau
Date: Wed, 8 Oct 2014 11:10:14 +0200
Message-ID: <CAKMK7uHLBoufFEb5EBmOUP=vmeO+gVom0LNFQWGYxiL=k=eF2g@mail.gmail.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
 <20140929074302.GB4109@phenom.ffwll.local>
 <20141001151416.GC25206@eumail.nvidia.com>
 <20141001172721.GQ12343@phenom.ffwll.local>
 <20141002145950.GA4651@eumail.nvidia.com>
 <20141002190905.GA16117@phenom.ffwll.local>
 <CAABpnA_r1Vu8pGtxqXO8Ufg5KMhkUy_9RPic-VActaJQyLRm_w@mail.gmail.com>
 <20141006122540.GA7974@eumail.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20141006122540.GA7974-GyFFdlxoGbnFT5IIyIEb6QC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lauri Peltonen <lpeltonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rom Lemarchand <romlem-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Greg Hackmann <ghackmann-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Riley Andrews <riandrews-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ken Adams <kadams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Oct 6, 2014 at 2:25 PM, Lauri Peltonen <lpeltonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Also, the problem is that to actually push android stuff out of staging
>> you need a use-case in upstream, which means an open-source gpu driver.
>> There's not a lot of companies who have both that and ship android, and
>> definitely not the nexus/android lead platforms.
>>
>> Display side would be easier since there's a bunch of kms drivers now
>> upstream. But given that google decided to go ahead with their own adf
>> instead of drm-kms that's also a non-starter.
>
> Hmm..  Maybe we could use TegraDRM on the display side..  That and Nouveau
> would already be two upstream drivers that support explicit sync on Tegra K1.
>
> Also, if we bring sync fd's out of staging, one idea would be to add support
> for EGL_ANDROID_native_fence_sync in mesa, along with some tests.  That would
> demonstrate converting between sync fd's and EGLSync objects.

Just read through the extension spec for this and this sounds
excellent. So enabling that in mesa and having some basic piglits for
the conversion should be more than good enough to fullfill the
open-source userspace driver requirement.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
