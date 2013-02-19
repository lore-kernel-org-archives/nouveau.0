From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix suspend bug in nvc0 fence
 implementation
Date: Tue, 19 Feb 2013 22:17:26 +0100
Message-ID: <20130219211726.GC3080@joi.lan>
References: <CAMuW1wcx8BEkase+S_+bmZp6b+CFunrmAd6PDNaZONFYLfpG-g@mail.gmail.com>
	<20130219194938.GA3080@joi.lan>
	<CAMpzoDBtNVH_3PXvsReC8ytNcCAebfJjHDYQ8eDOgD4ns+ekuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMpzoDBtNVH_3PXvsReC8ytNcCAebfJjHDYQ8eDOgD4ns+ekuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Michael Weirauch <michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Feb 19, 2013 at 10:09:12PM +0100, Michael Weirauch wrote:
> 2013/2/19 Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> > Yay. It will probably fix https://bugs.freedesktop.org/show_bug.cgi?id=59168.
> > (note: it doesn't apply on top of nouveau/master)
> 
> Please correct me if I am wrong, but doesn't nv84_fence_[resume,suspend]
> on current nouveau-3.8.0_rc7 (master) which is "used" by nvc0_fence.c
> "identical" to what this patch does?
> 
> nvc0_fence_create->
> nv84_fence_create sets up:
> 	priv->base.suspend = nv84_fence_suspend;
> 	priv->base.resume = nv84_fence_resume;
> 
> There is no dedicated nvc0_fence_[resume,suspend] impl from what I grasped.
> 
> c.f.:
> http://cgit.freedesktop.org/nouveau/linux-2.6/tree/drivers/gpu/drm/nouveau/nv84_fence.c#n178

This patch is only for 3.7 and 3.8 kernels. Nouveau/master contains refactored
fence code which will be submitted for 3.9.

Marcin
