From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [mesa v2 5/9] nouveau: fix screen creation failure
 paths
Date: Mon, 7 Dec 2015 13:57:02 +1000
Message-ID: <5665038E.4020905@redhat.com>
References: <1448586301-8351-1-git-send-email-skeggsb@gmail.com>
 <1448586301-8351-5-git-send-email-skeggsb@gmail.com>
 <CAKb7UvjwbztKvR3-PaUA+8=A+NZqBzCeP1KT7AfrNLq4HQsReQ@mail.gmail.com>
 <566501AA.9010600@gmail.com>
 <CAKb7Uvj_3wzh19C+TPe9c_1QJuGgU=JwrZeasjswZ4uM3JcoiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1078711342=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvj_3wzh19C+TPe9c_1QJuGgU=JwrZeasjswZ4uM3JcoiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1078711342==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="k31rMNTd4Cpfrx9GJb1WhQGhnKotiroCQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--k31rMNTd4Cpfrx9GJb1WhQGhnKotiroCQ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/07/2015 01:53 PM, Ilia Mirkin wrote:
> On Sun, Dec 6, 2015 at 10:48 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 12/07/2015 01:40 PM, Ilia Mirkin wrote:
>>> This all seems very roundabout... Can't we do this in a somewhat
>>> consistent way with the device being cleaned up in one place or
>>> another but not both?
>> That would be lovely, but not possible.  It has to be cleaned up by th=
e
>> pipe screen destroy() function, as that's the normal exit path.  If th=
e
>> pipe driver creation path fails before it's got a struct, then the
>> winsys will have to clean up after itself instead.
>=20
> Couldn't you make the pipe_screen_create() function destroy the device
> in all failure paths?
Probably.  I guess that's slightly nicer, I'll re-spin them shortly.

