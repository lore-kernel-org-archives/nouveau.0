From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
Subject: Re: [PATCH 1/3] nouveau: Do not BUG_ON(!spin_is_locked()) on UP
Date: Mon, 12 Jan 2015 20:00:41 +0100
Message-ID: <20150112200041.3819da0a@neptune.home>
References: <20141221174331.3647ac49@neptune.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20141221174331.3647ac49@neptune.home>
Sender: stable-owner@vger.kernel.org
To: stable@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Nouveau List <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Hi Greg, stable team,

Please apply this patch to stable (3.18 and 3.17).

It is commit ff4c0d5213b015e60aa87c1352604f10ba9c3e12 in linus's tree:
  http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dff4c0d5213b015e60aa87c1352604f10ba9c3e12


Thanks,
Bruno

On Sun, 21 December 2014 Bruno Pr=C3=A9mont wrote:
> On !SMP systems spinlocks do not exist. Thus checking of they
> are active will always fail.
>=20
> Use
>   assert_spin_locked(lock);
> instead of
>   BUG_ON(!spin_is_locked(lock));
> to not BUG() on all UP systems.
>=20
> Signed-off-by: Bruno Pr=C3=A9mont <bonbons@linux-vserver.org>
> ---
> See also fdo bug #87552
>=20
>  drivers/gpu/drm/nouveau/core/core/event.c  | 4 ++--
>  drivers/gpu/drm/nouveau/core/core/notify.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/core/core/event.c b/drivers/gpu/=
drm/nouveau/core/core/event.c
> index ff2b434..760947e 100644
> --- a/drivers/gpu/drm/nouveau/core/core/event.c
> +++ b/drivers/gpu/drm/nouveau/core/core/event.c
> @@ -26,7 +26,7 @@
>  void
>  nvkm_event_put(struct nvkm_event *event, u32 types, int index)
>  {
> -	BUG_ON(!spin_is_locked(&event->refs_lock));
> +	assert_spin_locked(&event->refs_lock);
>  	while (types) {
>  		int type =3D __ffs(types); types &=3D ~(1 << type);
>  		if (--event->refs[index * event->types_nr + type] =3D=3D 0) {
> @@ -39,7 +39,7 @@ nvkm_event_put(struct nvkm_event *event, u32 types,=
 int index)
>  void
>  nvkm_event_get(struct nvkm_event *event, u32 types, int index)
>  {
> -	BUG_ON(!spin_is_locked(&event->refs_lock));
> +	assert_spin_locked(&event->refs_lock);
>  	while (types) {
>  		int type =3D __ffs(types); types &=3D ~(1 << type);
>  		if (++event->refs[index * event->types_nr + type] =3D=3D 1) {
> diff --git a/drivers/gpu/drm/nouveau/core/core/notify.c b/drivers/gpu=
/drm/nouveau/core/core/notify.c
> index d1bcde5..839a325 100644
> --- a/drivers/gpu/drm/nouveau/core/core/notify.c
> +++ b/drivers/gpu/drm/nouveau/core/core/notify.c
> @@ -98,7 +98,7 @@ nvkm_notify_send(struct nvkm_notify *notify, void *=
data, u32 size)
>  	struct nvkm_event *event =3D notify->event;
>  	unsigned long flags;
> =20
> -	BUG_ON(!spin_is_locked(&event->list_lock));
> +	assert_spin_locked(&event->list_lock);
>  	BUG_ON(size !=3D notify->size);
> =20
>  	spin_lock_irqsave(&event->refs_lock, flags);
