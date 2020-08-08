From: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Subject: Re: [Nouveau] [PATCH 1/4] drm: retrieve EDID via ACPI _DDC method
Date: Sun, 9 Aug 2020 00:11:14 +0200
Message-ID: <20200808221114.5rfnys76ozoj62wv@wunner.de>
References: <20200727205357.27839-1-ddadap@nvidia.com>
 <20200727205357.27839-2-ddadap@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200727205357.27839-2-ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Dadap <ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: david1.zhou-5C7GfCeVMHo@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9/egYHeGw8Jk@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9/egYHeGw8Jk@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Jul 27, 2020 at 03:53:54PM -0500, Daniel Dadap wrote:
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -34,6 +34,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/vga_switcheroo.h>
> +#include <linux/pci.h>

Nit: Alphabetic ordering.

> +static u64 *get_dod_entries(acpi_handle handle, int *count)
> +{
> +	acpi_status status;
> +	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *dod;
> +	int i;
> +	u64 *ret = NULL;

Nits: Reverse christmas tree.
"ret" is a poor name, I'd suggest "entries" or something like that.
The spec says that _DOD is a list of 32-bit values, not 64-bit.

> +	status = acpi_evaluate_object(handle, "_DOD", NULL, &buf);
> +
> +	if (ACPI_FAILURE(status))
> +		return NULL;

Nit: No blank line between function invocation and error check.

> +	dod = buf.pointer;
> +
> +	if (dod == NULL || dod->type != ACPI_TYPE_PACKAGE)
> +		goto done;

Same.

> +	ret = kmalloc_array(dod->package.count, sizeof(*ret), GFP_KERNEL);
> +	if (ret == NULL)
> +		goto done;

Nit: Usually we use "if (!ret)" or "if (ret)".

> +	list_for_each_safe(node, next, &device->children) {

No, that's not safe because the ACPI namespace may change concurrently,
e.g. because a DSDT patch is applied by the user via sysfs.
Use acpi_walk_namespace() with a depth of 1 instead.

> +		for (i = 0; i < num_dod_entries; i++) {
> +			if (adr == dod_entries[i]) {
> +				ret = do_acpi_ddc(child->handle);
> +
> +				if (ret != NULL)
> +					goto done;

I guess ideally we'd want to correlate the display objects with
drm_connectors or at least constrain the search to Display Type
"Internal/Integrated Digital Flat Panel" instead of picking the
first EDID found.  Otherwise we might erroneously use the DDC
for an externally attached display.

> +struct edid *drm_get_edid_acpi(void)
> +{
> +#if defined(CONFIG_ACPI) && defined(CONFIG_PCI)

No, put an empty inline stub in the header file instead of using #ifdef, see:

https://www.kernel.org/doc/html/latest/process/coding-style.html#conditional-compilation

Patches 2, 3 and 4 need a "drm/" prefix in the Subject, e.g.
"drm/i915: ".

Please cc all ACPI-related patches to linux-acpi.

Thanks,

Lukas
