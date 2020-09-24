From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 0/6] drm/nouveau: Support sync FDs and sync
 objects
Date: Thu, 24 Sep 2020 13:16:42 +0200
Message-ID: <CAKMK7uEO6jLkwiLbvW1Xz6=z+TM6ahY6TXLNNC52GGyg9r5==Q@mail.gmail.com>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
 <20200923091853.GA1229032@ulmo> <20200923152124.GO438822@phenom.ffwll.local>
 <20200924100509.GD2483160@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200924100509.GD2483160@ulmo>
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
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Sep 24, 2020 at 12:05 PM Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Wed, Sep 23, 2020 at 05:21:24PM +0200, Daniel Vetter wrote:
> > On Wed, Sep 23, 2020 at 11:18:53AM +0200, Thierry Reding wrote:
> > > On Fri, Aug 28, 2020 at 12:40:10PM +0200, Thierry Reding wrote:
> > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > >
> > > > Hi,
> > > >
> > > > This series implements a new IOCTL to submit push buffers that can
> > > > optionally return a sync FD or sync object to userspace. This is useful
> > > > in cases where userspace wants to synchronize operations between the GPU
> > > > and another driver (such as KMS for display). Among other things this
> > > > allows extensions such as eglDupNativeFenceFDANDROID to be implemented.
> > > >
> > > > Note that patch 4 modifies the ABI introduced in patch 3 by allowing DRM
> > > > sync objects to be passed rather than only sync FDs. It also allows any
> > > > number of sync FDs/objects to be passed in or emitted. I think those are
> > > > useful features, but I left them in a separate patch in case everybody
> > > > else thinks that this won't be needed. If we decide to merge the new ABI
> > > > then patch 4 should be squashed into patch 3.
> > > >
> > > > The corresponding userspace changes can be found here:
> > > >
> > > >   libdrm: https://gitlab.freedesktop.org/tagr/drm/-/commits/nouveau-sync-fd-v2/
> > > >   mesa: https://gitlab.freedesktop.org/tagr/mesa/-/commits/nouveau-sync-fd/
> > > >
> > > > I've verified that this works with kmscube's --atomic mode and Weston.
> > >
> > > Hi Ben,
> > >
> > > any thoughts on this series? I realize that this is somewhat suboptimal
> > > because we're effectively adding a duplicate of the existing IOCTL with
> > > only the "minor" extension of adding sync FDs/objects, but at the same
> > > time I don't have any good ideas on what else to add to make this more
> > > appealing or if you have any plans of your own to address this in the
> > > future.
> >
> > drm core automatically zero-extends ioctl structs both ways, so if all you
> > do is add more stuff to the top level ioctl struct at the bottom, there's
> > no need to duplicate any code. At least as long as you guarantee that 0 ==
> > old behaviour for both in and out parameters.
>
> But that only works if the structure size remains fixed, right? In this
> case, however, we have to extend the structure with additional fields,
> so the size is going to change and therefore the IOCTL number will also
> change.

Nope, drm_ioctl() is pretty much magic, and will zero-extend size
mismatches in both ways. Which means you can run userspace compile
against old kernels (so user_sz > kernel_sz) and you can run old
userspace on new kernels (so user_sz < kernel_sz) and it will all work
correctly. No need to allocate new ioctl numbers for this case, just
extend at the bottom. We're doing this pretty much all the time.

You might still want a getparam (or explicit flag, if all versions of
that ioctl validated the flags correctly) since doing since a dummy
pushbuf on an old kernel won't result in anything getting rejected.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
