From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: Do not use nva3 engine for 0xaf chipset
Date: Sun, 5 Aug 2012 12:50:57 +1000
Message-ID: <20120805025057.GA10386@turiel.redhat.com>
References: <1344060045-784-1-git-send-email-rydberg@euromail.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1344060045-784-1-git-send-email-rydberg@euromail.se>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Henrik Rydberg <rydberg@euromail.se>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Sat, Aug 04, 2012 at 08:00:45AM +0200, Henrik Rydberg wrote:
> The nva3 copy engine exhibits random memory corruption in at least one
> case, the GeForce 320M (nv50, 0xaf) in the MacBookAir3,1.  This patch
> omits creating the engine for the specific chipset, falling back to
> M2MF, which kills the symptoms.
I've pushed this (with slightly modified commit message) to nouveau git.

I'll get it to Linus' tree in a future -fixes merge.

Thanks,
Ben.

> 
> Signed-off-by: Henrik Rydberg <rydberg@euromail.se>
> ---
> Hi Ben,
> 
> this patch is still needed in 3.6-rc1, so perhaps we should apply it
> after all. I have been running it without problems for a long time
> now.
> 
> Thanks,
> Henrik
> 
>  drivers/gpu/drm/nouveau/nouveau_state.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
> index 1cdfd6e..1866dbb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_state.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_state.c
> @@ -731,7 +731,6 @@ nouveau_card_init(struct drm_device *dev)
>  			case 0xa3:
>  			case 0xa5:
>  			case 0xa8:
> -			case 0xaf:
>  				nva3_copy_create(dev);
>  				break;
>  			}
> -- 
> 1.7.11.4
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
