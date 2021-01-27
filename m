From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: 5.9.11 still hanging 2mn at each boot and looping on
 nvidia-gpu 0000:01:00.3: PME# enabled (Quadro RTX 4000 Mobile)
Date: Wed, 27 Jan 2021 15:33:00 -0600
Message-ID: <20210127213300.GA3046575@bjorn-Precision-5520>
References: <20201226111209.GA2498@merlins.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20201226111209.GA2498-xnduUnryOU1AfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Marc MERLIN <marc_nouveau-xnduUnryOU1AfugRpC6u6w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux PCI <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Marc, I appreciate your persistence on this.  I am frankly
surprised that you've put up with this so long.

On Sat, Dec 26, 2020 at 03:12:09AM -0800, Marc MERLIN wrote:
> This started with 5.5 and hasn't gotten better since then, despite
> some reports I tried to send.
> 
> As per my previous message:
> I have a Thinkpad P70 with hybrid graphics.
> 01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M600M] (rev a2)
> that one works fine, I can use i915 for the main screen, and nouveau to
> display on the external ports (external ports are only wired to nvidia
> chip, so it's impossible to use them without turning the nvidia chip
> on).
>  
> I now got a newer P73 also with the same hybrid graphics (setup as such
> in the bios). It runs fine with i915, and I don't need to use external
> display with nouveau for now (it almost works, but I only see the mouse
> cursor on the external screen, no window or anything else can get
> displayed, very weird).
> 01:00.0 VGA compatible controller: NVIDIA Corporation TU104GLM [Quadro RTX 4000 Mobile / Max-Q] (rev a1)
>  
> 
> after boot, when it gets the right trigger (not sure which ones), it
> loops on this evern 2 seconds, mostly forever.
> 
> I'm not sure if it's nouveau's fault or the kernel's PCI PME's fault, or something else.

IIUC there are basically two problems:

  1) A 2 minute delay during boot
  2) Some sort of event every 2 seconds that kills your battery life

Your machine doesn't sound unusual, and I haven't seen a flood of
similar reports, so maybe there's something unusual about your config.
But I really don't have any guesses for either one.

It sounds like v5.5 worked fine and you first noticed the slow boot
problem in v5.8.  We *could* try to bisect it, but I know that's a lot
of work on your part.

Grasping for any ideas for the boot delay; could you boot with
"initcall_debug" and collect your "lsmod" output?  I notice async_tx
in some of your logs, but I have no idea what it is.  It's from
crypto, so possibly somewhat unusual?

Bjorn
