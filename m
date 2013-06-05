From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH] nouveau: Load firmware for BSP/VP engines on NV84-NV96,
	NVA0
Date: Wed, 5 Jun 2013 03:16:07 -0400
Message-ID: <CAKb7UvgfgmWEYSJ2ChSawB8BQpOsc3=VCcQ-4PsxiBeNGsPQ7A@mail.gmail.com>
References: <1370250144-3303-1-git-send-email-imirkin@alum.mit.edu>
	<CAKb7Uvj4vR4Xw_Fy-3MjyF_MW4iWqzP6iorgLKCKT2ABZkykzw@mail.gmail.com>
	<51AEE32C.9090004@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <51AEE32C.9090004@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: nouveau@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@ubuntu.com>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Wed, Jun 5, 2013 at 3:05 AM, Maarten Lankhorst
<maarten.lankhorst@canonical.com> wrote:
> Hey,
>
> Op 04-06-13 20:38, Ilia Mirkin schreef:
>> On Mon, Jun 3, 2013 at 5:02 AM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>> These chipsets include the VP2 engine which is composed of a bitstream
>>> processor (BSP) that decodes H.264 and a video processor (VP) which can
>>> do iDCT/mo-comp/etc for MPEG1/2, H.264, and VC-1. Both of these are
>>> driven by separate xtensa chips embedded in the hardware. This patch
>>> provides the mechanism to load the kernel for the xtensa chips and
>>> provide the necessary interactions to do the rest of the work.
>>>
>>> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
>>> ---
>>>
>>> This patch applies on top of nouveau/master (16a41bcc8).
>>>
>>> This seems to work for me. There was one boot where my userspace
>>> component didn't work right, but it could just as well be a bug
>>> there. Subsequent attempts seem to work fine. Note that I'm not
>>> particularly familiar with any of this stuff, so if something looks
>>> odd, I probably didn't know any better. I did try to faithfully
>>> reproduce whatever the blob did. A few questions/thoughts:
>>>
>>> 1. There's a LOT of similarity between BSP and VP setup/etc. Is it
>>>    worth it to create a core/xtensa.c or some such, similar to
>>>    falcon.c? Since it's only in two places, not that much code, and
>>>    there _are_ differences, I decided to keep them separate.
>>>
>>> 2. Firmware naming. Maarten suggested to use the falcon naming style,
>>>    which is nv$chipset_fuc$offset. However here, all the chips share
>>>    the same firmware. Also the offset would be 103 vs 00f, and is a
>>>    little arbitrary. (And fuc doesn't apply here... xt? xtensa?) I've
>>>    left it the way I had it: nv84_bsp and nv84_vp.
>>>
>>> 3. Firmware load time. I chose to load the fw into memory in the ctor,
>>>    and then copy it in in init, due to some potentially bogus
>>>    suspend/resume concerns. Also e.g. mplayer likes to create/destroy
>>>    decoders at startup a few times. The downside is that ~200KB of
>>>    memory is gone. Let me know if I should change it to do the
>>>    request_firmware in init.
>>>
>>> There's obviously a userspace piece to this, which I'm still working
>>> on. But right now I have it working within certain parameters
>>> (e.g. 1280x544 videos), and I'm relatively confident it can be
>>> completed without further kernel-side changes.
>>>
>>> There's also a hypothetical concern of "what if we create an open
>>> firmware with a different user API". Ideally there'd be some way to
>>> expose what kind of firmware is loaded, but I think that can be left
>>> for "later".
>>
>> I also happened to notice that NV98, NVA1+ refer to these nv84 engines
>> (in drivers/gpu/drm/nouveau/core/engine/device/nv50.c). I assume that
>> means I should create a new nv98.c version of BSP/VP that resembles
>> the old versions of nv84.c, and point device/nv50.c at those for nv98
>> and nva1+?
>>
> nv98+ should really have an implementation more like nvc0, and the copy engine
> is a good example on what conversion is needed to do it. :-)

That should probably be a separate patch, no? Do you mean something
more falcon-y? (It still needs firmware, right?) I think I should just
avoid changing things on those cards in this patch... (Also the only
NV card I have access to is my NV96, so I'll be more likely to keep
playing with that :) )

  -ilia
