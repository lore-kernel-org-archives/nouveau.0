From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH envytools] Fix range end to the last value of
 timing table.
Date: Thu, 28 Aug 2014 10:27:52 +0200
Message-ID: <53FEE808.3020807@free.fr>
References: <1408993207-19530-1-git-send-email-titan.costa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1408993207-19530-1-git-send-email-titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 25/08/2014 21:00, Christian Costa wrote:
> ---
>   nva/set_timings.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/nva/set_timings.c b/nva/set_timings.c
> index 7376486..985a707 100644
> --- a/nva/set_timings.c
> +++ b/nva/set_timings.c
> @@ -506,7 +506,7 @@ shallow_dump(struct nvamemtiming_conf *conf)
>   	if (conf->range.start == (unsigned char) -1)
>   		conf->range.start = 0;
>   	if (conf->range.end == (unsigned char) -1)
> -		conf->range.end = conf->vbios.timing_entry_length;
> +		conf->range.end = conf->vbios.timing_entry_length-1;
>   
>   	fprintf(stderr, "Shallow mode: Will iterate between %i and %i\n", conf->range.start, conf->range.end);
>   
Hey

I don't like this patch because it would create an output difference 
between the deep and the shallow test.
Please check and propose another patch.

What are you trying to fix by the way? You don't like that range.end is 
not included?
