From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: Re: NV43: Native resolution not available on Dell 2007FP
Date: Sun, 6 May 2012 18:01:52 +0100 (BST)
Message-ID: <alpine.LNX.2.01.1205061734240.2014@stax.localdomain>
References: <1205041617180.1310@vega.localdomain>
	<CAGZ4FERF0+PyWg0kQdMcxAhGhQoy6_hWWpiypPaH30kX9g4uiA@mail.gmail.com>
	<alpine.LNX.2.01.1205050018220.30010@stax.localdomain>
	<CACAvsv6X1PA2BFKMZaHM7x8kgrLSuk7rEx=-rjyUPQZC7xm4Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv6X1PA2BFKMZaHM7x8kgrLSuk7rEx=-rjyUPQZC7xm4Hw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, 5 May 2012, Ben Skeggs wrote:

> On Saturday, 5 May 2012, Mark Hills wrote:
> 
> > On Sat, 5 May 2012, Maarten Maathuis wrote:
> >
> > > On Fri, May 4, 2012 at 5:55 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> > > > I have a Dell 2007FP monitor. NV43 (GeForce 6600) can not use the native
> > > > resolution.
> > > >
> > > > 1600x1200 is listed under "DDC gathered Modelines" with the rest of the
> > > > info, but then is missing from "probed modes".
> > > >
> > > > I have a secondary card, NV4a (GeForce 6200, PCI). It works with this
> > > > card. This card does not show "DDC gathered modelines" at all, and
> > > > 1600x1200 is listed under "probed modes".
> > > >
> > > > Does this mean the NV4a card is not using the DDC info? Is it a bug
> > > > preventing 1600x1200 being used with the NV43, or some consequence of DDC
> > > > info?
> > > >
> > > > I am using Nouveau from Git, and kernel 3.4.0-rc4. The proprietary NVidia
> > > > driver fully works, as does another 1600x1200 monitor (Lacie).
[...]
> > > Hi, the nouveau driver contains a table that list per gpu generation
> > > the maximum bandwidth a single tmds link can sustain.
> > >
> > > Your NV4A is newer than your NV43, it can do the full 165 MHz, instead
> > > of the 155 MHz that the NV43 gets. Your 1600x1200 mode requires 162
> > > MHz.

I compared to the proprietary driver and, if I understand correctly, the 
maximum bandwidth of the secondary card is now different. Is this 
something to be concerned about?

[  3593.751] (II) NVIDIA(GPU-1): NVIDIA GPU GeForce 6200 (NV44) at PCI:3:2:0 (GPU-1)
[  3593.751] (--) NVIDIA(GPU-1): DFP-0: 155.0 MHz maximum pixel clock
[  3593.751] (--) NVIDIA(GPU-1): DFP-0: Internal Single Link TMDS

For comparison, here is quotes from the Nouveau log:

[  5962.553] (--) NOUVEAU(0): Chipset: "NVIDIA NV4a"
[  5962.682] (II) NOUVEAU(0): Supported detailed timing:
[  5962.682] (II) NOUVEAU(0): clock: 162.0 MHz   Image Size:  367 x 275 mm
[  5962.682] (II) NOUVEAU(0): h_active: 1600  h_sync: 1664  h_sync_end 1856 h_blank_end 2160 h_border: 0
[  5962.683] (II) NOUVEAU(0): v_active: 1200  v_sync: 1201  v_sync_end 1204 v_blanking: 1250 v_border: 0
[  5962.683] (II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: 30 H max: 83 kHz, PixClock max 175 MHz

> > > I do not know if the limits are accurate, but a reduced blanking
> > > 1600x1200 should use less bandwith, so if you somehow can get such a
> > > mode into the system (maybe there is a kernel option to do this), but
> > > this i do not know.
> >
> > Thanks, I see what you're saying. I think the relevant code looks to be
> > get_tmds_link_bandwidth.
> >
> > But then if the mode given by the DDC is over this limit, I don't
> > understand why the proprietary drivers do not have the same problem.
> >
> > Does it mean that the prietary driver is falling-back to one of its own
> > built-in 1600x1200 modes?
> 
> 
> I've looked at this issue previously, and IIRC the binary driver builds a
> reduced blanking mode instead of what the monitor reports.

For comparison, here's extracts from the proprietary driver's Xorg.0.log 
output from the primary card (NV43), where the Dell screen works 
correctly:

[  3593.426] (II) NVIDIA(0): NVIDIA GPU GeForce 6600 (NV43) at PCI:1:0:0 (GPU-0)
[...]
[  3593.427] (--) NVIDIA(0): DELL 2007FP (DFP-0): 155.0 MHz maximum pixel clock
[  3593.427] (--) NVIDIA(0): DELL 2007FP (DFP-0): Internal Single Link TMDS
[  3593.427] (--) NVIDIA(0): DFP-1: 155.0 MHz maximum pixel clock
[  3593.427] (--) NVIDIA(0): DFP-1: Internal Single Link TMDS
[  3593.427] (**) NVIDIA(0): Using HorizSync/VertRefresh ranges from the EDID for display
[  3593.427] (**) NVIDIA(0):     device DELL 2007FP (DFP-0) (Using EDID frequencies has
[  3593.427] (**) NVIDIA(0):     been enabled on all display devices.)
[  3593.427] (II) NVIDIA(0): Validated modes:
[  3593.427] (II) NVIDIA(0):     "DFP-0:1600x1200"
[  3593.427] (II) NVIDIA(0): Virtual screen size determined to be 1600 x 1200

To use a valid 1600x1200 mode with Nouveau, it is a matter of adding an 
equivalent mode to an existing table somewhere? Or does KMS only allow the 
DDC modes to be used (requiring more extensive modification?)

> > The same NV43 with Nouveau is happy with the 1920x1200 of another Dell
> > screen, and the 1600x1200 of the Lacie. These modes are:
> >
> > [ 13816.407] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968
> > 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
> > [ 13816.428] (II) NOUVEAU(1): Modeline "1600x1200"x0.0  130.89  1600 1620
> > 1700 1780  1200 1201 1204 1225 +hsync +vsync (73.5 kHz)
> >
> > Maybe I can find time to revert the kernel and try and NVidia drivers, to
> > check the Xorg.0.log file.
> >
> > Thanks for your help.
> >
> > --
> > Mark
> 

Thanks for your replies.

-- 
Mark
