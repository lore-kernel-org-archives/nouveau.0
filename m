From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 0/6] drm/nouveau: Support sync FDs and sync
 objects
Date: Wed, 23 Sep 2020 17:21:24 +0200
Message-ID: <20200923152124.GO438822@phenom.ffwll.local>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
 <20200923091853.GA1229032@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200923091853.GA1229032@ulmo>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Sep 23, 2020 at 11:18:53AM +0200, Thierry Reding wrote:
> On Fri, Aug 28, 2020 at 12:40:10PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Hi,
> > 
> > This series implements a new IOCTL to submit push buffers that can
> > optionally return a sync FD or sync object to userspace. This is useful
> > in cases where userspace wants to synchronize operations between the GPU
> > and another driver (such as KMS for display). Among other things this
> > allows extensions such as eglDupNativeFenceFDANDROID to be implemented.
> > 
> > Note that patch 4 modifies the ABI introduced in patch 3 by allowing DRM
> > sync objects to be passed rather than only sync FDs. It also allows any
> > number of sync FDs/objects to be passed in or emitted. I think those are
> > useful features, but I left them in a separate patch in case everybody
> > else thinks that this won't be needed. If we decide to merge the new ABI
> > then patch 4 should be squashed into patch 3.
> > 
> > The corresponding userspace changes can be found here:
> > 
> >   libdrm: https://gitlab.freedesktop.org/tagr/drm/-/commits/nouveau-sync-fd-v2/
> >   mesa: https://gitlab.freedesktop.org/tagr/mesa/-/commits/nouveau-sync-fd/
> > 
> > I've verified that this works with kmscube's --atomic mode and Weston.
> 
> Hi Ben,
> 
> any thoughts on this series? I realize that this is somewhat suboptimal
> because we're effectively adding a duplicate of the existing IOCTL with
> only the "minor" extension of adding sync FDs/objects, but at the same
> time I don't have any good ideas on what else to add to make this more
> appealing or if you have any plans of your own to address this in the
> future.

drm core automatically zero-extends ioctl structs both ways, so if all you
do is add more stuff to the top level ioctl struct at the bottom, there's
no need to duplicate any code. At least as long as you guarantee that 0 ==
old behaviour for both in and out parameters.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
