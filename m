From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] nv50: improve nv50_pm_clock_get ()
Date: Fri, 18 Mar 2011 19:57:02 +0000
Message-ID: <1300478222.14246.27.camel@emo-laptop>
References: <1300410948-12022-1-git-send-email-emil.l.velikov@gmail.com>
	<1300449860.2258.2.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1300449860.2258.2.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 2011-03-18 at 22:04 +1000, Ben Skeggs wrote:
> On Fri, 2011-03-18 at 01:15 +0000, Emil Velikov wrote:
> > On some cards the memory and/or shader pll can be switched off/disabled
> > Check and return the linked/standart clock
> > 
> > Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/gpu/drm/nouveau/nv50_pm.c |   13 +++++++++++++
> >  1 files changed, 13 insertions(+), 0 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/nv50_pm.c
> > index 7dbb305..c01a64f 100644
> > --- a/drivers/gpu/drm/nouveau/nv50_pm.c
> > +++ b/drivers/gpu/drm/nouveau/nv50_pm.c
> > @@ -47,6 +47,19 @@ nv50_pm_clock_get(struct drm_device *dev, u32 id)
> >  
> >  	reg0 = nv_rd32(dev, pll.reg + 0);
> >  	reg1 = nv_rd32(dev, pll.reg + 4);
> > +
> > +	if ((reg0 & 0x80000000) == 0) {
> > +		if (id == PLL_SHADER) {
> > +			NV_INFO(dev, "Shader PLL appears to be OFF\n");
> > +			ret = nv50_pm_clock_get(dev, PLL_CORE);
> > +			if (ret > 0)
> > +				return ret*2;
> This seems somewhat OK, from what I recall seeing.  Have you seen any
> definite evidence to suggest that the shaders actually run at double the
> core clock if the PLL is "off"?

The definite evidence can be taken from the blob's behaviour as well as
programs such as MSI Afterburner and EGA Precision (both windows apps)

Example 1 (blob) - on my system if the shader is 2x Core (in the perf
table) the shader plls is always off (GNU/Linux and Windows). If I
change the entry/perf table to 275/555 (core/shader), the blob sets
turns the shader pll ON (plus some misc, bit's that are coming later on)

Example 2 (windows apps) - both apps have a "link" button, upon
activation of which the shader plls being switched off and the shader
clk is being linked to the core (by a factor of two). Upon deactivation
the opposite behaviour has been observed. In both cases (link/unlink)
the blob reports the correct clks.

> 
> > +		} else if (id == PLL_MEMORY) {
> > +			NV_INFO(dev, "Memory PLL appears to be OFF\n");
> > +			return 100*1000;
> This, is more dubious.  Are you trying to indicate that it's running at
> the reference clock?  Or always at a fixed 100MHz?

This is the one that causes some oddness to the whole "pll off". I
cannot recall what was the exact reference clock (but I believe it was
25kHz). Thus making the fun even better.

The above has been confirmed by modifying the perf table (to 105) and it
can be easily seen that the PLL is then "on". No idea where the fixed
100Mhz comes from though. 
If the current implementation is correct then the memory clk would be
1000Mhz vs 100Mhz (as reported by the blob). Simply observe the
registers and calculate the clk, when the blob sets the clocks - ex.
169/337/100 (core/shr/mem) seen on many nv50+ laptops

In all cases the blob has a tolerance of up to 5MHz for reading/writing
the clks.

Note that some systems may still set the shader/memory plls even if they
fall under those rules (shader == 2*core , memory == 100Mhz). Thus they
will be "pm_clock_get" by the current code.

Regards,
Emil.
 

> 
> Ben.
> > +		}
> > +	}
> > +
> >  	P = (reg0 & 0x00070000) >> 16;
> >  	N = (reg1 & 0x0000ff00) >> 8;
> >  	M = (reg1 & 0x000000ff);
> 
> 
