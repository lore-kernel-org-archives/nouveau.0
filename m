From: Ted Percival <ted-QSfhGDxlWt8QrrorzV6ljw@public.gmane.org>
Subject: Re: [PATCH] drm/nv84+: fix fence context seqno's
Date: Thu, 25 Sep 2014 16:28:22 -0600
Message-ID: <54249706.9060803@tedp.id.au>
References: <541FE720.50504@canonical.com>	<54204CE7.2010502@tedp.id.au>
 <CACAvsv4gmpN62-FZifbwcFb=dTr7mMtu7K5Ga793i6rUohs=tg@mail.gmail.com>
 <542182AD.9020808@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <542182AD.9020808-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 09/23/2014 08:24 AM, Maarten Lankhorst wrote:
> Op 23-09-14 om 07:35 schreef Ben Skeggs:
>>> On 09/22/2014 03:08 AM, Maarten Lankhorst wrote:
>>>> This fixes a regression introduced by "drm/nouveau: rework to new fence interface"
>>>> (commit 29ba89b2371d466).
>>
>> I'm still seeing issues with suspend, even with this patch, and the
>> one you pastebinned recently.
>>
> Annoying, and I'm out of ideas. The pastebinned patch is posted to dri-devel as:
> [PATCH 2/8] drm/nouveau: specify if interruptible wait is desired in nouveau_fence_sync.
> 
> Could you bisect to where the suspend issues started? With this patch applied after
> "drm/nouveau: rework to new fence interface", and the other patch applied after
> "drm/nouveau: use shared fences for readable objects"

I started bisecting to track down the suspend issue, but X won't start
at all with today's dri-next tree @ d743ecf36063 ("drm/doc: Fixup
drm_irq kerneldoc includes") plus the two patches, so I'll have to get
that out of the way first.
