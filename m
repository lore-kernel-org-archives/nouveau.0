From: Jan Janecek <janjanjanx@gmail.com>
Subject: Re: [PATCH] drm/nouveau: set irq_enabled manually
Date: Thu, 30 Jan 2014 19:00:37 +0100
Message-ID: <CAM1qvvjpN=MWS_4XdKE_FJ++=ZQUDJwLEFLEZjS0eaVpO1DqAw@mail.gmail.com>
References: <1391043180-27875-1-git-send-email-imirkin@alum.mit.edu>
	<CAKMK7uFjrAHQq+Aj0Mdg_3URW=iXuDa0g=r7d1C-c_MpRfctnQ@mail.gmail.com>
	<CAKb7UvhW1fp0QtWgpz_hhfyCcfLNzyicr-YRCzvOXH3h_+wdew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7UvhW1fp0QtWgpz_hhfyCcfLNzyicr-YRCzvOXH3h_+wdew@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

2014-01-30, Ilia Mirkin <imirkin@alum.mit.edu>:
> On Thu, Jan 30, 2014 at 3:33 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Thu, Jan 30, 2014 at 1:53 AM, Ilia Mirkin <imirkin@alum.mit.edu>
>> wrote:
>>> Since commit 0fa9061ae8c ("drm/nouveau/mc: handle irq-related setup
>>> ourselves"), drm_device->irq_enabled remained unset. This is needed in
>>> order to properly wait for a vblank event in the generic drm code.
>>>
>>> See https://bugs.freedesktop.org/show_bug.cgi?id=74195
>>>
>>> Reported-by: Jan Janecek <janjanjanx@gmail.com>
>>> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
>>> Cc: stable@vger.kernel.org # 3.10+
>>> ---
>>>
>>> TBH, not sure why this fixes things, as irq_enabled == false should have
>>> caused the vblank wait to not wait, since the condition would be
>>> immediately true.
>>>
>>> Jan, mind double-checking that this version of the patch fixes things
>>> for you? Not 100% sure where you stuck the irq_enabled=true line when
>>> you
>>> tried it out.
>>
>> The core drm vblank code bails out if dev->irq_enabled isn't set. So
>
> Right. And what I'm unclear on is how does bailing out on vblank wait
> cause the originally reported issue -- sluggishness. That seems to
> imply that one is waiting too long rather than not waiting enough.
>
>> if you opt to not use the drm irq helpers and instead roll your own
>> you still need to set this to allow vblank wait ioctls and related
>> stuff. It's even documented in the drm DocBook ;-) So
>>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> if you will.
>>
>> Cheers, Daniel
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>

Now I have noticed one more thing:

If you disable GLXVblank globally in xorg.conf in the non-fixed
version, the compton is not able to vsync at all. If you enable it
globally, compton probably still can't use DRM_IOCTL_WAIT_VBLANK
properly, but is forced to vsync using some other method (i guess?)
resulting in "slugishness".
With the fixed version the compton achieves vsync with great
responsiveness using DRM_IOCTL_WAIT_VBLANK, regardless of the
GLXVblank setting in xorg.conf.
