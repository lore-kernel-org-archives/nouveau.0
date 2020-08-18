From: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [i-g-t, v3,
 4/5] lib/igt_kms: Hook up connector dithering prop
Date: Tue, 18 Aug 2020 17:18:27 -0400
Message-ID: <20200818211827.GB53828@dev.jcline.org>
References: <20200417211025.109574-5-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200417211025.109574-5-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: igt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

On Fri, Apr 17, 2020 at 05:10:24PM -0400, Lyude wrote:
> From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> Nvidia display hardware provides a set of flexible dithering options for
> CRTCs. This dithering is actually noticeable in the CRC output for all
> available tap points, and can be seen as CRC values for identical frames
> cycling between either 2 or 4 values repeatedly (each one of these
> values is a different dithering phase applied to the source output). Of
> course, this is very likely to break tests using CRC readback since we
> don't expect the CRC to change if the source content hasn't changed.
> 
> So, hook up support for configuring the dithering property and reset it
> to off from igt_display_reset() when applicable.
> 
> Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---

I'm not in a position to speak to the correctness of the change, but
from a pure code point of view it looks good to me, so for whatever it's
worth:

Reviewed-by: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

>  lib/igt_kms.c | 6 ++++++
>  lib/igt_kms.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e9621e7e..d45adfaf 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -421,6 +421,7 @@ const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
>  	[IGT_CONNECTOR_LINK_STATUS] = "link-status",
>  	[IGT_CONNECTOR_MAX_BPC] = "max bpc",
>  	[IGT_CONNECTOR_HDR_OUTPUT_METADATA] = "HDR_OUTPUT_METADATA",
> +	[IGT_CONNECTOR_DITHERING_MODE] = "dithering mode",
>  };
>  
>  /*
> @@ -1802,6 +1803,10 @@ static void igt_output_reset(igt_output_t *output)
>  	if (igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA))
>  		igt_output_set_prop_value(output,
>  					  IGT_CONNECTOR_HDR_OUTPUT_METADATA, 0);
> +
> +	if (igt_output_has_prop(output, IGT_CONNECTOR_DITHERING_MODE))
> +		igt_output_set_prop_enum(output, IGT_CONNECTOR_DITHERING_MODE,
> +					 "off");
>  }
>  
>  /**
> @@ -1816,6 +1821,7 @@ static void igt_output_reset(igt_output_t *output)
>   * - %IGT_CONNECTOR_BROADCAST_RGB (if applicable)
>   *   %IGT_CONNECTOR_CONTENT_PROTECTION (if applicable)
>   *   %IGT_CONNECTOR_HDR_OUTPUT_METADATA (if applicable)
> + * - %IGT_CONNECTOR_DITHERING_MODE (if applicable)
>   * - igt_output_override_mode() to default.
>   *
>   * For pipes:
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index adca59ac..4899e765 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -127,6 +127,7 @@ enum igt_atomic_connector_properties {
>         IGT_CONNECTOR_LINK_STATUS,
>         IGT_CONNECTOR_MAX_BPC,
>         IGT_CONNECTOR_HDR_OUTPUT_METADATA,
> +       IGT_CONNECTOR_DITHERING_MODE,
>         IGT_NUM_CONNECTOR_PROPS
>  };
>  
