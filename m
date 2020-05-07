From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: GeForce(R) GT 710 1GB PCIE x 1 on arm64
Date: Thu, 7 May 2020 09:56:40 -0400
Message-ID: <CAKb7UvjUGjKTw8izw2=1P8fRbmMWmrH0m5yFRyL9Q0+D18V0bQ@mail.gmail.com>
References: <CAKb7UvhNDFKHkOV8p0v8cVHf7cMadNLVKi0iD_mCZnH_j5=2OA@mail.gmail.com>
 <CAFCWPP+WmbjM0O2T9ODi-iVU1qGXjpk9V9LeE9PsuT7t+APLQA@mail.gmail.com>
 <CAKb7Uvj6nMk2U6MD-iMXEWQzc4ok2xxuq7K3C8ti6mfFDqhuDw@mail.gmail.com>
 <e681b4315b596dca39bb4a28866d509e23a150c1.camel@lynxeye.de>
 <CAKb7Uvh8dvVTVbu15e2=7qb4dgoVbigrnjkYW6i7z5dsk4g3qQ@mail.gmail.com>
 <CAKb7UvjZ87wJ4niA0k3AcELC44CcwLYd00NtxE5hTEk6LBPdMQ@mail.gmail.com>
 <20200506211015.GA473@ishi>
 <CAKb7Uvi6g5Y3d9tqz4=JFoyQ3hk169konLaW_UVfNGnZ-oisQg@mail.gmail.com>
 <20200506215859.GA7599@ishi>
 <CAKb7UvioQ5P-vCKPB-aHqbyV58qDvTUeHQeJYnFZkWQfJXgshg@mail.gmail.com>
 <20200507041147.GA455@ishi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200507041147.GA455@ishi>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Milan Buska <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, May 7, 2020 at 12:11 AM Milan Buska <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On 20-05-06 18:53:00, Ilia Mirkin wrote:
> > On Wed, May 6, 2020 at 5:59 PM Milan Buska <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >
> > > On 20-05-06 17:12:44, Ilia Mirkin wrote:
> > > > You need both VRAM *and* UNCACHED. Separate them with a |
> > > >
> > > > On Wed, May 6, 2020 at 5:10 PM Milan Buska <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > > >
> > > > > On 20-05-06 11:51:35, Ilia Mirkin wrote:
> > > > > > On Wed, May 6, 2020 at 10:42 AM Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> > > > > > > On Wed, May 6, 2020 at 10:39 AM Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> wrote:
> > > > > > > > > > [   17.146929] nouveau 0000:01:00.0: DRM: core notifier timeout
> > > > > > > > > > [   19.146846] nouveau 0000:01:00.0: DRM: base-0: timeout
> > > > > > > > > > [   19.147554] Console: switching to colour frame buffer device 240x67
> > > > > > > > > > [   19.446311] nouveau 0000:01:00.0: DRM: GPU lockup - switching to software fbcon
> > > > > > > > > > [   19.501043] nouveau 0000:01:00.0: fb0: nouveaudrmfb frame buffer device
> > > > > > > > > > [   19.523471] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
> > > > > > > > >
> > > > > > > > > So that "core notifier timeout" and subsequent GPU lockup indicate
> > > > > > > > > that something's amiss. Most of the initialization was able to be
> > > > > > > > > completed, including reading EDID from your monitor (hence the
> > > > > > > > > non-default resolution), but we're not seeing values change properly /
> > > > > > > > > missing notifications. I'm actually wondering if we aren't
> > > > > > > > > initializing the GPU because we think it's already initialized. Could
> > > > > > > > > you boot with nouveau.config=NvForcePost=1 and see if that helps?
> > > > > > > >
> > > > > > > > Note that PCIe is non-coherent on most ARM devices (including Tegra TX2
> > > > > > > > IIRC), so if the notifier BO isn't mapped as uncached memory, you
> > > > > > > > probably won't see the expected notifier content, as you are reading
> > > > > > > > stale cache line content.
> > > > > > >
> > > > > > > I *believe* that as part of getting nouveau working with the Tegra
> > > > > > > in-SoC GPU, at least the fence logic was adjusted. However perhaps we
> > > > > > > didn't do it for notifier memory... worth checking.
> > > > > >
> > > > > > Hm, looks like we should be passing in TTM_PL_FLAG_UNCACHED for the
> > > > > > notifier, which should cause nouveau_bo to do the right thing (by
> > > > > > setting force_coherent=true in this environment):
> > > > > >
> > > > > > ret = nouveau_bo_new(&drm->client, 4096, 0x1000, TTM_PL_FLAG_VRAM,
> > > > > >      0, 0x0000, NULL, NULL, &disp->sync);
> > > > > >
> > > > > > Milan - can you try changing that line in
> > > > > >
> > > > > > drivers/gpu/drm/nouveau/dispnv50/disp.c::nv50_display_create
> > > > > >
> > > > > > to have TTM_PL_FLAG_VRAM | TTM_PL_FLAG_UNCACHED instead for that
> > > > > > nouveau_bo_new call (no need to change the later nouveau_bo_pin call)?
> > > > > >
> > > > > > Cheers,
> > > > > >
> > > > > >   -ilia
> > > > > >
> > > > >
> > > > >         /* small shared memory area we use for notifiers and semaphores */
> > >             ret = nouveau_bo_new(&drm->client, 4096, 0x1000, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_UNCACHED,
> > >
> > > it is OK
> >
> > What do you mean by that? You're testing it, or that fixed it?
> >
> It's the same

Oh well, it was worth a shot. Someone will have to debug what's going on.

  -ilia
