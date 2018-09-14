From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/secboot/acr: fix memory leak
Date: Fri, 14 Sep 2018 17:26:19 +1000
Message-ID: <CACAvsv4V6yJyB1yNaSR7OCHZztc5e3ZoPirz5NorE_Xy222RXA@mail.gmail.com>
References: <20180724132719.GA32237@embeddedor.com> <d9e87a82-f70f-3eca-5f63-2450863e7099@embeddedor.com>
 <f35a04a0-fa60-7905-96bf-36a0dfb055a8@nvidia.com> <CAGXu5jKd5SEabmr4sCW-=Oksi6WvO11tDB_9Un1fRYQAoq2h0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jKd5SEabmr4sCW-=Oksi6WvO11tDB_9Un1fRYQAoq2h0w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: keescook@chromium.org
Cc: Ben Skeggs <bskeggs@redhat.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Dave Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Fri, 14 Sep 2018 at 07:35, Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Sep 7, 2018 at 8:02 PM, John Hubbard <jhubbard@nvidia.com> wrote:
> > On 8/2/18 12:51 PM, Gustavo A. R. Silva wrote:
> >> Hi all,
> >>
> >> Friendly ping! Who can take this?
> >>
> >> Thanks
> >> --
> >> Gustavo
> >>
> >> On 07/24/2018 08:27 AM, Gustavo A. R. Silva wrote:
> >>> In case memory resources for *bl_desc* were allocated, release
> >>> them before return.
> >>>
> >>> Addresses-Coverity-ID: 1472021 ("Resource leak")
> >>> Fixes: 0d466901552a ("drm/nouveau/secboot/acr: Remove VLA usage")
> >>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> >>> ---
> >>>  drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
> >>> index d02e183..5c14d6a 100644
> >>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
> >>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
> >>> @@ -801,6 +801,7 @@ acr_r352_load(struct nvkm_acr *_acr, struct nvkm_falcon *falcon,
> >>>              bl = acr->hsbl_unload_blob;
> >>>      } else {
> >>>              nvkm_error(_acr->subdev, "invalid secure boot blob!\n");
> >>> +            kfree(bl_desc);
> >>>              return -EINVAL;
> >>>      }
> >>>
> >>>
> >
> > Hi Gustavo,
> >
> > Seeing as how I've been working on this corner of Nouveau lately (don't ask, haha),
> > I reviewed and also tested this. It looks good, you can add:
> >
> > Reviewed-by: John Hubbard <jhubbard@nvidia.com>
>
> Ben can you take this?
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
I've got it in my tree.  Thanks!

>
> -Kees
>
> --
> Kees Cook
> Pixel Security
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
