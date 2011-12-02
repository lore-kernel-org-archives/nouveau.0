From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix acpi related kbuild warnings
Date: Fri, 2 Dec 2011 19:49:14 +0100
Message-ID: <20111202184914.GB3302@joi.lan>
References: <20111102213940.GA5459@joi.lan>
 <20111109213234.GB3402@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111109213234.GB3402-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Nov 09, 2011 at 10:32:34PM +0100, Marcin Slusarz wrote:
> On Wed, Nov 02, 2011 at 10:39:40PM +0100, Marcin Slusarz wrote:
> > Currently when X86 && ACPI && !X86_PLATFORM_DEVICES kbuild spits:
> > 
> > warning: (DRM_NOUVEAU) selects ACPI_WMI which has unmet direct
> > dependencies (X86 && X86_PLATFORM_DEVICES && ACPI)
> > warning: (DRM_NOUVEAU) selects MXM_WMI which has unmet direct
> > dependencies (X86 && X86_PLATFORM_DEVICES && ACPI_WMI)
> > 
> > and goes on, which leaves a situation where ACPI_WMI (which depends on
> > X86_PLATFORM_DEVICES) is enabled but X86_PLATFORM_DEVICES is not.
> > Additionally, Nouveau on IA64 would enable these X86-related drivers
> > when ACPI is enabled (doesn't matter but is wrong) and build
> > nouveau_acpi.c which depends on them.
> > 
> > To fix this, introduce hidden DRM_NOUVEAU_ACPI variable which selects
> > all acpi/x86 related configs and select it when both X86 and ACPI are
> > enabled.
> > 
> > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---

ping?
