From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: move dereferences after null checks
Date: Sun, 7 Feb 2010 21:46:35 +0100
Message-ID: <20100207204635.GA3339@joi.lan>
References: <20100129090049.GA5547@bicker>
 <20100130144100.GA2902@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100130144100.GA2902-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Jan 30, 2010 at 03:41:00PM +0100, Marcin Slusarz wrote:
> On Fri, Jan 29, 2010 at 12:00:49PM +0300, Dan Carpenter wrote:
> > These bugs are when code dereferences a variable and then checks that it is not null.
> > The new thing is that I wrote a shell script to try remove the false positives caused
> > by macros.  There are still some false positives because smatch is bad at handling 
> > loops and knowing when a container got redefined.
> > 
> > Sometimes the fixes are not obvious.
> > 
> > This is the output of: /path/to/smatch_scripts/filter_kernel_deref_check.sh warns.txt
> > 
> > regards,
> > dan carpenter
> > 
> > (...)
> > drivers/gpu/drm/nouveau/nouveau_object.c +891 'chan': if (!chan || !gpuobj_ret || *gpuobj_ret != NULL)
> > drivers/gpu/drm/nouveau/nouveau_sgdma.c +61 'nvbe': if (nvbe && nvbe->pages) {
> > drivers/gpu/drm/nouveau/nouveau_connector.c +91 'connector': if (!connector)
> > drivers/gpu/drm/nouveau/nv50_crtc.c +306 'crtc': if (!crtc)
> > (...)
> 
> ---
> From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Subject: [PATCH] nouveau: move dereferences after null checks
> 
> Reported-by: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

ping
