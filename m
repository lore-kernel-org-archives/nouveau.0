From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 2/2] gpu: drm: nouveau: Use list_{next/prev}_entry
 instead of list_entry
Date: Mon, 26 Mar 2018 16:11:50 +0200
Message-ID: <20180326141150.GU14155@phenom.ffwll.local>
References: <1522000893-5331-1-git-send-email-arushisinghal19971997@gmail.com>
 <1522000893-5331-3-git-send-email-arushisinghal19971997@gmail.com>
 <CABDvA=nFq6nPMyhB3C87XxVkxXwy23NQVES2Na_TVB6VreKrrQ@mail.gmail.com>
 <152206821005.4115.12768359647232399397@mail.alporthouse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <152206821005.4115.12768359647232399397@mail.alporthouse.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Ben Skeggs <bskeggs@redhat.com>, Arushi Singhal <arushisinghal19971997@gmail.com>, David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, daniel.vetter@intel.com
List-Id: nouveau.vger.kernel.org

On Mon, Mar 26, 2018 at 01:43:30PM +0100, Chris Wilson wrote:
> Quoting Ben Skeggs (2018-03-26 13:34:54)
> > On Mon, Mar 26, 2018 at 4:01 AM, Arushi Singhal
> > <arushisinghal19971997@gmail.com> wrote:
> > > It's better to use list_entry instead of list_{next/prev}_entry
> > > as it makes the code more clear to read.
> > > This patch replace list_entry with list_{next/prev}_entry.
> > >
> > > Signed-off-by: Arushi Singhal <arushisinghal19971997@gmail.com>
> > Acked-by: Ben Skeggs <bskeggs@redhat.com>

Applied, thanks for ack&patch.

> > 
> > > ---
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> > > index e4c8d31..81c3567 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> > > @@ -134,7 +134,7 @@ nvkm_cstate_find_best(struct nvkm_clk *clk, struct nvkm_pstate *pstate,
> > >                                nvkm_volt_map(volt, volt->max2_id, clk->temp));
> > >
> > >         for (cstate = start; &cstate->head != &pstate->list;
> > > -            cstate = list_entry(cstate->head.prev, typeof(*cstate), head)) {
> > > +            cstate = list_prev_entry(cstate, head)) {
> 
> This loop could be written as:
> 
> 	cstate = start; /* cstate looks redundant here, just use start? */
> 	list_for_each_entry_from_reverse(cstate, &pstate->list, head)

Yeah, sounds like a good follow-up patch.
-Daniel

> 
> > >                 if (nvkm_cstate_valid(clk, cstate, max_volt, clk->temp))
> > >                         break;
> > >         }
> > > --
> > > 2.7.4
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
