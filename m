From: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] drm/nouveau/nvif: remove const attribute from nvif_mclass
Date: Fri, 15 Jun 2018 15:58:23 -0700
Message-ID: <CAKwvOd=ntzV5x+rDSH6VEoS2ONZacnqeemewNgv3Aotm3Hd-hA@mail.gmail.com>
References: <20180615225606.185324-1-ndesaulniers@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180615225606.185324-1-ndesaulniers@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie
Cc: Matthias Kaehlcke <mka@chromium.org>, Jessica Yu <jeyu@kernel.org>, Philippe Ombredanne <pombredanne@nexb.com>, Thomas Gleixner <tglx@linutronix.de>, Greg KH <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jun 15, 2018 at 3:56 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Similar to commit 0bf8bf50eddc ("module: Remove
> const attribute from alias for MODULE_DEVICE_TABLE")
>
> Fixes many -Wduplicate-decl-specifier warnings due to the combination of
> const typeof() of already const variables.
>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvif/object.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
> index a2d5244ff2b7..7f188f66931e 100644
> --- a/drivers/gpu/drm/nouveau/include/nvif/object.h
> +++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
> @@ -78,7 +78,7 @@ struct nvif_mclass {
>  #define nvif_mclass(o,m) ({                                                    \
>         struct nvif_object *object = (o);                                      \
>         struct nvif_sclass *sclass;                                            \
> -       const typeof(m[0]) *mclass = (m);                                      \
> +       typeof(m[0]) *mclass = (m);                                      \

Sorry, this messes up the spaces at the end, will send a v2.

>         int ret = -ENODEV;                                                     \
>         int cnt, i, j;                                                         \
>                                                                                 \
> --
> 2.18.0.rc1.244.gcf134e6275-goog
>

-- 
Thanks,
~Nick Desaulniers
