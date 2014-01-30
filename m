From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: set irq_enabled manually
Date: Thu, 30 Jan 2014 12:11:30 -0500
Message-ID: <CAKb7UvhW1fp0QtWgpz_hhfyCcfLNzyicr-YRCzvOXH3h_+wdew@mail.gmail.com>
References: <1391043180-27875-1-git-send-email-imirkin@alum.mit.edu>
	<CAKMK7uFjrAHQq+Aj0Mdg_3URW=iXuDa0g=r7d1C-c_MpRfctnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKMK7uFjrAHQq+Aj0Mdg_3URW=iXuDa0g=r7d1C-c_MpRfctnQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Jan Janecek <janjanjanx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jan 30, 2014 at 3:33 AM, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:
> On Thu, Jan 30, 2014 at 1:53 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
>> Since commit 0fa9061ae8c ("drm/nouveau/mc: handle irq-related setup
>> ourselves"), drm_device->irq_enabled remained unset. This is needed in
>> order to properly wait for a vblank event in the generic drm code.
>>
>> See https://bugs.freedesktop.org/show_bug.cgi?id=74195
>>
>> Reported-by: Jan Janecek <janjanjanx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # 3.10+
>> ---
>>
>> TBH, not sure why this fixes things, as irq_enabled == false should have
>> caused the vblank wait to not wait, since the condition would be
>> immediately true.
>>
>> Jan, mind double-checking that this version of the patch fixes things
>> for you? Not 100% sure where you stuck the irq_enabled=true line when you
>> tried it out.
>
> The core drm vblank code bails out if dev->irq_enabled isn't set. So

Right. And what I'm unclear on is how does bailing out on vblank wait
cause the originally reported issue -- sluggishness. That seems to
imply that one is waiting too long rather than not waiting enough.

> if you opt to not use the drm irq helpers and instead roll your own
> you still need to set this to allow vblank wait ioctls and related
> stuff. It's even documented in the drm DocBook ;-) So
>
> Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
>
> if you will.
>
> Cheers, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
