From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v3 3/8] drm/fb_helper: Introduce hotplug_suspend/resume()
Date: Mon, 6 Aug 2018 15:45:56 -0400
Message-ID: <CADnq5_PJHjOrcB3WtJjg7XFSQMBRaAOrPX17M4dcm7r_7_+gqg@mail.gmail.com>
References: <20180731003954.19962-1-lyude@redhat.com> <20180731003954.19962-4-lyude@redhat.com>
 <20180806084322.GK3008@phenom.ffwll.local> <4e72a10062166d646ebd3eb28b6c186d4c00a63f.camel@redhat.com>
 <20180806193457.GA7028@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180806193457.GA7028@wunner.de>
Sender: stable-owner@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, Karol Herbst <karolherbst@gmail.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, "for 3.8" <stable@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Mon, Aug 6, 2018 at 3:34 PM, Lukas Wunner <lukas@wunner.de> wrote:
> On Mon, Aug 06, 2018 at 03:15:31PM -0400, Lyude Paul wrote:
>> You did mention in the review of one of my other patches that we should avoid
>> disabling polling during runtime suspend, and you're definitely right. I feel
>> a bit silly for not remembering that since I was the one who made it so that
>> i915 does polling in runtime suspend for chips without RPM HPD detection in
>> the first place because it was causing people's displays not to come up on
>> vlv...
>> Anyway: I think if we just leave output polling enabled during runtime suspend
>> that might actually fix all of the fb_helper locking issues since we won't
>> need to wait on any of the output poll workers to finish, at least I think it
>> should: I'll confirm this when I get into the office
>
> Quoth Imre Deak:
>
>    "In i915 polling is on during runtime suspend only if there are outputs
>     without hotplug interrupt support. A special case is when an output has
>     working HPD interrupts when in D0, but no interrupts when runtime
>     suspended. For these we start polling (from a scheduled work) in the
>     runtime suspend hook and stop it in the runtime resume hook (again from
>     a scheduled work)."
>     https://lkml.org/lkml/2018/2/12/330
>
> nouveau only uses runtime PM on discrete GPUs in dual GPU laptops.
> Resuming the GPU from D3cold to D0 every few seconds to poll the
> outputs would waste too much power on such machines.
>
> The question is, why is polling running at all, since all modern
> laptops have HPD-capable ports such as DP?
>

At least on AMD GPUs, the GPU has to be powered up for HPD interrupts
to work.  On hybrid graphics laptops, depending on the OEM
configuration, the hotplug events are caught by the ACPI controller on
the motherboard when the GPU is powered down and an ACPI event is
generated which the driver can listen for and then tell userspace.
I'm not sure how nvidia handles this.  Also, some display connections
(e.g., analog DACs) don't support hotplug interrupts in the first
place so the only way to go is polling.

Alex
