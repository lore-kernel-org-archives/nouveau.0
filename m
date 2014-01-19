From: Andreas Reis <andreas.reis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] devinit: lock/unlock crtc regs for all
	devices, not just pre-nv50
Date: Sun, 19 Jan 2014 19:46:34 +0100
Message-ID: <CAM_hTGFAGrJZWX-hHK7=F6DbCXDdBRHKR3SWL6z3roNS+R8PmQ@mail.gmail.com>
References: <1390123095-2032-1-git-send-email-imirkin@alum.mit.edu>
	<CAKb7UvhYBqky6ueYK7NBA7zJW-9w=FTCuKz1ajzcn2a4KAFspw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a11c128c6c8e95304f05731fa
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhYBqky6ueYK7NBA7zJW-9w=FTCuKz1ajzcn2a4KAFspw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--001a11c128c6c8e95304f05731fa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

No problem. I applied the patch (plus the other for the MXM issue),
replaced the preexisting nouveau.ko.gz in /lib/mod/=E2=80=A6 with the new
gzipped one, and rebuilt the initramfs. (With an updated DRIVER_DATE
define just to be sure.)

The HDMI output works fine.

Attached are the dmesg outputs before and after, grepped for
'nouveau'. As you can see, there's no real change.

On Sun, Jan 19, 2014 at 5:14 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> On Sun, Jan 19, 2014 at 4:18 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote=
:
>> Also make nv_lockvgac work for nv50+ devices. This should fix IO_CONDITI=
ON and
>> related VBIOS opcodes that read/write the crtc regs.
>>
>> See https://bugs.freedesktop.org/show_bug.cgi?id=3D60680
>>
>> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
>> ---
>>
>> Ben, is this what you had in mind? I haven't gotten a chance to test thi=
s yet
>> since your tree doesn't build against mine (which is largely based on
>> nouveau/linux-2.6 master + drm-nouveau-next patches merged in). Somethin=
g
>> about nouveau_acpi/backlight.
>>
>> Pekka, mind testing this out and see if it also fixes your issue? Grab B=
en's
>> tree at http://cgit.freedesktop.org/~darktama/nouveau/ and apply this pa=
tch,
>> and build against a late 3.13-rcX release, I guess. (Still haven't figur=
ed out
>> which tree I need to have for this stuff to build.)
>>
>> ./autogen.sh; cd drm; make
>>
>> should generate a nouveau.ko against your currently-running kernel.
>
> Andreas -- you had the same issue as Pekka, would you mind testing
> this out? I'm not sure when he'll be able to give it a shot. This is
> an alternate way of resolving the issue that produces itself as HDMI
> output not working. You can get a pristine copy of the patch at
> http://lists.freedesktop.org/archives/nouveau/2014-January/015770.html
> -- but do note the instructions above, as it applies to a different
> repo.
>
>>
>>  nvkm/engine/disp/vga.c     |  9 +++++++--
>>  nvkm/subdev/devinit/base.c | 14 ++++++++++++++
>>  nvkm/subdev/devinit/nv04.c | 13 ++++++++-----
>>  nvkm/subdev/devinit/priv.h |  8 +++++---
>>  4 files changed, 34 insertions(+), 10 deletions(-)
>>
>> diff --git a/nvkm/engine/disp/vga.c b/nvkm/engine/disp/vga.c
>> index 5a1c684..8836c3c 100644
>> --- a/nvkm/engine/disp/vga.c
>> +++ b/nvkm/engine/disp/vga.c
>> @@ -138,10 +138,15 @@ nv_wrvgai(void *obj, int head, u16 port, u8 index,=
 u8 value)
