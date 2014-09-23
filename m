From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH] drm/nv84+: fix fence context seqno's
Date: Tue, 23 Sep 2014 16:24:45 +0200
Message-ID: <542182AD.9020808@canonical.com>
References: <541FE720.50504@canonical.com>	<54204CE7.2010502@tedp.id.au>
 <CACAvsv4gmpN62-FZifbwcFb=dTr7mMtu7K5Ga793i6rUohs=tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv4gmpN62-FZifbwcFb=dTr7mMtu7K5Ga793i6rUohs=tg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ted Percival <ted-QSfhGDxlWt8QrrorzV6ljw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Op 23-09-14 om 07:35 schreef Ben Skeggs:
> On Tue, Sep 23, 2014 at 2:23 AM, Ted Percival <ted-QSfhGDxlWt8QrrorzV6ljw@public.gmane.org> wrote:
>> On 09/22/2014 03:08 AM, Maarten Lankhorst wrote:
>>> This fixes a regression introduced by "drm/nouveau: rework to new fence interface"
>>> (commit 29ba89b2371d466).
>>>
>>> The fence sequence should not be reset after creation, the old value is used instead.
>>> On destruction the final value is written, to prevent another source of accidental
>>> wraparound in case of a channel being destroyed after a hang, and unblocking any other
>>> channel that may wait on the about-to-be-deleted channel to signal.
>>>
>>> I'm nothing if not optimistic about any hope of recovery from that. ;-)
>>>
>>> Reported-by: Ted Percival <ted-QSfhGDxlWt8QrrorzV6ljw@public.gmane.org>
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> Acked-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> I'm still seeing issues with suspend, even with this patch, and the
> one you pastebinned recently.
>
Annoying, and I'm out of ideas. The pastebinned patch is posted to dri-devel as:
[PATCH 2/8] drm/nouveau: specify if interruptible wait is desired in nouveau_fence_sync.

Could you bisect to where the suspend issues started? With this patch applied after
"drm/nouveau: rework to new fence interface", and the other patch applied after
"drm/nouveau: use shared fences for readable objects"

~Maarten
