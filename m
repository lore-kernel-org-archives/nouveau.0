From: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
Subject: Re: [PATCH 4/4] nvfx: random cleanups of the state
 validation code
Date: Tue, 17 Jan 2012 18:22:59 +0100
Message-ID: <20120117182259.cc64f260.mandin.patrice@orange.fr>
References: <1326195664-28384-1-git-send-email-dev@lynxeye.de>
	<1326195664-28384-5-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1326195664-28384-5-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Le Tue, 10 Jan 2012 12:41:04 +0100
Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> a =E9crit:

> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
>  src/gallium/drivers/nvfx/nvfx_state_emit.c |   49 ++++++++++++----------=
-----
>  1 files changed, 22 insertions(+), 27 deletions(-)
> =

> diff --git a/src/gallium/drivers/nvfx/nvfx_state_emit.c b/src/gallium/dri=
vers/nvfx/nvfx_state_emit.c
> index e2cfb76..a959015 100644
[snip]
> @@ -302,11 +303,7 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
>  	if(dirty & NVFX_NEW_SR)
>  		nvfx_state_sr_validate(nvfx);
>  =

> -/* All these dependencies are wrong, but otherwise
> -   etracer, neverball, foobillard, glest totally misrender
> -   TODO: find the right fix
> -*/
> -	if(dirty & (NVFX_NEW_VIEWPORT | NVFX_NEW_RAST | NVFX_NEW_ZSA))
> +	if(dirty & NVFX_NEW_VIEWPORT)
>  	{
>  		nvfx_state_viewport_validate(nvfx);
>  	}
[snip]

After a small revert/compile/try, reverting just that part makes
rendering working again in ut2004demo.

I noticed another small regressing with it, the splashscreen bitmap is
also not displayed anymore, so I'll investigate a bit further. Maybe no
need to revert the whole series.

-- =

Patrice Mandin
WWW: http://pmandin.atari.org/
Programmeur Linux, Atari
Sp=E9cialit=E9: D=E9veloppement, jeux

"who writes the code, decides"