>>  bool
>>  nv_lockvgac(void *obj, bool lock)
>>  {
>> +       struct nouveau_device *dev =3D nv_device(obj);
>> +
>>         bool locked =3D !nv_rdvgac(obj, 0, 0x1f);
>>         u8 data =3D lock ? 0x99 : 0x57;
>> -       nv_wrvgac(obj, 0, 0x1f, data);
>> -       if (nv_device(obj)->chipset =3D=3D 0x11) {
>> +       if (dev->card_type < NV_50)
>> +               nv_wrvgac(obj, 0, 0x1f, data);
>> +       else
>> +               nv_wrvgac(obj, 0, 0x3f, data);
>> +       if (dev->chipset =3D=3D 0x11) {
>>                 if (!(nv_rd32(obj, 0x001084) & 0x10000000))
>>                         nv_wrvgac(obj, 1, 0x1f, data);
>>         }
>> diff --git a/nvkm/subdev/devinit/base.c b/nvkm/subdev/devinit/base.c
>> index 6b23d9a..a4df3fa 100644
>> --- a/nvkm/subdev/devinit/base.c
>> +++ b/nvkm/subdev/devinit/base.c
>> @@ -26,6 +26,7 @@
>>
>>  #include <subdev/bios.h>
>>  #include <subdev/bios/init.h>
>> +#include <subdev/vga.h>
>>
>>  #include "priv.h"
>>
>> @@ -38,6 +39,9 @@ _nouveau_devinit_fini(struct nouveau_object *object, b=
ool suspend)
>>         if (suspend)
>>                 devinit->post =3D true;
>>
>> +       /* unlock the extended vga crtc regs */
>> +       nv_lockvgac(devinit, false);
>> +
>>         return nouveau_subdev_fini(&devinit->base, suspend);
>>  }
>>
>> @@ -61,6 +65,16 @@ _nouveau_devinit_init(struct nouveau_object *object)
>>         return 0;
>>  }
>>
>> +void
>> +_nouveau_devinit_dtor(struct nouveau_object *object)
>> +{
>> +       struct nouveau_devinit *devinit =3D (void *)object;
>> +
>> +       /* lock crtc regs */
>> +       nv_lockvgac(devinit, true);
>> +       nouveau_subdev_destroy(&devinit->base);
>> +}
>> +
>>  int
>>  nouveau_devinit_create_(struct nouveau_object *parent,
>>                         struct nouveau_object *engine,
>> diff --git a/nvkm/subdev/devinit/nv04.c b/nvkm/subdev/devinit/nv04.c
>> index 24025e4..7037eae 100644
>> --- a/nvkm/subdev/devinit/nv04.c
>> +++ b/nvkm/subdev/devinit/nv04.c
>> @@ -388,17 +388,21 @@ int
>>  nv04_devinit_fini(struct nouveau_object *object, bool suspend)
>>  {
>>         struct nv04_devinit_priv *priv =3D (void *)object;
>> +       int ret;
>>
>>         /* make i2c busses accessible */
>>         nv_mask(priv, 0x000200, 0x00000001, 0x00000001);
>>
>> -       /* unlock extended vga crtc regs, and unslave crtcs */
>> -       nv_lockvgac(priv, false);
>> +       ret =3D nouveau_devinit_fini(&priv->base, suspend);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* unslave crtcs */
>>         if (priv->owner < 0)
>>                 priv->owner =3D nv_rdvgaowner(priv);
>>         nv_wrvgaowner(priv, 0);
>>
>> -       return nouveau_devinit_fini(&priv->base, suspend);
>> +       return 0;
>>  }
>>
>>  int
>> @@ -426,9 +430,8 @@ nv04_devinit_dtor(struct nouveau_object *object)
>>  {
>>         struct nv04_devinit_priv *priv =3D (void *)object;
>>
>> -       /* restore vga owner saved at first init, and lock crtc regs  */
>> +       /* restore vga owner saved at first init */
>>         nv_wrvgaowner(priv, priv->owner);
>> -       nv_lockvgac(priv, true);
>>
>>         nouveau_devinit_destroy(&priv->base);
>>  }
>> diff --git a/nvkm/subdev/devinit/priv.h b/nvkm/subdev/devinit/priv.h
>> index c4179b6..822a2fb 100644
>> --- a/nvkm/subdev/devinit/priv.h
>> +++ b/nvkm/subdev/devinit/priv.h
>> @@ -15,8 +15,10 @@ struct nouveau_devinit_impl {
>>
>>  #define nouveau_devinit_create(p,e,o,d)                                =
        \
>>         nouveau_devinit_create_((p), (e), (o), sizeof(**d), (void **)d)
>> -#define nouveau_devinit_destroy(p)                                     =
        \
>> -       nouveau_subdev_destroy(&(p)->base)
>> +#define nouveau_devinit_destroy(p) ({                                  =
        \
>> +       struct nouveau_devinit *d =3D (p);                              =
         \
>> +       _nouveau_devinit_dtor(nv_object(d));                            =
       \
>> +})
>>  #define nouveau_devinit_init(p) ({                                     =
        \
