From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
Date: Wed, 13 May 2020 10:27:30 +0100
Message-ID: <CACvgo53k72T+-WUHr2XEwcgMFh-JonQME-He5Pc6hfOk3pr+7A@mail.gmail.com>
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <1f7b3774-8724-7653-3481-9429ae991acc@suse.de>
 <CADnq5_OnoH3YhhEjD7eOrBPPqxQZ+S1cKWRBaUMVnA0V=E0i+Q@mail.gmail.com>
 <1706b8de-bf4a-e9e1-2163-e782d1c2cc19@suse.de>
 <CADnq5_P6sWt=0zkRm6ySmOb1zr-7VTwLwx+ecEKg-ntJTRfY5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CADnq5_P6sWt=0zkRm6ySmOb1zr-7VTwLwx+ecEKg-ntJTRfY5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, 12 May 2020 at 20:48, Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> > >>
> > >> There's some AGP support code in the DRM core. Can some of that declared
> > >> as legacy?
> > >>
> > >> Specifically, what about these AGP-related ioctl calls? Can they be
> > >> declared as legacy? It would appear to me that KMS-based drivers don't
> > >> have to manage AGP by themselves. (?)
> > >
> > > The old drm core AGP code is mainly (only?) for the non-KMS drivers.
> > > E.g., mach64, r128, sis, savage, etc.
> >
> > Exactly my point. There's one drm_agp_init() call left in radeon. The
> > rest of the AGP code is apparently for legacy non-KMS drivers. Should
> > the related ioctl calls be declared as legacy (i.e., listed with
> > DRM_LEGACY_IOCTL_DEF instead of DRM_IOCTL_DEF)? If so, much of the AGP
> > core code could probably be moved behind CONFIG_DRM_LEGACY as well.
>
> Ah, I forgot about drm_agp_init().  I was just thinking the other AGP
> stuff.  Yeah, I think we could make it legacy.
>
Fwiw I've got local patches a) removing drm_agp_init() from radeon and
b) making the core drm code legacy only.
Will try to finish them over the weekend and send out.

Even if AGP GART gets dropped the b) patches will be good ;-)

-Emil
