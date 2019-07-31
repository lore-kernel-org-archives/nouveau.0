From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] Revert "PCI: Enable NVIDIA HDA controllers"
Date: Wed, 31 Jul 2019 17:35:11 -0400
Message-ID: <b27614151184f29bb147786933cb424fddb82a23.camel@redhat.com>
References: <20190731201927.22054-1-lyude@redhat.com>
         <20190731211842.befvpoyudrm2subf@wunner.de>
         <CACO55tu=9ZBzGkwdXPOwWARy1UTspFv+v=nrmLFoOKiSGU+E5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACO55tu=9ZBzGkwdXPOwWARy1UTspFv+v=nrmLFoOKiSGU+E5Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>, Lukas Wunner <lukas@wunner.de>
Cc: nouveau <nouveau@lists.freedesktop.org>, Linux PCI <linux-pci@vger.kernel.org>, Daniel Drake <drake@endlessm.com>, Bjorn Helgaas <bhelgaas@google.com>, Aaron Plattner <aplattner@nvidia.com>, Peter Wu <peter@lekensteyn.nl>, Ilia Mirkin <imirkin@alum.mit.edu>, Maik Freudenberg <hhfeuer@gmx.de>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Wed, 2019-07-31 at 23:26 +0200, Karol Herbst wrote:
> On Wed, Jul 31, 2019 at 11:18 PM Lukas Wunner <lukas@wunner.de> wrote:
> > On Wed, Jul 31, 2019 at 04:19:27PM -0400, Lyude Paul wrote:
> > > While this fixes audio for a number of users, this commit has the
> > > sideaffect of breaking the BIOS workaround that's required to make the
> > > GPU on the nvidia P50 work, by causing the GPU's PCI device function to
> > > stop working after it's been set to multifunction mode.
> > 
> > This is missing a reference to the commit introducing the P50 quirk,
> > which is e0547c81bfcf ("PCI: Reset Lenovo ThinkPad P50 nvgpu at boot
> > if necessary").
> > 
> > Please describe in more detail how the GPU's PCI function stops working.
> > Does it respond with "all ones" when accessing MMIO?
> > Do MMIO accesses cause the system to hang?
> > 
> > Could you provide lspci -vvxx output for the GPU and its associated
> > HDA controller with and without b516ea586d71?
> > 
> > Does this machine have external display connectors via which audio
> > can be streamed?
> > 
> > 
> > > I'm not really holding my breath on this patch to being accepted:
> > > there's a good chance there's a better solution for this (and I'm going
> > > to continue investigating for one after sending this patch), this is
> > > more just to start a conversation on what the proper way to fix this is.
> > 
> > Posting as an RFC might have been more appropriate then.
> > 
> 
> no, a revert is actually appropriate.  If a commit fixes something,
> but breaks something else, it gets either reverted or fixed. If nobody
> fixes it, then revert it is.

To answer Lukas's question btw: most of the details on how things break are
back in the original commit (sorry for forgetting the reference!), there's a
_lot_ of explanation there that I'd rather not retype, so just refer back to
the commit and bug @ https://bugs.freedesktop.org/show_bug.cgi?id=75985

Additionally, there was some extra discussion providing some more detail in
the email thread that I had with Bjorn:

https://lkml.org/lkml/2019/2/12/1172

As for how this commit breaks the workaround: it seems that when we enable the
HDA controller and put the GPU into multifunction mode, the function-level
reset stops working and thus we can't reset the GPU anymore. Currently I can
see a couple of solutions (again, please feel free to suggest more!):

 * Just revert the commit. We should do this if necessary, but of course I'd
   much rather try finding a fix first
 * Disable the HDA controller temporarily when a GPU reset is neded in
   quirk_reset_lenovo_thinkpad_p50_nvgpu(), then call the function level
   reset, then re-enable the HDA controller. I have no idea if this actually
   works yet, but I'm about to try this on my system
 * Get quirk_reset_lenovo_thinkpad_p50_nvgpu() to run before
   quirk_nvidia_hda(). This would probably be fine, but we would need to
   rework some stuff in the PCI subsystem (maybe it already has a way to do
   this? haven't checked yet) so that we could perform an flr probe early
   enough to perform the quirk
> 
> > > So, I'm kind of confused about why exactly this was implemented as an
> > > early boot quirk in the first place. If we're seeing the GPU's PCI
> > > device, we already know the GPU is there. Shouldn't we be able to check
> > > for the existence of the HDA device once we probe the GPU in nouveau?
> > 
> > I think a motivation to keep this generic was to make it work with
> > other drivers besides nouveau, specifically Nvidia's proprietary driver.
> > nouveau might not even be enabled.
> > 
> > 
> > > that still doesn't explain why this was implemented as an early quirk
> > 
> > This isn't an early quirk.  Those live in arch/x86/kernel/early-quirks.c.
> > This is just a PCI quirk executed on device enumeration and on resume.
> > Devices aren't necessarily enumerated only on boot, e.g. think
> > Thunderbolt.
> > 
> > Thanks,
> > 
> > Lukas
-- 
Cheers,
	Lyude Paul
