From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: properly handle pushbuffer check
	failures
Date: Mon, 7 Mar 2011 18:10:13 +0000
Message-ID: <AANLkTin4oJda-wB4b6X9B+En3EXX6wHXQdVg=o_qX0zA@mail.gmail.com>
References: <20110307113135.GA2788@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110307113135.GA2788-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 7, 2011 at 11:31 AM, Marcin Slusarz
<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> When "buffer in list" check does not pass, don't free validation lists - =
they were
> not initialized yet.
>
> Fixes this oops:
>
> [drm] nouveau 0000:02:00.0: push 105 buffer not in list
> BUG: unable to handle kernel NULL pointer dereference at 000000000000057c
> IP: [<ffffffff81236aa4>] do_raw_spin_lock+0x14/0x13c
> PGD 1ac6cb067 PUD 1aaa52067 PMD 0
> CPU 0
> Modules linked in: nouveau ttm drm_kms_helper snd_hda_codec_realtek snd_h=
da_intel snd_hda_codec
>
> Pid: 6265, comm: OilRush_x86 Not tainted 2.6.38-rc6-nv+ #632 System manuf=
acturer System Product Name/P6T SE
> RIP: 0010:[<ffffffff81236aa4>] =A0[<ffffffff81236aa4>] do_raw_spin_lock+0=
x14/0x13c
> (...)
> Process OilRush_x86 (pid: 6265, threadinfo ffff8801a6aee000, task ffff880=
1a26c0000)
> =A00000000000000000 ffff8801ac74c618 0000000000000000 0000000000000578
> =A00000000000000000 ffff8801ac74c618 0000000000000000 ffff8801bd9d0000
> =A0[<ffffffff81417f78>] _raw_spin_lock+0x1e/0x22
> =A0[<ffffffffa00a2746>] nouveau_bo_fence+0x2e/0x60 [nouveau]
> =A0[<ffffffffa00a540b>] validate_fini_list+0x35/0xeb [nouveau]
> =A0[<ffffffffa00a54d3>] validate_fini+0x12/0x31 [nouveau]
> =A0[<ffffffffa00a6386>] nouveau_gem_ioctl_pushbuf+0xe94/0xf6b [nouveau]
> =A0[<ffffffff8141ac56>] ? sub_preempt_count+0x9e/0xb2
> =A0[<ffffffff81417e94>] ? _raw_spin_unlock_irqrestore+0x30/0x4d
> =A0[<ffffffff8105dea2>] ? __wake_up+0x3f/0x48
> =A0[<ffffffff812aebb4>] drm_ioctl+0x289/0x361
> =A0[<ffffffff8141ac56>] ? sub_preempt_count+0x9e/0xb2
> =A0[<ffffffffa00a54f2>] ? nouveau_gem_ioctl_pushbuf+0x0/0xf6b [nouveau]
> =A0[<ffffffff8141ac56>] ? sub_preempt_count+0x9e/0xb2
> =A0[<ffffffffa010caa2>] nouveau_compat_ioctl+0x16/0x1c [nouveau]
> =A0[<ffffffff81142c0d>] compat_sys_ioctl+0x1c8/0x12d7
> =A0[<ffffffff814179ca>] ? trace_hardirqs_off_thunk+0x3a/0x6c
> =A0[<ffffffff81058099>] sysenter_dispatch+0x7/0x30
> =A0[<ffffffff8141798e>] ? trace_hardirqs_on_thunk+0x3a/0x3c
> RIP =A0[<ffffffff81236aa4>] do_raw_spin_lock+0x14/0x13c
> =A0RSP <ffff8801a6aefb88>
> ---[ end trace 0014d5d93e6147e1 ]---
>
> Additionally, don't call validate_fini twice in case of validation failur=
e.
>
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0drivers/gpu/drm/nouveau/nouveau_gem.c | =A0 =A06 ++++--
> =A01 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouv=
eau/nouveau_gem.c
> index 3ce58d2..e8b04f4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -600,7 +600,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, voi=
d *data,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (push[i].bo_index >=3D req->nr_buffers)=
 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV_ERROR(dev, "push %d buf=
fer not in list\n", i);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_prevalid;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bo[push[i].bo_index].read_domains |=3D (1 =
<< 31);
> @@ -612,7 +612,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, voi=
d *data,
> =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret !=3D -ERESTARTSYS)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV_ERROR(dev, "validate: %=
d\n", ret);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_prevalid;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* Apply any relocations that are required */
> @@ -705,6 +705,8 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, voi=
d *data,
> =A0out:
> =A0 =A0 =A0 =A0validate_fini(&op, fence);
> =A0 =A0 =A0 =A0nouveau_fence_unref(&fence);
> +
> +out_prevalid:
> =A0 =A0 =A0 =A0kfree(bo);
> =A0 =A0 =A0 =A0kfree(push);
>
> --
> 1.7.4.rc3
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

This seems a simple fix, so i pushed it.

-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
