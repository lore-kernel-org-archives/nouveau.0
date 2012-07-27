From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nvd0/disp: mask off high 16 bit of
 negative cursor x-coordinate
Date: Fri, 27 Jul 2012 14:20:29 +1000
Message-ID: <CACAvsv5sHjx59VY0tdXOrrsnJyHBV01gxZ=AyaWfQ0tiufd-uQ@mail.gmail.com>
References: <1343328799-9372-1-git-send-email-e0425955@student.tuwien.ac.at>
	<5011A2B5.7060402@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5011A2B5.7060402-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Jul 27, 2012 at 6:04 AM, Maarten Lankhorst
<m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Op 26-07-12 20:53, Christoph Bumiller schreef:
>> ---
>>  drivers/gpu/drm/nouveau/nvd0_display.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nvd0_display.c b/drivers/gpu/drm/nouveau/nvd0_display.c
>> index c486d3c..c50b075 100644
>> --- a/drivers/gpu/drm/nouveau/nvd0_display.c
>> +++ b/drivers/gpu/drm/nouveau/nvd0_display.c
>> @@ -790,7 +790,7 @@ nvd0_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
>>       struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
>>       int ch = EVO_CURS(nv_crtc->index);
>>
>> -     evo_piow(crtc->dev, ch, 0x0084, (y << 16) | x);
>> +     evo_piow(crtc->dev, ch, 0x0084, (y << 16) | (x & 0xffff));
>>       evo_piow(crtc->dev, ch, 0x0080, 0x00000000);
>>       return 0;
>>  }
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [3.4]+
I've already picked this up for nouveau git also.

>
> 3.2 didn't have d9 support yet.
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