>=20
>>
>>>
>>> On Thu, Nov 26, 2015 at 8:04 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
>>>> From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>>>
>>>> The winsys layer would attempt to cleanup the nouveau_device if scre=
en
>>>> init failed, however, in most paths the pipe driver would have alrea=
dy
>>>> destroyed it, resulting in accesses to freed memory etc.
>>>>
>>>> This commit fixes the problem by allowing the winsys to detect wheth=
er
>>>> the pipe driver's destroy function needs to be called or not.
>>>>
>>>> Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>  src/gallium/drivers/nouveau/nouveau_screen.c        |  8 ++++++--
>>>>  src/gallium/drivers/nouveau/nv30/nv30_screen.c      | 19 ++++++++++=
---------
>>>>  src/gallium/drivers/nouveau/nv50/nv50_screen.c      |  6 +++---
>>>>  src/gallium/drivers/nouveau/nvc0/nvc0_screen.c      |  9 ++++-----
>>>>  src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c | 16 ++++++++++=
------
>>>>  5 files changed, 33 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gall=
ium/drivers/nouveau/nouveau_screen.c
>>>> index a012579..3cdcc20 100644
>>>> --- a/src/gallium/drivers/nouveau/nouveau_screen.c
>>>> +++ b/src/gallium/drivers/nouveau/nouveau_screen.c
>>>> @@ -147,6 +147,12 @@ nouveau_screen_init(struct nouveau_screen *scre=
en, struct nouveau_device *dev)
>>>>     if (nv_dbg)
>>>>        nouveau_mesa_debug =3D atoi(nv_dbg);
>>>>
>>>> +   /* These must be set before any failure is possible, as the clea=
nup
>>>> +    * paths assume they're responsible for deleting them.
>>>> +    */
>>>> +   screen->drm =3D nouveau_drm(&dev->object);
>>>> +   screen->device =3D dev;
>>>> +
>>>>     /*
>>>>      * this is initialized to 1 in nouveau_drm_screen_create after s=
creen
>>>>      * is fully constructed and added to the global screen list.
>>>> @@ -175,8 +181,6 @@ nouveau_screen_init(struct nouveau_screen *scree=
n, struct nouveau_device *dev)
>>>>                              data, size, &screen->channel);
>>>>     if (ret)
>>>>        return ret;
>>>> -   screen->drm =3D nouveau_drm(&dev->object);
>>>> -   screen->device =3D dev;
>>>>
>>>>     ret =3D nouveau_client_new(screen->device, &screen->client);
>>>>     if (ret)
>>>> diff --git a/src/gallium/drivers/nouveau/nv30/nv30_screen.c b/src/ga=
llium/drivers/nouveau/nv30/nv30_screen.c
>>>> index ea29811..854f70c 100644
>>>> --- a/src/gallium/drivers/nouveau/nv30/nv30_screen.c
>>>> +++ b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
>>>> @@ -413,23 +413,20 @@ nv30_screen_destroy(struct pipe_screen *pscree=
n)
>>>>  #define FAIL_SCREEN_INIT(str, err)                    \
>>>>     do {                                               \
>>>>        NOUVEAU_ERR(str, err);                          \
>>>> -      nv30_screen_destroy(pscreen);                   \
>>>> -      return NULL;                                    \
>>>> +      screen->base.base.context_create =3D NULL;        \
>>>> +      return &screen->base;                           \
>>>>     } while(0)
>>>>
>>>>  struct nouveau_screen *
>>>>  nv30_screen_create(struct nouveau_device *dev)
>>>>  {
>>>> -   struct nv30_screen *screen =3D CALLOC_STRUCT(nv30_screen);
>>>> +   struct nv30_screen *screen;
>>>>     struct pipe_screen *pscreen;
>>>>     struct nouveau_pushbuf *push;
>>>>     struct nv04_fifo *fifo;
>>>>     unsigned oclass =3D 0;
>>>>     int ret, i;
>>>>
>>>> -   if (!screen)
>>>> -      return NULL;
>>>> -
>>>>     switch (dev->chipset & 0xf0) {
>>>>     case 0x30:
>>>>        if (RANKINE_0397_CHIPSET & (1 << (dev->chipset & 0x0f)))
>>>> @@ -458,10 +455,16 @@ nv30_screen_create(struct nouveau_device *dev)=

>>>>
>>>>     if (!oclass) {
>>>>        NOUVEAU_ERR("unknown 3d class for 0x%02x\n", dev->chipset);
>>>> -      FREE(screen);
>>>>        return NULL;
>>>>     }
>>>>
>>>> +   screen =3D CALLOC_STRUCT(nv30_screen);
>>>> +   if (!screen)
>>>> +      return NULL;
>>>> +
>>>> +   pscreen =3D &screen->base.base;
>>>> +   pscreen->destroy =3D nv30_screen_destroy;
>>>> +
>>>>     /*
>>>>      * Some modern apps try to use msaa without keeping in mind the
>>>>      * restrictions on videomem of older cards. Resulting in dmesg s=
aying:
>>>> @@ -479,8 +482,6 @@ nv30_screen_create(struct nouveau_device *dev)
>>>>     if (screen->max_sample_count > 4)
>>>>        screen->max_sample_count =3D 4;
>>>>
>>>> -   pscreen =3D &screen->base.base;
>>>> -   pscreen->destroy =3D nv30_screen_destroy;
>>>>     pscreen->get_param =3D nv30_screen_get_param;
>>>>     pscreen->get_paramf =3D nv30_screen_get_paramf;
>>>>     pscreen->get_shader_param =3D nv30_screen_get_shader_param;
>>>> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/ga=
llium/drivers/nouveau/nv50/nv50_screen.c
>>>> index 82b9e93..46c812b 100644
>>>> --- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
>>>> +++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
>>>> @@ -762,6 +762,7 @@ nv50_screen_create(struct nouveau_device *dev)
>>>>     if (!screen)
>>>>        return NULL;
>>>>     pscreen =3D &screen->base.base;
>>>> +   pscreen->destroy =3D nv50_screen_destroy;
>>>>
>>>>     ret =3D nouveau_screen_init(&screen->base, dev);
>>>>     if (ret) {
>>>> @@ -782,7 +783,6 @@ nv50_screen_create(struct nouveau_device *dev)
>>>>
>>>>     chan =3D screen->base.channel;
>>>>
>>>> -   pscreen->destroy =3D nv50_screen_destroy;
>>>>     pscreen->context_create =3D nv50_create;
>>>>     pscreen->is_format_supported =3D nv50_screen_is_format_supported=
;
>>>>     pscreen->get_param =3D nv50_screen_get_param;
>>>> @@ -964,8 +964,8 @@ nv50_screen_create(struct nouveau_device *dev)
>>>>     return &screen->base;
>>>>
>>>>  fail:
>>>> -   nv50_screen_destroy(pscreen);
>>>> -   return NULL;
>>>> +   screen->base.base.context_create =3D NULL;
>>>> +   return &screen->base;
>>>>  }
>>>>
>>>>  int
>>>> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/ga=
llium/drivers/nouveau/nvc0/nvc0_screen.c
>>>> index e45031a..4897ebe 100644
>>>> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>>>> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
>>>> @@ -617,8 +617,7 @@ nvc0_screen_resize_tls_area(struct nvc0_screen *=
screen,
>>>>  #define FAIL_SCREEN_INIT(str, err)                    \
>>>>     do {                                               \
>>>>        NOUVEAU_ERR(str, err);                          \
>>>> -      nvc0_screen_destroy(pscreen);                   \
>>>> -      return NULL;                                    \
>>>> +      goto fail;                                      \
>>>>     } while(0)
>>>>
>>>>  struct nouveau_screen *
>>>> @@ -650,6 +649,7 @@ nvc0_screen_create(struct nouveau_device *dev)
>>>>     if (!screen)
>>>>        return NULL;
>>>>     pscreen =3D &screen->base.base;
>>>> +   pscreen->destroy =3D nvc0_screen_destroy;
>>>>
>>>>     ret =3D nouveau_screen_init(&screen->base, dev);
>>>>     if (ret) {
>>>> @@ -672,7 +672,6 @@ nvc0_screen_create(struct nouveau_device *dev)
>>>>        screen->base.vidmem_bindings =3D 0;
>>>>     }
>>>>
>>>> -   pscreen->destroy =3D nvc0_screen_destroy;
>>>>     pscreen->context_create =3D nvc0_create;
>>>>     pscreen->is_format_supported =3D nvc0_screen_is_format_supported=
;
>>>>     pscreen->get_param =3D nvc0_screen_get_param;
>>>> @@ -1065,8 +1064,8 @@ nvc0_screen_create(struct nouveau_device *dev)=

>>>>     return &screen->base;
>>>>
>>>>  fail:
>>>> -   nvc0_screen_destroy(pscreen);
>>>> -   return NULL;
>>>> +   screen->base.base.context_create =3D NULL;
>>>> +   return &screen->base;
>>>>  }
>>>>
>>>>  int
>>>> diff --git a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c b/s=
rc/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
>>>> index e117dfc..456530d 100644
>>>> --- a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
>>>> +++ b/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
>>>> @@ -59,7 +59,7 @@ nouveau_drm_screen_create(int fd)
>>>>  {
>>>>         struct nouveau_device *dev =3D NULL;
>>>>         struct nouveau_screen *(*init)(struct nouveau_device *);
>>>> -       struct nouveau_screen *screen;
>>>> +       struct nouveau_screen *screen =3D NULL;
>>>>         int ret, dupfd =3D -1;
>>>>
>>>>         pipe_mutex_lock(nouveau_screen_mutex);
>>>> @@ -117,7 +117,7 @@ nouveau_drm_screen_create(int fd)
>>>>         }
>>>>
>>>>         screen =3D init(dev);
>>>> -       if (!screen)
>>>> +       if (!screen || !screen->base.context_create)
>>>>                 goto err;
>>>>
>>>>         /* Use dupfd in hash table, to avoid errors if the original =
fd gets
>>>> @@ -130,10 +130,14 @@ nouveau_drm_screen_create(int fd)
>>>>         return &screen->base;
>>>>
>>>>  err:
>>>> -       if (dev)
>>>> -               nouveau_device_del(&dev);
>>>> -       else if (dupfd >=3D 0)
>>>> -               close(dupfd);
>>>> +       if (screen) {
>>>> +               screen->base.destroy(&screen->base);
>>>> +       } else {
>>>> +               if (dev)
>>>> +                       nouveau_device_del(&dev);
>>>> +               else if (dupfd >=3D 0)
>>>> +                       close(dupfd);
>>>> +       }
>>>>         pipe_mutex_unlock(nouveau_screen_mutex);
>>>>         return NULL;
>>>>  }
>>>> --
>>>> 2.6.3
>>>>
>>>> _______________________________________________
>>>> Nouveau mailing list
>>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>


--k31rMNTd4Cpfrx9GJb1WhQGhnKotiroCQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWZQOOAAoJEHYLnGJQkpH7pI8P+wfzljrzVVCoVl+a3su4QTdq
QFRMliPju98ICteObLQsTSnwFvxe81xpM254aLkmtbF2kMZoneBYoUGsImvgNtfG
PnF3FdAuxk6kXoT11pmJgwzXsUR1EYJMfQCQQVt/ivs9nGC4f4MvfrlXLET8e90g
uFWA2ya01JBMQziJtNIaiBimHUxy+3F5KDGEx129oWJZKeEgTF0jiuAEVw9LWrE/
eTmn8EXxzRGRSCKRXeJPy9UjT7iWLhLKhuVzsDVlVp2XAF6Wgj2/A3klbWkdhojz
L+JsQqUJUqOARB9f3zEjta0Yk4au1xcfoZr5kPQFcKqyCmb1thVeWCRT5KVmSRfd
/szlVnGoDpxj73Skqyia7yhAShv4EHe1FOmeJoCc6TkzUIUOaldkYfh2L703q1ke
Ggochz+2jE+GRrc2DTv9OPJrvAuExps6mYB+2MYWAz7LB69VqewG25dmhGBAS6SH
vx2sIWvET9CNq7FobcIkuguTS3q1XWcacTKICACrMqKHAEr2jTAOimJ0gFjbU1Uu
6VMDHBKTYB+SLIIqdbWh3kpH1U7oaEsxAQO64TmwVlBj7noHSng/CtXn1BxKsjRn
bVo8LV/tWcih4CYJzCl1Y5fTpiQDKbWF2Wgwb0kIucwYJJ9PvBCAM6MF7iCF1QOQ
mwyUH7KK4+cFmwKQP53p
=4asM
-----END PGP SIGNATURE-----

--k31rMNTd4Cpfrx9GJb1WhQGhnKotiroCQ--

--===============1078711342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1078711342==--
