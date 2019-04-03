From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] pci/quirks: Add quirk to reset nvgpu at boot for the
 Lenovo ThinkPad P50
Date: Wed, 03 Apr 2019 13:27:25 -0400
Message-ID: <59dbed40fc0fad4a945cbfe09c9f622b81c7bd94.camel@redhat.com>
References: <20190212220230.1568-1-lyude@redhat.com>
         <20190215004329.GR96272@google.com>
         <2fca9a9feafcd17b27bc71994a71ebc241a93e9a.camel@redhat.com>
         <52b17f8cb24e179e9661d75548d193843ae87b4c.camel@redhat.com>
         <20190321224819.GK251185@google.com> <20190322113015.GM251185@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322113015.GM251185@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: David Ober <dober@lenovo.com>, linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>, Ben Skeggs <skeggsb@gmail.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: nouveau.vger.kernel.org

Hi, any update on this/do you guys need any more information here? Would very
much like to get this upstream

On Fri, 2019-03-22 at 06:30 -0500, Bjorn Helgaas wrote:
> On Thu, Mar 21, 2019 at 05:48:19PM -0500, Bjorn Helgaas wrote:
> > On Wed, Mar 13, 2019 at 06:25:02PM -0400, Lyude Paul wrote:
> > > On Fri, 2019-02-15 at 16:17 -0500, Lyude Paul wrote:
> > > > On Thu, 2019-02-14 at 18:43 -0600, Bjorn Helgaas wrote:
> > > > > On Tue, Feb 12, 2019 at 05:02:30PM -0500, Lyude Paul wrote:
> > > > > > On a very specific subset of ThinkPad P50 SKUs, particularly
> > > > > > ones that come with a Quadro M1000M chip instead of the M2000M
> > > > > > variant, the BIOS seems to have a very nasty habit of not
> > > > > > always resetting the secondary Nvidia GPU between full reboots
> > > > > > if the laptop is configured in Hybrid Graphics mode. The
> > > > > > reason for this happening is unknown, but the following steps
> > > > > > and possibly a good bit of patience will reproduce the issue:
> > > > > > 
> > > > > > 1. Boot up the laptop normally in Hybrid graphics mode
> > > > > > 2. Make sure nouveau is loaded and that the GPU is awake
> > > > > > 2. Allow the nvidia GPU to runtime suspend itself after being idle
> > > > > > 3. Reboot the machine, the more sudden the better (e.g sysrq-b may
> > > > > > help)
> > > > > > 4. If nouveau loads up properly, reboot the machine again and go
> > > > > > back to
> > > > > > step 2 until you reproduce the issue
> > > > > > 
> > > > > > This results in some very strange behavior: the GPU will quite
> > > > > > literally be left in exactly the same state it was in when the
> > > > > > previously booted kernel started the reboot. This has all
> > > > > > sorts of bad sideaffects: for starters, this completely breaks
> > > > > > nouveau starting with a mysterious EVO channel failure that
> > > > > > happens well before we've actually used the EVO channel for
> > > > > > anything:
> > 
> > Thanks for the hybrid tutorial (snipped from this response).  IIUC,
> > what you said was that in hybrid mode, the Intel GPU drives the
> > built-in display and the Nvidia GPU drives any external displays and
> > may be used for DRI PRIME rendering (whatever that is).  But since you
> > say the Nvidia device gets runtime suspended, I assume there's no
> > external display here and you're not using DRI PRIME.
> > 
> > I wonder if it's related to the fact that the Nvidia GPU has been
> > runtime suspended before you do the reboot.  Can you try turning of
> > runtime power management for the GPU by setting the runpm module
> > parameter to 0?  I *think* this would be booting with
> > "nouveau.runpm=0".
> 
> Sorry, I wasn't really thinking here.  You already *said* this is
> related to runtime suspend.  It only happens when the Nvidia GPU has
> been suspended.
> 
> I don't know that much about suspend, but ISTR seeing comments about
> resuming devices before we shutdown.  If we do that, maybe there's
> some kind of race between that resume and the reboot?
> 
> Bjorn
-- 
Cheers,
	Lyude Paul
