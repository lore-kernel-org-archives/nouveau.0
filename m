From: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] nv: improve KMS detection
Date: Fri, 28 May 2010 11:45:17 -0700
Message-ID: <20100528184517.GA12408@soprano.nvidia.com>
References: <20100523194645.GA15846@joi.lan> <1274654223.7344.0.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1274654223.7344.0.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Christopher James Halse Rogers <raof-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, May 23, 2010 at 03:37:03PM -0700, Ben Skeggs wrote:
> On Sun, 2010-05-23 at 21:46 +0200, Marcin Slusarz wrote:
> > 1) DRICreatePCIBusID belongs to xserver dri module, so when it's
> >    unavailable we can't format string for drmCheckModesettingSupported.
> >    (This situation happened to me with KMS enabled and dri module moved
> >    somewhere else by Gentoo's "eselect opengl set nvidia" switcher)
> >    Open code DRICreatePCIBusID to drop dri dependency.
> > 2) Once we dropped dependency on dri module (which linked to libdrm),
> >    we have to link directly to libdrm.
> An alternative, which we use in Fedora for nv/vesa is to use
> pci_device_has_kernel_driver() from libpciaccess.

That seems better than open-coding it, and avoids a dependency on libdrm
which is nice.
