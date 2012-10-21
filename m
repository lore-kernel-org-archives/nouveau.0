From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/bios: use size provided by _ROM
 method
Date: Sun, 21 Oct 2012 14:20:05 +0200
Message-ID: <20121021122005.GB22587@joi.lan>
References: <6085585.gbMWY34h3C@al>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6085585.gbMWY34h3C@al>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, Oct 21, 2012 at 12:53:15PM +0200, Lekensteyn wrote:
> From: Peter Wu <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Since commit "drm/nouveau/bios: attempt to fetch entire acpi rom image in one
> shot", the ACPI spec is broken in order to gain speed. In theory, since the
> _ROM method is supposed to return 4 KiB only, the returned buffer size could be
> less than the requested length. This could lead to reading past the buffer
> boundaries which could make worse thing happen. To fix that, do not read more
> than the buffer contains. As an extra side-effect, the function returns the
> bytes that have really been read which is more natural.
> 
> Signed-off-by: Peter Wu <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_acpi.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> index 48783e1..368e45c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> @@ -356,6 +356,7 @@ static int nouveau_rom_call(acpi_handle rom_handle, uint8_t *bios,
>  		return -ENODEV;
>  	}
>  	obj = (union acpi_object *)buffer.pointer;
> +	len = min(len, (int)obj->buffer.size);
>  	memcpy(bios+offset, obj->buffer.pointer, len);
>  	kfree(buffer.pointer);
>  	return len;
> -- 

BTW, _ROM method from https://lkml.org/lkml/2012/10/21/11 multiplies length
by 8, so maybe we can read 32kB in one batch?

Marcin
