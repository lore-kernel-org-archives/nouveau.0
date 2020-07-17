From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] RFC: ACPI / OSI: remove workarounds for hybrid graphics
 laptops
Date: Fri, 17 Jul 2020 15:19:47 -0400
Message-ID: <7bc7287b5cbac6535765b3490bd55da1e1cb4d07.camel@redhat.com>
References: <20200717190547.648604-1-kherbst@redhat.com>
Reply-To: lyude@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200717190547.648604-1-kherbst@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>, linux-acpi@vger.kernel.org
Cc: Alex Hung <alex.hung@canonical.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Hey-just wanted to give some additional context I think Karol missed here. It
should be noted that since the last time me and Karol looked at reverting these,
we've already fixed all of the nasty runtime PM (e.g. runtime D3) issues we
could find. This includes the infamous one that was affecting nearly all of the
nvidia pascal (+ some maxwell 2 and turing, it ended up being that the intel PCI
bridge was the culprit) machines on the market. Right now I'm only aware of one
major issue we have, which is the result of a recent PCI core change that we're
already in the process of getting reverted:

https://lkml.org/lkml/2020/7/16/1288

[if you do any testing of runtime PM, you may need to temporarily revert this
patch to make things work]

So, really-runtime D3 is very much supported with nouveau. And we've put a _lot_
of effort into making sure of that, and are happy to fix any issues you're still
finding. It also works just fine in AMD, but if you're finding systems it
doesn't work with amd on then please let the amdgpu folks know upstream so they
can properly fix it. Otherwise, these ACPI workarounds are likely making the
power consumption on these systems (for nouveau, amdgpu, and radeon)
dramatically higher then it needs to be.

On Fri, 2020-07-17 at 21:05 +0200, Karol Herbst wrote:
> It's hard to figure out what systems are actually affected and right now I
> don't see a good way of removing those...
> 
> But I'd like to see thos getting removed and drivers fixed instead (which
> happened at least for nouveau).
> 
> And as mentioned before, I prefer people working on fixing issues instead
> of spending time to add firmware level workarounds which are hard to know
> to which systems they apply to, hard to remove and basically a big huge
> pain to work with.
> In the end I have no idea how to even figure out what systems are affected
> and which not by this, so I have no idea how to even verify we can safely
> remove this (which just means those are impossible to remove unless we risk
> breaking systems, which again makes those supper annoying to deal with).
> 
> Also from the comments it's hard to get what those bits really do. Are they
> just preventing runtime pm or do the devices are powered down when booting?
> I am sure it's the former, still...
> 
> Please, don't do this again.
> 
> For now, those workaround prevent power savings on systems those workaround
> applies to, which might be any so those should get removed asap and if
> new issues arrise removing those please do a proper bug report and we can
> look into it and come up with a proper fix (and keep this patch out until
> we resolve all of those).
> 
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> CC: Alex Hung <alex.hung@canonical.com>
> CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> CC: Len Brown <lenb@kernel.org>
> CC: Lyude Paul <lyude@redhat.com>
> CC: linux-kernel@vger.kernel.org
> CC: dri-devel@lists.freedesktop.org
> CC: nouveau@lists.freedesktop.org
> ---
>  drivers/acpi/osi.c | 24 ------------------------
>  1 file changed, 24 deletions(-)
> 
> diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
> index 9f68538091384..d4405e1ca9b97 100644
> --- a/drivers/acpi/osi.c
> +++ b/drivers/acpi/osi.c
> @@ -44,30 +44,6 @@ osi_setup_entries[OSI_STRING_ENTRIES_MAX] __initdata = {
>  	{"Processor Device", true},
>  	{"3.0 _SCP Extensions", true},
>  	{"Processor Aggregator Device", true},
> -	/*
> -	 * Linux-Dell-Video is used by BIOS to disable RTD3 for NVidia graphics
> -	 * cards as RTD3 is not supported by drivers now.  Systems with NVidia
> -	 * cards will hang without RTD3 disabled.
> -	 *
> -	 * Once NVidia drivers officially support RTD3, this _OSI strings can
> -	 * be removed if both new and old graphics cards are supported.
> -	 */
> -	{"Linux-Dell-Video", true},
> -	/*
> -	 * Linux-Lenovo-NV-HDMI-Audio is used by BIOS to power on NVidia's HDMI
> -	 * audio device which is turned off for power-saving in Windows OS.
> -	 * This power management feature observed on some Lenovo Thinkpad
> -	 * systems which will not be able to output audio via HDMI without
> -	 * a BIOS workaround.
> -	 */
> -	{"Linux-Lenovo-NV-HDMI-Audio", true},
> -	/*
> -	 * Linux-HPI-Hybrid-Graphics is used by BIOS to enable dGPU to
> -	 * output video directly to external monitors on HP Inc. mobile
> -	 * workstations as Nvidia and AMD VGA drivers provide limited
> -	 * hybrid graphics supports.
> -	 */
> -	{"Linux-HPI-Hybrid-Graphics", true},
>  };
>  
>  static u32 acpi_osi_handler(acpi_string interface, u32 supported)
