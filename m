From: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: known MSI errata?
Date: Thu, 24 Oct 2013 14:43:13 -0700
Message-ID: <20131024214313.GF19847@morell.nvidia.com>
References: <1380563052.1686.6.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380563052.1686.6.camel@tellur>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, gpu-public-documentation <gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Sep 30, 2013 at 10:44:12AM -0700, Lucas Stach wrote:
> Hi,
> 
> recently we tried to enable MSI interrupts with nouveau. Unfortunately
> there have been some reports of things failing with certain cards, where
> it isn't entirely clear if this is a GPU errata or some other component
> in the PCIe chain failing.
> 
> Could you perhaps investigate if there are any known Nvidia GPU erratas
> with regard to MSI interrupts, or maybe tell us the generations of cards
> that are generally safe to enable MSIs with?

Sorry for the slow reply, Lucas.

We enabled MSI interrupts by default relatively recently in the proprietary
driver (version 325.08, released 2013-07-01 according to our public
changelog).  This was enabled across the board for all of the GPUs supported
by the latest release series, so NV50 and up.  We believe it should be safe to
enable MSI on those GPUs.  We never enabled MSI by default on earlier GPUs so
I can't comment there.

I investigated our internal documentation and source code, and found a couple
of things that are probably interesting to you:
- For all pre-Fermi GPUs, we use a write through PCI config space to the "EOI"
  register to rearm the MSI interrupt after servicing it, rather than a write
  through the MMIO pcicfg shadow region in the GPU's PCI BAR0 window at offset
  0x88000.  (This was actually originally implemented for NV4x, so you'll
  probably want to do that there as well.)  It seems that this was done to
  avoid a hardware bug that may cause the EOI write to be dropped, blocking
  all further interrupts from being serviced.
- For GF100 and GF104, an alternate MSI EOI/rearm mechanism is used: instead
  of writing to the MSI rearm register at offset 0x68 in the pcicfg window,
  we write to offset 0x704.


I hope this information helps.

- Robert
