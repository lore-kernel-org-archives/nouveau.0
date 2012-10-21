From: Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/bios: use size provided by _ROM
	method
Date: Sun, 21 Oct 2012 14:53:03 +0200
Message-ID: <450304285.kMiQM72imv@al>
References: <6085585.gbMWY34h3C@al> <20121021122005.GB22587@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20121021122005.GB22587-OI9uyE9O0yo@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sunday 21 October 2012 14:20:05 Marcin Slusarz wrote:
> BTW, _ROM method from https://lkml.org/lkml/2012/10/21/11 multiplies length
> by 8, so maybe we can read 32kB in one batch?
> 
> Marcin

That holds for that specific model, but it is not standard (in ACPI). Ben 
Skeggs has a laptop (Lenovo?) W530 that allows you to read the whole VBIOS in 
one call (that means chunk size > 4KiB), but there is another machine where 
this does not work (https://bugs.freedesktop.org/show_bug.cgi?id=55948). That 
machine allows you to read lengths of 4 KiB only (the buffer size is hard-coded 
to 4096, the upper bound of the returned size).

I'd say, stick to 4 KiB for the first read, then try to read the remaining 
VBIOS in one shot and finally fallback to reading in chunks of min(4096, bios-
>size - i). That should give a count of least 512 bytes. On my machine the 
length is 0x7d which translates to exactly 64 KB (not KiB).

After your patch in https://lkml.org/lkml/2012/10/20/150, "drm/nouveau/bios: 
attempt to fetch entire acpi rom image in one shot" could be improved to only 
read the unknown VBIOS:
 /* disobey the acpi spec - much faster on at least w530 ... */
- ret = nouveau_acpi_get_bios_chunk(bios->data, 0, bios->size);
+ ret = nouveau_acpi_get_bios_chunk(bios->data, 4096, bios->size - 4096);

Peter
