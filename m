From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/mmu: fix odd_ptr_err.cocci warnings
Date: Wed, 6 Dec 2017 11:02:00 +0100
Message-ID: <CACO55tvtihGO8PatjshOo7JBqo1WHFFFgO07TVu5261c1aeB_w@mail.gmail.com>
References: <20171130195354.14135-1-christoph@boehmwalder.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171130195354.14135-1-christoph@boehmwalder.at>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph@boehmwalder.at>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Thu, Nov 30, 2017 at 8:53 PM, Christoph Böhmwalder
<christoph@boehmwalder.at> wrote:
> The kbuild test bot complained about a new coccinelle warning nearby,
> which sparked a discussion about the assignment to 'memory' inside of
> the conditional expression.  See Link below for the original post.
>
> Fix the assignment to silence the coccinelle warning and also make the
> code look a little nicer.
>
> Link: https://lists.freedesktop.org/archives/nouveau/2017-November/029242.html
> Signed-off-by: Christoph Böhmwalder <christoph@boehmwalder.at>
> ---
>  drm/nouveau/nvkm/subdev/mmu/uvmm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drm/nouveau/nvkm/subdev/mmu/uvmm.c
> index fa81d0c1..37b201b9 100644
> --- a/drm/nouveau/nvkm/subdev/mmu/uvmm.c
> +++ b/drm/nouveau/nvkm/subdev/mmu/uvmm.c
> @@ -106,7 +106,8 @@ nvkm_uvmm_mthd_map(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
>         } else
>                 return ret;
>
> -       if (IS_ERR((memory = nvkm_umem_search(client, handle)))) {
> +       memory = nvkm_umem_search(client, handle);
> +       if (IS_ERR(memory)) {
>                 VMM_DEBUG(vmm, "memory %016llx %ld\n", handle, PTR_ERR(memory));
>                 return PTR_ERR(memory);
>         }
> --
> 2.13.6
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
