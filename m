From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: wait for vblank on page flipping
Date: Fri, 29 Mar 2013 12:20:32 +1000
Message-ID: <CACAvsv5U2SYZ_aa=5wwu8-HJwRMVdVkeh8ez8TG9tOWzO2An8Q@mail.gmail.com>
References: <51545EE3.8020406@canonical.com>
	<1364506416.3559.51.camel@thor.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1364506416.3559.51.camel@thor.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: nouveau@lists.freedesktop.org, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Fri, Mar 29, 2013 at 7:33 AM, Peter Hurley <peter@hurleysoftware.com> wrote:
> On Thu, 2013-03-28 at 16:16 +0100, Maarten Lankhorst wrote:
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
>> ---
>> Oops, fixed to apply this time..
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
>> index 4610c3a..020542e 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>> @@ -593,7 +597,7 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
>>
>>       /* Emit a page flip */
>>       if (nv_device(drm->device)->card_type >= NV_50) {
>> -             ret = nv50_display_flip_next(crtc, fb, chan, 0);
>> +             ret = nv50_display_flip_next(crtc, fb, chan, 1);
>
> Why would this work?
Because, when I added the code to support all this I kept it in mind
and added a switch to use it.

Now.  The reason I never switched this on is that (as I *already*
mentioned in #nouveau to Maarten about another patch to enable vblank
unconditionally in the DDX.......) we already have huge problems with
memory bandwidth due to our cards usually starting up at low clock
speeds.  When I added page flipping support it made a huge difference
to some games etc that were barely playable before.

So, it'd be really nice to be able to do this, yes.  But, before I'll
accept the patches a few things need to happen.  I'd have done it
before, but, I've always had higher priority things in the way (like,
fixing the reclocking issue...)..

1. Fix the X server so that the page flipping path (dri2.c, line 1125)
will be called even if theres no swap_interval set, this will allow
page flipping to be used even in the absence of a sync-to-vblank
request too.
2. Remove the GLXVBlank option from the nouveau ddx completely,
default it to on.  The application/user can now control it via other
means anyway (drawable swap_interval).
3. Fix the DRM page flip ioctl to take a flag to request a non-vsync'd
flip, and hook that bit up to the nv50_display_flip_next() call

I think that's everything... This will let us support both the speed
improvements from flipping, and sync-to-vblank as the user chooses.

Ben.

>
>>               if (ret) {
>>                       mutex_unlock(&chan->cli->mutex);
>>                       goto fail_unreserve;
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
