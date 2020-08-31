From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau PUSHBUFFER_ERR on 5.9.0-rc2-next-20200824
Date: Mon, 31 Aug 2020 14:30:42 +1000
Message-ID: <CACAvsv6zUi=3mZTg11Y_6CVYkpCSO0RY-5+GiBZz+2EXCDmD-g@mail.gmail.com>
References: <CAJ1xhMUpqtKMuGUZdComskTqd0oOKCfDuVQT3+c13u=NSJLkBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAJ1xhMUpqtKMuGUZdComskTqd0oOKCfDuVQT3+c13u=NSJLkBw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexander Kapshuk <alexander.kapshuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux-Next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, 25 Aug 2020 at 17:21, Alexander Kapshuk
<alexander.kapshuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Since upgrading to linux-next based on 5.9.0-rc1 and 5.9.0-rc2 I have
> had my mouse pointer disappear soon after logging in, and I have
> observed the system freezing temporarily when clicking on objects and
> when typing text.
> I have also found records of push buffer errors in dmesg output:
> [ 6625.450394] nouveau 0000:01:00.0: disp: ERROR 1 [PUSHBUFFER_ERR] 02
> [] chid 0 mthd 0000 data 00000400
Hey,

Yeah, I'm aware of this.  Lyude and I have both seen it, but it's been
very painful to track down to what's actually causing it so far.  It
likely is the commit you mentioned that's at fault, and I'm still
working to find a proper solution before I revert it.

Ben.

>
> I tried setting CONFIG_NOUVEAU_DEBUG=5 (tracing) to try and collect
> further debug info, but nothing caught the eye.
>
> The error message in question comes from nv50_disp_intr_error in
> drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:613,645.
> And nv50_disp_intr_error is called from nv50_disp_intr in the
> following while block:
> drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:647,658
> void
> nv50_disp_intr(struct nv50_disp *disp)
> {
>         struct nvkm_device *device = disp->base.engine.subdev.device;
>         u32 intr0 = nvkm_rd32(device, 0x610020);
>         u32 intr1 = nvkm_rd32(device, 0x610024);
>
>         while (intr0 & 0x001f0000) {
>                 u32 chid = __ffs(intr0 & 0x001f0000) - 16;
>                 nv50_disp_intr_error(disp, chid);
>                 intr0 &= ~(0x00010000 << chid);
>         }
> ...
> }
>
> Could this be in any way related to this series of commits?
> commit 0a96099691c8cd1ac0744ef30b6846869dc2b566
> Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date:   Tue Jul 21 11:34:07 2020 +1000
>
>     drm/nouveau/kms/nv50-: implement proper push buffer control logic
>
>     We had a, what was supposed to be temporary, hack in the KMS code where we'd
>     completely drain an EVO/NVD channel's push buffer when wrapping to the start
>     again, instead of treating it as a ring buffer.
>
>     Let's fix that, finally.
>
>     Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> Here are my GPU details:
> 01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce
> 210] (rev a1)
>         Subsystem: Micro-Star International Co., Ltd. [MSI] Device 8a93
>         Kernel driver in use: nouveau
>
> The last linux-next kernel I built where the problem reported does not
> manifest itself is 5.8.0-rc6-next-20200720.
>
> I would appreciate being given any pointers on how to further debug this.
> Or is git bisect the only way to proceed with this?
>
> Thanks.
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
