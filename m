From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] pci/quirks: Add quirk to reset nvgpu at boot for the
 Lenovo ThinkPad P50
Date: Wed, 24 Apr 2019 15:16:37 -0400
Message-ID: <4e45b65b2151293d91dfc5811f64f3453f591f9d.camel@redhat.com>
References: <20190212220230.1568-1-lyude@redhat.com>
         <20190215004329.GR96272@google.com>
         <2fca9a9feafcd17b27bc71994a71ebc241a93e9a.camel@redhat.com>
         <52b17f8cb24e179e9661d75548d193843ae87b4c.camel@redhat.com>
         <20190321224819.GK251185@google.com> <20190322113015.GM251185@google.com>
         <20190404141724.GJ141706@google.com>
         <3987ad435bfdb2d92e5e42648174634814b1646d.camel@redhat.com>
         <20190424185937.GB11428@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190424185937.GB11428@google.com>
Sender: stable-owner@vger.kernel.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: David Ober <dober@lenovo.com>, linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>, Ben Skeggs <skeggsb@gmail.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Hans de Goede <hdegoede@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed, 2019-04-24 at 13:59 -0500, Bjorn Helgaas wrote:
> Not being a scheduled work expert, I was unsure if this experiment was
> equivalent to what I proposed.
> 
> I'm always suspicious of singleton solutions like this (using
> schedule_work() in runtime_resume()) because usually they seem to be
> solving a generic problem that should happen on many kinds of
> hardware.  The 0b2fe6594fa2 ("drm/nouveau: Queue hpd_work on (runtime)
> resume") commit log says:
> 
>   We need to call drm_helper_hpd_irq_event() on resume to properly
>   detect monitor connection / disconnection on some laptops, use
>   hpd_work for this to avoid deadlocks.
> 
> The situation of a monitor being connected or disconnected during
> suspend can happen to *any* GPU, but the commit only changes nouveau,
> which of course raises the question of how we deal with that in other
> drivers.  If the Nvidia GPU has some unique behavior related to
> monitor connection, that would explain special-case code there, but
> the commit doesn't mention anything like that.
> 
> It should be simple to revert 0b2fe6594fa2 and see whether it changes
> the behavior at all (well, simple except for the fact that this
> problem isn't 100% reproducible in the first place).

It's not 100% reproducible, but it's at least 90% so it's not difficult for me
to test at all.

Also, reverting this commit makes no difference either. Note that while that
commit only changed nouveau, scheduled_work() is exactly how a number of other
drivers (i915 for instance) handle reprobing like this as well. The reason
being that we can't do full connector reprobing in our runtime resume thread
because we could deadlock if someone else is holding a modesetting lock we
need and waiting on us to resume at the same time (there's a number of other
bug fixes in nouveau for other issues caused by the same deadlock scenario). 

I'm confused here though, it sounds like you're running under the assumption
that PCI devices like this aren't reset into a clean state during a system
reboot, is that correct?

> 
> > Do we want to have this discussion on the bz btw, or is this email
> > thread fine?
> 
> Email is fine.
-- 
Cheers,
	Lyude Paul
