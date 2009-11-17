From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: Set i2c adapter parent device
Date: Wed, 18 Nov 2009 09:10:55 +1000
Message-ID: <1258499455.15654.2.camel@nisroch>
References: <1258498601-2474-1-git-send-email-mjg@redhat.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1258498601-2474-1-git-send-email-mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 2009-11-17 at 17:56 -0500, Matthew Garrett wrote:
> The parent device of the i2c adapter should be set to the appropriate PCI
> device in order for it to show up properly in sysfs.
> 
> Signed-off-by: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Applied :)

> ---
>  drivers/gpu/drm/nouveau/nouveau_i2c.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_i2c.c b/drivers/gpu/drm/nouveau/nouveau_i2c.c
> index 3f219dd..cca2b6c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_i2c.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_i2c.c
> @@ -176,6 +176,7 @@ nouveau_i2c_init(struct drm_device *dev, struct dcb_i2c_entry *entry, int index)
>  		 "nouveau-%s-%d", pci_name(dev->pdev), index);
>  	i2c->adapter.owner = THIS_MODULE;
>  	i2c->adapter.algo_data = &i2c->algo;
> +	i2c->adapter.dev.parent = &dev->pdev->dev;
>  	i2c->dev = dev;
>  
>  	switch (entry->port_type) {
