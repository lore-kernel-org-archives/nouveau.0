From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nv50: wire up pll_calc hook
Date: Thu, 11 Oct 2012 19:36:02 +0200
Message-ID: <20121011173602.GA4053@joi.lan>
References: <1349650171-25045-1-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1349650171-25045-1-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Oct 08, 2012 at 12:49:27AM +0200, Marcin Slusarz wrote:
> Fixes crash during reclocking.
> Call Trace:
>  pll_calc == NULL
>  calc_pll
>  calc_mclk
>  nv50_pm_clocks_pre
>  nouveau_pm_perflvl_set
>  nouveau_pm_trigger
>  nouveau_pm_profile_set
>  nouveau_pm_set_perflvl
>  dev_attr_store
>  sysfs_write_file
>  vfs_write
>  sys_write
>  system_call_fastpath
> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> 
> It's weird nobody noticed this... nva3+ code does not set this hook either,
> but there's no existing function to wire up...
> 
And it seems to crash in the same way, see:
http://www.phoronix.com/image-viewer.php?id=ubuntu_1210_nouvre&image=ubuntu_nouveau_pointer_lrg

BTW, reclocking crashes without this patch:
https://gitorious.org/linux-nouveau-pm/linux-nouveau-pm/commit/f3ed9b23ee611891166da9bac792a22844217c7a

Applying this patch:
https://gitorious.org/linux-nouveau-pm/linux-nouveau-pm/commit/abdd905d2bf362d48c125fd7c556c54c7ae1cbb9
would be good too, because perflvl module option is useless without it.

Marcin