>>         struct nouveau_devinit *d =3D (p);                              =
         \
>>         _nouveau_devinit_init(nv_object(d));                            =
       \
>> @@ -28,7 +30,7 @@ struct nouveau_devinit_impl {
>>
>>  int nouveau_devinit_create_(struct nouveau_object *, struct nouveau_obj=
ect *,
>>                             struct nouveau_oclass *, int, void **);
>> -#define _nouveau_devinit_dtor _nouveau_subdev_dtor
>> +void _nouveau_devinit_dtor(struct nouveau_object *);
>>  int _nouveau_devinit_init(struct nouveau_object *);
>>  int _nouveau_devinit_fini(struct nouveau_object *, bool suspend);
>>
>> --
>> 1.8.3.2
>>

--001a11c128c6c8e95304f05731fa
Content-Type: application/octet-stream; name=dmesg_nouveau_new
Content-Disposition: attachment; filename=dmesg_nouveau_new
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hqmnoku90

WyAgICAwLjY0OTAwN10gbm91dmVhdTogdW5rbm93biBwYXJhbWV0ZXIgJ21zaScgaWdub3JlZApb
ICAgIDAuNjUwMzc2XSBub3V2ZWF1ICBbICBERVZJQ0VdWzAwMDA6MDE6MDAuMF0gQk9PVDAgIDog
MHgwOTY0ODBhMQpbICAgIDAuNjUwMzc5XSBub3V2ZWF1ICBbICBERVZJQ0VdWzAwMDA6MDE6MDAu
MF0gQ2hpcHNldDogRzk2IChOVjk2KQpbICAgIDAuNjUwMzgxXSBub3V2ZWF1ICBbICBERVZJQ0Vd
WzAwMDA6MDE6MDAuMF0gRmFtaWx5IDogTlY1MApbICAgIDAuNjUyMjIyXSBub3V2ZWF1ICBbICAg
VkJJT1NdWzAwMDA6MDE6MDAuMF0gY2hlY2tpbmcgUFJBTUlOIGZvciBpbWFnZS4uLgpbICAgIDAu
NzUxMzcyXSBub3V2ZWF1ICBbICAgVkJJT1NdWzAwMDA6MDE6MDAuMF0gLi4uIGFwcGVhcnMgdG8g
YmUgdmFsaWQKWyAgICAwLjc1MTM3NF0gbm91dmVhdSAgWyAgIFZCSU9TXVswMDAwOjAxOjAwLjBd
IHVzaW5nIGltYWdlIGZyb20gUFJBTUlOClsgICAgMC43NTE1NDldIG5vdXZlYXUgIFsgICBWQklP
U11bMDAwMDowMTowMC4wXSBCSVQgc2lnbmF0dXJlIGZvdW5kClsgICAgMC43NTE1NTJdIG5vdXZl
YXUgIFsgICBWQklPU11bMDAwMDowMTowMC4wXSB2ZXJzaW9uIDYyLjk0LjM4LjAwLjA0ClsgICAg
MC43NzIxNzVdIG5vdXZlYXUgIFsgICAgIE1YTV1bMDAwMDowMTowMC4wXSBCSU9TIHZlcnNpb24g
Mi4xClsgICAgMC43OTgzMzRdIG5vdXZlYXUgIFsgICAgIE1YTV1bMDAwMDowMTowMC4wXSBNWE1T
IFZlcnNpb24gMi4xClsgICAgMC43OTgzNTBdIG5vdXZlYXUgIFsgICAgIE1YTV1bMDAwMDowMTow
MC4wXSB1bm1hdGNoZWQgb3V0cHV0IGRldmljZSAweDk2MDA2NDAzZTgwNjAxMDAKWyAgICAwLjc5
ODM1Ml0gbm91dmVhdSAgWyAgICAgTVhNXVswMDAwOjAxOjAwLjBdIHVubWF0Y2hlZCBvdXRwdXQg
ZGV2aWNlIDB4MDAwMDAwNDEwMDAwOTYwMApbICAgIDAuNzk4NDA0XSBub3V2ZWF1IDAwMDA6MDE6
MDAuMDogaXJxIDQ1IGZvciBNU0kvTVNJLVgKWyAgICAwLjc5ODQyMl0gbm91dmVhdSAgWyAgICAg
UE1DXVswMDAwOjAxOjAwLjBdIE1TSSBpbnRlcnJ1cHRzIGVuYWJsZWQKWyAgICAwLjc5ODQ3MV0g
bm91dmVhdSAgWyAgICAgUEZCXVswMDAwOjAxOjAwLjBdIFJBTSB0eXBlOiBHRERSMwpbICAgIDAu
Nzk4NDczXSBub3V2ZWF1ICBbICAgICBQRkJdWzAwMDA6MDE6MDAuMF0gUkFNIHNpemU6IDUxMiBN
aUIKWyAgICAwLjc5ODQ3NV0gbm91dmVhdSAgWyAgICAgUEZCXVswMDAwOjAxOjAwLjBdICAgIFpD
T01QOiAyMDQ4IHRhZ3MKWyAgICAwLjgwMzcxNl0gbm91dmVhdSAgWyAgICBWT0xUXVswMDAwOjAx
OjAwLjBdIEdQVSB2b2x0YWdlOiA4OTAwMDB1dgpbICAgIDAuODM2NTIwXSBub3V2ZWF1ICBbICBQ
VEhFUk1dWzAwMDA6MDE6MDAuMF0gRkFOIGNvbnRyb2w6IG5vbmUgLyBleHRlcm5hbApbICAgIDAu
ODM2NTI4XSBub3V2ZWF1ICBbICBQVEhFUk1dWzAwMDA6MDE6MDAuMF0gZmFuIG1hbmFnZW1lbnQ6
IGF1dG9tYXRpYwpbICAgIDAuODM2NTM4XSBub3V2ZWF1ICBbICBQVEhFUk1dWzAwMDA6MDE6MDAu
MF0gaW50ZXJuYWwgc2Vuc29yOiB5ZXMKWyAgICAwLjgzNjU0M10gbm91dmVhdSAgWyAgICAgQ0xL
XVswMDAwOjAxOjAwLjBdIDAzOiBjb3JlIDE2OSBNSHogc2hhZGVyIDMzOCBNSHogbWVtb3J5IDEw
MCBNSHoKWyAgICAwLjgzNjU0N10gbm91dmVhdSAgWyAgICAgQ0xLXVswMDAwOjAxOjAwLjBdIDA1
OiBjb3JlIDI3NSBNSHogc2hhZGVyIDU1MCBNSHogbWVtb3J5IDMwMCBNSHoKWyAgICAwLjgzNjU1
MF0gbm91dmVhdSAgWyAgICAgQ0xLXVswMDAwOjAxOjAwLjBdIDA3OiBjb3JlIDQwMCBNSHogc2hh
ZGVyIDgwMCBNSHogbWVtb3J5IDMwMCBNSHoKWyAgICAwLjgzNjU1M10gbm91dmVhdSAgWyAgICAg
Q0xLXVswMDAwOjAxOjAwLjBdIDBmOiBjb3JlIDUwMCBNSHogc2hhZGVyIDEyNTAgTUh6IG1lbW9y
eSA4MDAgTUh6ClsgICAgMC44MzY2NjRdIG5vdXZlYXUgIFsgICAgIENMS11bMDAwMDowMTowMC4w
XSAtLTogY29yZSAyNzUgTUh6IHNoYWRlciA1NTAgTUh6IG1lbW9yeSAzMDAgTUh6ClsgICAgMC44
MzY4ODBdIG5vdXZlYXUgIFsgICAgIERSTV0gVlJBTTogNTEyIE1pQgpbICAgIDAuODM2ODgyXSBu
b3V2ZWF1ICBbICAgICBEUk1dIEdBUlQ6IDEwNDg1NzYgTWlCClsgICAgMC44MzY4ODVdIG5vdXZl
YXUgIFsgICAgIERSTV0gVE1EUyB0YWJsZSB2ZXJzaW9uIDIuMApbICAgIDAuODM2ODg2XSBub3V2
ZWF1ICBbICAgICBEUk1dIERDQiB2ZXJzaW9uIDQuMApbICAgIDAuODM2ODg4XSBub3V2ZWF1ICBb
ICAgICBEUk1dIERDQiBvdXRwIDAwOiAwMTAwMDMyMyAwMDAxMDAzNApbICAgIDAuODM2ODkwXSBu
b3V2ZWF1ICBbICAgICBEUk1dIERDQiBvdXRwIDAyOiAwNDAxMTMxMiAwMDAyMDAxMApbICAgIDAu
ODM2ODkyXSBub3V2ZWF1ICBbICAgICBEUk1dIERDQiBvdXRwIDA0OiAwNDAzMzM4NiAwZjIyMDAy
MApbICAgIDAuODM2ODk0XSBub3V2ZWF1ICBbICAgICBEUk1dIERDQiBvdXRwIDA1OiAwNDAzMzM4
MiAwMDAyMDAyMApbICAgIDAuODM2ODk2XSBub3V2ZWF1ICBbICAgICBEUk1dIERDQiBvdXRwIDA2
OiAwMjA0NDMwMCAwMDAwMDAyOApbICAgIDAuODM2ODk4XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDAwOiAwMDAwMDA0MApbICAgIDAuODM2OTAwXSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDAxOiAwMDAwMTEzMQpbICAgIDAuODM2OTAyXSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDAyOiAwMDAwMjIzMQpbICAgIDAuODM2OTA0XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDAzOiAwMDExMDM0NgpbICAgIDAuODM2OTA1XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDA0OiAwMDAwMDQwMApbICAgIDAuODM2OTA3XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDA1OiAwMDAwMDUxMApbICAgIDAuODM2OTA5XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDA2OiAwMDAwMDUxMQpbICAgIDAuODM2OTEwXSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDA3OiAwMDAwMDUxMwpbICAgIDAuODM2OTEyXSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDA4OiAwMDAwMjYzMQpbICAgIDAuODM2OTE0XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDA5OiAwMDAwMTczMQpbICAgIDAuODM2OTE1XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDEwOiAwMDAwMjgzMQpbICAgIDAuODM2OTE3XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDExOiAwMDExMDk0NgpbICAgIDAuODM2OTE5XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDEyOiAwMDAwMGEwMApbICAgIDAuODM2OTIwXSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDEzOiAwMDAwMGIxMApbICAgIDAuODM2OTIyXSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDE0OiAwMDAwMGIxMQpbICAgIDAuODM2OTI0XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDE1OiAwMDAwMGIxMwpbICAgIDAuODY2MTA4XSBub3V2ZWF1ICBbICAgICBEUk1dIE1N
OiB1c2luZyBDUllQVCBmb3IgYnVmZmVyIGNvcGllcwpbICAgIDAuOTg2MjI1XSBub3V2ZWF1ICBb
ICAgICBEUk1dIGFsbG9jYXRlZCAxOTIweDEwODAgZmI6IDB4NzAwMDAsIGJvIGZmZmY4ODAwYmI5
ZGU0MDAKWyAgICAwLjk4NjI3OV0gZmJjb246IG5vdXZlYXVmYiAoZmIwKSBpcyBwcmltYXJ5IGRl
dmljZQpbICAgIDIuMzc0MDc5XSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmIwOiBub3V2ZWF1ZmIg
ZnJhbWUgYnVmZmVyIGRldmljZQpbICAgIDIuMzc0MDgxXSBub3V2ZWF1IDAwMDA6MDE6MDAuMDog
cmVnaXN0ZXJlZCBwYW5pYyBub3RpZmllcgpbICAgIDIuMzc0MDg1XSBbZHJtXSBJbml0aWFsaXpl
ZCBub3V2ZWF1IDEuMS4xIDIwMTQwMTE5IGZvciAwMDAwOjAxOjAwLjAgb24gbWlub3IgMAo=
--001a11c128c6c8e95304f05731fa
Content-Type: application/octet-stream; name=dmesg_nouveau_old
Content-Disposition: attachment; filename=dmesg_nouveau_old
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hqmnokuj1

WyAgICAwLjY0ODc0N10gbm91dmVhdTogdW5rbm93biBwYXJhbWV0ZXIgJ21zaScgaWdub3JlZApb
ICAgIDAuNjUwMTMwXSBub3V2ZWF1ICBbICBERVZJQ0VdWzAwMDA6MDE6MDAuMF0gQk9PVDAgIDog
MHgwOTY0ODBhMQpbICAgIDAuNjUwMTMzXSBub3V2ZWF1ICBbICBERVZJQ0VdWzAwMDA6MDE6MDAu
MF0gQ2hpcHNldDogRzk2IChOVjk2KQpbICAgIDAuNjUwMTM1XSBub3V2ZWF1ICBbICBERVZJQ0Vd
WzAwMDA6MDE6MDAuMF0gRmFtaWx5IDogTlY1MApbICAgIDAuNjUxOTYzXSBub3V2ZWF1ICBbICAg
VkJJT1NdWzAwMDA6MDE6MDAuMF0gY2hlY2tpbmcgUFJBTUlOIGZvciBpbWFnZS4uLgpbICAgIDAu
NzUwMzQzXSBub3V2ZWF1ICBbICAgVkJJT1NdWzAwMDA6MDE6MDAuMF0gLi4uIGFwcGVhcnMgdG8g
YmUgdmFsaWQKWyAgICAwLjc1MDM0NV0gbm91dmVhdSAgWyAgIFZCSU9TXVswMDAwOjAxOjAwLjBd
IHVzaW5nIGltYWdlIGZyb20gUFJBTUlOClsgICAgMC43NTA0OThdIG5vdXZlYXUgIFsgICBWQklP
U11bMDAwMDowMTowMC4wXSBCSVQgc2lnbmF0dXJlIGZvdW5kClsgICAgMC43NTA1MDBdIG5vdXZl
YXUgIFsgICBWQklPU11bMDAwMDowMTowMC4wXSB2ZXJzaW9uIDYyLjk0LjM4LjAwLjA0ClsgICAg
MC43NzA4MjldIG5vdXZlYXUgIFsgICAgIE1YTV1bMDAwMDowMTowMC4wXSBCSU9TIHZlcnNpb24g
Mi4xClsgICAgMC43NzcwMDRdIG5vdXZlYXUgIFsgICAgIE1YTV1bMDAwMDowMTowMC4wXSBNWE1T
IFZlcnNpb24gMi4xClsgICAgMC43NzcwMjBdIG5vdXZlYXUgIFsgICAgIE1YTV1bMDAwMDowMTow
MC4wXSB1bm1hdGNoZWQgb3V0cHV0IGRldmljZSAweDk2MDA2NDAzZTgwNjAxMDAKWyAgICAwLjc3
NzAyMl0gbm91dmVhdSAgWyAgICAgTVhNXVswMDAwOjAxOjAwLjBdIHVubWF0Y2hlZCBvdXRwdXQg
ZGV2aWNlIDB4MDAwMDAwNDEwMDAwOTYwMApbICAgIDAuNzc3MDczXSBub3V2ZWF1IDAwMDA6MDE6
MDAuMDogaXJxIDQ1IGZvciBNU0kvTVNJLVgKWyAgICAwLjc3NzA5MF0gbm91dmVhdSAgWyAgICAg
UE1DXVswMDAwOjAxOjAwLjBdIE1TSSBpbnRlcnJ1cHRzIGVuYWJsZWQKWyAgICAwLjc3NzEzM10g
bm91dmVhdSAgWyAgICAgUEZCXVswMDAwOjAxOjAwLjBdIFJBTSB0eXBlOiBHRERSMwpbICAgIDAu
Nzc3MTM1XSBub3V2ZWF1ICBbICAgICBQRkJdWzAwMDA6MDE6MDAuMF0gUkFNIHNpemU6IDUxMiBN
aUIKWyAgICAwLjc3NzEzN10gbm91dmVhdSAgWyAgICAgUEZCXVswMDAwOjAxOjAwLjBdICAgIFpD
T01QOiAyMDQ4IHRhZ3MKWyAgICAwLjc4MjI5N10gbm91dmVhdSAgWyAgICBWT0xUXVswMDAwOjAx
OjAwLjBdIEdQVSB2b2x0YWdlOiA4OTAwMDB1dgpbICAgIDAuODE1MDg2XSBub3V2ZWF1ICBbICBQ
VEhFUk1dWzAwMDA6MDE6MDAuMF0gRkFOIGNvbnRyb2w6IG5vbmUgLyBleHRlcm5hbApbICAgIDAu
ODE1MDk0XSBub3V2ZWF1ICBbICBQVEhFUk1dWzAwMDA6MDE6MDAuMF0gZmFuIG1hbmFnZW1lbnQ6
IGF1dG9tYXRpYwpbICAgIDAuODE1MTAzXSBub3V2ZWF1ICBbICBQVEhFUk1dWzAwMDA6MDE6MDAu
MF0gaW50ZXJuYWwgc2Vuc29yOiB5ZXMKWyAgICAwLjgxNTEwOV0gbm91dmVhdSAgWyAgICAgQ0xL
XVswMDAwOjAxOjAwLjBdIDAzOiBjb3JlIDE2OSBNSHogc2hhZGVyIDMzOCBNSHogbWVtb3J5IDEw
MCBNSHoKWyAgICAwLjgxNTExMl0gbm91dmVhdSAgWyAgICAgQ0xLXVswMDAwOjAxOjAwLjBdIDA1
OiBjb3JlIDI3NSBNSHogc2hhZGVyIDU1MCBNSHogbWVtb3J5IDMwMCBNSHoKWyAgICAwLjgxNTEx
NV0gbm91dmVhdSAgWyAgICAgQ0xLXVswMDAwOjAxOjAwLjBdIDA3OiBjb3JlIDQwMCBNSHogc2hh
ZGVyIDgwMCBNSHogbWVtb3J5IDMwMCBNSHoKWyAgICAwLjgxNTExOF0gbm91dmVhdSAgWyAgICAg
Q0xLXVswMDAwOjAxOjAwLjBdIDBmOiBjb3JlIDUwMCBNSHogc2hhZGVyIDEyNTAgTUh6IG1lbW9y
eSA4MDAgTUh6ClsgICAgMC44MTUyMjJdIG5vdXZlYXUgIFsgICAgIENMS11bMDAwMDowMTowMC4w
XSAtLTogY29yZSAyNzUgTUh6IHNoYWRlciA1NTAgTUh6IG1lbW9yeSAzMDAgTUh6ClsgICAgMC44
MTU0MzZdIG5vdXZlYXUgIFsgICAgIERSTV0gVlJBTTogNTEyIE1pQgpbICAgIDAuODE1NDM3XSBu
b3V2ZWF1ICBbICAgICBEUk1dIEdBUlQ6IDEwNDg1NzYgTWlCClsgICAgMC44MTU0NDBdIG5vdXZl
YXUgIFsgICAgIERSTV0gVE1EUyB0YWJsZSB2ZXJzaW9uIDIuMApbICAgIDAuODE1NDQyXSBub3V2
ZWF1ICBbICAgICBEUk1dIERDQiB2ZXJzaW9uIDQuMApbICAgIDAuODE1NDQ0XSBub3V2ZWF1ICBb
ICAgICBEUk1dIERDQiBvdXRwIDAwOiAwMTAwMDMyMyAwMDAxMDAzNApbICAgIDAuODE1NDQ2XSBu
b3V2ZWF1ICBbICAgICBEUk1dIERDQiBvdXRwIDAyOiAwNDAxMTMxMiAwMDAyMDAxMApbICAgIDAu
ODE1NDQ4XSBub3V2ZWF1ICBbICAgICBEUk1dIERDQiBvdXRwIDA0OiAwNDAzMzM4NiAwZjIyMDAy
MApbICAgIDAuODE1NDQ5XSBub3V2ZWF1ICBbICAgICBEUk1dIERDQiBvdXRwIDA1OiAwNDAzMzM4
MiAwMDAyMDAyMApbICAgIDAuODE1NDUxXSBub3V2ZWF1ICBbICAgICBEUk1dIERDQiBvdXRwIDA2
OiAwMjA0NDMwMCAwMDAwMDAyOApbICAgIDAuODE1NDUzXSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDAwOiAwMDAwMDA0MApbICAgIDAuODE1NDU1XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDAxOiAwMDAwMTEzMQpbICAgIDAuODE1NDU3XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDAyOiAwMDAwMjIzMQpbICAgIDAuODE1NDU5XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDAzOiAwMDExMDM0NgpbICAgIDAuODE1NDYxXSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDA0OiAwMDAwMDQwMApbICAgIDAuODE1NDYyXSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDA1OiAwMDAwMDUxMApbICAgIDAuODE1NDY0XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDA2OiAwMDAwMDUxMQpbICAgIDAuODE1NDY2XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDA3OiAwMDAwMDUxMwpbICAgIDAuODE1NDY3XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDA4OiAwMDAwMjYzMQpbICAgIDAuODE1NDY5XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDA5OiAwMDAwMTczMQpbICAgIDAuODE1NDcxXSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDEwOiAwMDAwMjgzMQpbICAgIDAuODE1NDcyXSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDExOiAwMDExMDk0NgpbICAgIDAuODE1NDc0XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDEyOiAwMDAwMGEwMApbICAgIDAuODE1NDc2XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDEzOiAwMDAwMGIxMApbICAgIDAuODE1NDc3XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDE0OiAwMDAwMGIxMQpbICAgIDAuODE1NDc5XSBub3V2ZWF1ICBbICAgICBEUk1dIERD
QiBjb25uIDE1OiAwMDAwMGIxMwpbICAgIDAuODQ0NzcwXSBub3V2ZWF1ICBbICAgICBEUk1dIE1N
OiB1c2luZyBDUllQVCBmb3IgYnVmZmVyIGNvcGllcwpbICAgIDAuOTY0ODAzXSBub3V2ZWF1ICBb
ICAgICBEUk1dIGFsbG9jYXRlZCAxOTIweDEwODAgZmI6IDB4NzAwMDAsIGJvIGZmZmY4ODAwYmI5
YTFjMDAKWyAgICAwLjk2NDg1OF0gZmJjb246IG5vdXZlYXVmYiAoZmIwKSBpcyBwcmltYXJ5IGRl
dmljZQpbICAgIDIuMzU3ODkzXSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmIwOiBub3V2ZWF1ZmIg
ZnJhbWUgYnVmZmVyIGRldmljZQpbICAgIDIuMzU3ODk1XSBub3V2ZWF1IDAwMDA6MDE6MDAuMDog
cmVnaXN0ZXJlZCBwYW5pYyBub3RpZmllcgpbICAgIDIuMzU3ODk5XSBbZHJtXSBJbml0aWFsaXpl
ZCBub3V2ZWF1IDEuMS4xIDIwMTIwODAxIGZvciAwMDAwOjAxOjAwLjAgb24gbWlub3IgMAo=
--001a11c128c6c8e95304f05731fa
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--001a11c128c6c8e95304f05731fa--
