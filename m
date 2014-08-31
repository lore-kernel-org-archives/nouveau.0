From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH envytools] nvbios: Add missing null byte to
 string read from file.
Date: Sun, 31 Aug 2014 15:16:15 +0200
Message-ID: <5403201F.7030609@free.fr>
References: <1409490042-8725-1-git-send-email-titan.costa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1409490042-8725-1-git-send-email-titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On 31/08/2014 15:00, Christian Costa wrote:
> ---
>   nvbios/nvbios.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/nvbios/nvbios.c b/nvbios/nvbios.c
> index f7aafe3..28e62ad 100644
> --- a/nvbios/nvbios.c
> +++ b/nvbios/nvbios.c
> @@ -774,11 +774,12 @@ int set_strap_from_string(const char* strap_s)
>   int set_strap_from_file(const char *path)
>   {
>   	FILE *strapfile = NULL;
> -	char tmp[21];
> +	char tmp[22];
>   
>   	strapfile = fopen(path, "r");
>   	if (strapfile) {
> -		fread(tmp, 1, 21, strapfile);
> +		size_t size = fread(tmp, 1, 21, strapfile);
> +		tmp[size] = 0;
>   		return set_strap_from_string(tmp);
>   	}
>   
Thanks, I pushed the first 3 patches!
