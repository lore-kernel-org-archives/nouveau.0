From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] kms: Let the server know if we got more than
	1 EDID block
Date: Sun, 11 Nov 2012 20:09:08 +0000
Message-ID: <50A005E4.10808@gmail.com>
References: <1352052378-23970-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1352052378-23970-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 04/11/12 18:06, Emil Velikov wrote:
> Verbatim copy from xf86-video-radeon commit 809cacb
> 
> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=32341
> Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  src/drmmode_display.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/src/drmmode_display.c b/src/drmmode_display.c
> index 803785d..8ec69f5 100644
> --- a/src/drmmode_display.c
> +++ b/src/drmmode_display.c
> @@ -640,9 +640,12 @@ drmmode_output_get_modes(xf86OutputPtr output)
>  		drmModeFreeProperty(props);
>  	}
>  
> -	if (drmmode_output->edid_blob)
> +	if (drmmode_output->edid_blob) {
>  		ddc_mon = xf86InterpretEDID(output->scrn->scrnIndex,
>  					    drmmode_output->edid_blob->data);
> +		if (ddc_mon && drmmode_output->edid_blob->length > 128)
> +			ddc_mon->flags |= MONITOR_EDID_COMPLETE_RAWDATA;
> +	}
>  	xf86OutputSetEDID(output, ddc_mon);
>  
>  	/* modes should already be available */
> 
ping
