From: Jim Davis <jim.epost@gmail.com>
Subject: Re: [PATCH] drm/nouveau/hwmon: fix compilation without CONFIG_HWMON
Date: Wed, 27 Nov 2013 14:40:28 -0700
Message-ID: <CA+r1ZhhKKcJfKri2y7NV=EjNFS2Pw=1Rn4EZnb=-0m-bn63Ssw@mail.gmail.com>
References: <1385573922-16278-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1385573922-16278-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

2013/11/27 Ilia Mirkin <imirkin@alum.mit.edu>:
> Reported-by: Jim Davis <jim.epost@gmail.com>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> ---
>  drivers/gpu/drm/nouveau/nouveau_hwmon.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> index 38a4db5..4aff04f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -630,7 +630,6 @@ error:
>         hwmon->hwmon = NULL;
>         return ret;
>  #else
> -       hwmon->hwmon = NULL;
>         return 0;
>  #endif
>  }

I reran a configuration that had failed with that error with today's
linux-next, and with the change it worked just fine.  Tested-by:
jim.epost@gmail.com

Jim
