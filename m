From: poma <pomidorabelisima@gmail.com>
Subject: Re: [PATCH] drm/nouveau: Fix pre-nv50 pageflip events (v4)
Date: Tue, 15 Dec 2015 12:11:40 +0100
Message-ID: <566FF56C.8000803@gmail.com>
References: <1447173451-27890-1-git-send-email-thierry.reding@gmail.com>
 <20151110164139.GA27962@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20151110164139.GA27962@ulmo>
Sender: stable-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, stable@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Mario Kleiner <mario.kleiner.de@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>, russianneuromancer@ya.ru, Ikey Doherty <ikey@solus-project.com>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, Thierry Reding <treding@nvidia.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On 10.11.2015 17:41, Thierry Reding wrote:
> On Tue, Nov 10, 2015 at 05:37:31PM +0100, Thierry Reding wrote:
>> From: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> Apparently pre-nv50 pageflip events happen before the actual vblank
>> period. Therefore that functionality got semi-disabled in
>>
>> commit af4870e406126b7ac0ae7c7ce5751f25ebe60f28
>> Author: Mario Kleiner <mario.kleiner.de@gmail.com>
>> Date:   Tue May 13 00:42:08 2014 +0200
>>
>>     drm/nouveau/kms/nv04-nv40: fix pageflip events via special case.
>>
>> Unfortunately that hack got uprooted in
>>
>> commit cc1ef118fc099295ae6aabbacc8af94d8d8885eb
>> Author: Thierry Reding <treding@nvidia.com>
>> Date:   Wed Aug 12 17:00:31 2015 +0200
>>
>>     drm/irq: Make pipe unsigned and name consistent
>>
>> Triggering a warning when trying to sample the vblank timestamp for =
a
>> non-existing pipe. There's a few ways to fix this:
>>
>> - Open-code the old behaviour, which just enshrines this slight
>>   breakage of the userspace ABI.
>>
>> - Revert Mario's commit and again inflict broken timestamps, again n=
ot
>>   pretty.
>>
>> - Fix this for real by delaying the pageflip TS until the next vblan=
k
>>   interrupt, thereby making it accurate.
>>
>> This patch implements the third option. Since having a page flip
>> interrupt that happens when the pageflip gets armed and not when it
>> completes in the next vblank seems to be fairly common (older i915 h=
w
>> works very similarly) create a new helper to arm vblank events for
>> such drivers.
>>
>> v2 (Mario Kleiner):
>> - Fix function prototypes in drmP.h
>> - Add missing vblank_put() for pageflip completion without
>>   pageflip event.
>> - Initialize sequence number for queued pageflip event to avoid
>>   trouble in drm_handle_vblank_events().
>> - Remove dead code and spelling fix.
>>
>> v3 (Mario Kleiner):
>> - Add a signed-off-by and cc stable tag per Ilja's advice.
>>
>> v4 (Thierry Reding):
>> - Fix kerneldoc typo, discovered by Michel D=C3=A4nzer
>> - Rearrange tags and changelog
>>
>> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D106431
>> Cc: Thierry Reding <treding@nvidia.com>
>> Cc: Mario Kleiner <mario.kleiner.de@gmail.com>
>> Cc: Ben Skeggs <bskeggs@redhat.com>
>> Cc: Ilia Mirkin <imirkin@alum.mit.edu>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Reviewed-by: Mario Kleiner <mario.kleiner.de@gmail.com>
>> Cc: stable@vger.kernel.org # v4.3
>> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  drivers/gpu/drm/drm_irq.c                 | 54 ++++++++++++++++++++=
++++++++++-
>>  drivers/gpu/drm/nouveau/nouveau_display.c | 19 ++++++-----
>>  include/drm/drmP.h                        |  4 +++
>>  3 files changed, 68 insertions(+), 9 deletions(-)
>=20
> Hi Dave,
>=20
> It'd be great if you could queue this up for fixes, since it gets rid=
 of
> a WARN_ON() that is triggered on a number of cards in v4.3. I realize
> that this is a tad big for stable, but it's the right way to fix this=
=2E
> If you'd prefer something smaller, I think we can fix the regression
> using a one-line band-aid and then apply this one on top for v4.4.
>=20
> Thierry
>=20


Apparently not reached @stable (stable:	4.3.3 2015-12-15),
so here's one more time.
