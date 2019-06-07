From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] drm/nouveau/svm: Convert to use hmm_range_fault()
Date: Sat, 8 Jun 2019 00:14:50 +0530
Message-ID: <CAFqt6zYmL2P9w0Z4yfPtB=ftiy-H6-_beYsXJq-nD9T5OAw6Dg@mail.gmail.com>
References: <1558378918-25279-1-git-send-email-jrdr.linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558378918-25279-1-git-send-email-jrdr.linux@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, jasojgg@ziepe.ca
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Hi Jason,

On Tue, May 21, 2019 at 12:27 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> Convert to use hmm_range_fault().
>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>

Would you like to take it through your new hmm tree or do I
need to resend it ?

> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index 93ed43c..8d56bd6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -649,7 +649,7 @@ struct nouveau_svmm {
>                 range.values = nouveau_svm_pfn_values;
>                 range.pfn_shift = NVIF_VMM_PFNMAP_V0_ADDR_SHIFT;
>  again:
> -               ret = hmm_vma_fault(&range, true);
> +               ret = hmm_range_fault(&range, true);
>                 if (ret == 0) {
>                         mutex_lock(&svmm->mutex);
>                         if (!hmm_vma_range_done(&range)) {
> --
> 1.9.1
>
