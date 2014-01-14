From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [Fwd: [PATCH] Fix null dereference oopses for nv40
	cards] kernel 3.13.0-rc8
Date: Tue, 14 Jan 2014 15:07:39 +1000
Message-ID: <CACAvsv41kYncW3y_atf3LhEy7k6SOf-geHfcQRFmtMQYBBRZPg@mail.gmail.com>
References: <1389669776.1320.5.camel@s2895bg>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a11c29512de79e004efe72b27
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1389669776.1320.5.camel@s2895bg>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Bob Gleitsmann <rjgleits@bellsouth.net>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

--001a11c29512de79e004efe72b27
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 14, 2014 at 1:22 PM, Bob Gleitsmann <rjgleits@bellsouth.net> wrote:
> I should have mentioned that this applies to Linus' 3.13.0-rc7 and rc8
> git. Maybe it's obvious.
Hey Bob,

Thanks for reporting this.  Can you try the attached patch instead and
report if it helps you?

Ben.

>
> Sorry about that.
>
> Bob
> -------- Forwarded Message --------
> From: Bob Gleitsmann <rjgleits@bellsouth.net>
> To: bskeggs@redhat.com
> Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
> Subject: [PATCH] Fix null dereference oopses for nv40 cards
> Date: Mon, 13 Jan 2014 01:45:36 -0500
>
> The problem affects nv40 cards during booting. It comes from there being
> two places where subdev arrays are maintained. A commit was recently
> added to make the two equal. However, the struct nouveau_device version
> ends up being referenced before it is initialized. The problem arises
> during the creation of the INSTMEM and THERM subdevs. '
>
> Signed off by: Bob Gleitsmann rjgleits@bellsouth.net
>
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c b/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
> index b10a143..0f494ca 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
> @@ -23,6 +23,7 @@
>   */
>
>  #include <engine/graph/nv40.h>
> +#include <core/device.h>
>
>  #include "nv04.h"
>
> @@ -38,6 +39,7 @@ nv40_instmem_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
>
>         ret = nouveau_instmem_create(parent, engine, oclass, &priv);
>         *pobject = nv_object(priv);
> +       device->subdev[NVDEV_SUBDEV_INSTMEM] = *pobject;
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
> index 002e51b..59b25be 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
> @@ -187,9 +187,11 @@ nv40_therm_ctor(struct nouveau_object *parent,
>  {
>         struct nv40_therm_priv *priv;
>         int ret;
> +       struct nouveau_device *device = nv_device(parent);
>
>         ret = nouveau_therm_create(parent, engine, oclass, &priv);
>         *pobject = nv_object(priv);
> +       device->subdev[NVDEV_SUBDEV_THERM] = *pobject;
>         if (ret)
>                 return ret;
>
>
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--001a11c29512de79e004efe72b27
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-fix-null-ptr-dereferences-on-some-boards.patch"
Content-Disposition: attachment;
	filename="0001-fix-null-ptr-dereferences-on-some-boards.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hqep9vfl0

RnJvbSBhNzk4MTFmMTU5MjUyODFkYzdmZTE3OTc0MzBlNTEwNjM3MDdjNzJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkRhdGU6
IFR1ZSwgMTQgSmFuIDIwMTQgMTQ6NTY6MjIgKzEwMDAKU3ViamVjdDogW1BBVENIXSBmaXggbnVs
bCBwdHIgZGVyZWZlcmVuY2VzIG9uIHNvbWUgYm9hcmRzCgpSZWdyZXNzaW9uIGZyb20gImRldmlj
ZTogcG9wdWxhdGUgbWFzdGVyIHN1YmRldiBwb2ludGVyIG9ubHkgd2hlbiBmdWxseQpjb25zdHJ1
Y3RlZCIKClJlcG9ydGVkLWJ5OiBCb2IgR2xlaXRzbWFubiA8cmpnbGVpdHNAYmVsbHNvdXRoLm5l
dD4KU2lnbmVkLW9mZi1ieTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgotLS0KIG52
a20vaW5jbHVkZS9zdWJkZXYvaW5zdG1lbS5oIHwgNyArKysrKysrCiBudmttL3N1YmRldi90aGVy
bS9pYy5jICAgICAgICB8IDMgKystCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL252a20vaW5jbHVkZS9zdWJkZXYvaW5zdG1lbS5o
IGIvbnZrbS9pbmNsdWRlL3N1YmRldi9pbnN0bWVtLmgKaW5kZXggZTQwYjI2Yy4uYzFkZjI2ZiAx
MDA2NDQKLS0tIGEvbnZrbS9pbmNsdWRlL3N1YmRldi9pbnN0bWVtLmgKKysrIGIvbnZrbS9pbmNs
dWRlL3N1YmRldi9pbnN0bWVtLmgKQEAgLTM1LDYgKzM1LDEzIEBAIHN0cnVjdCBub3V2ZWF1X2lu
c3RtZW0gewogc3RhdGljIGlubGluZSBzdHJ1Y3Qgbm91dmVhdV9pbnN0bWVtICoKIG5vdXZlYXVf
aW5zdG1lbSh2b2lkICpvYmopCiB7CisJLyogbnYwNC9udjQwIGltcGxzIG5lZWQgdG8gY3JlYXRl
IG9iamVjdHMgaW4gdGhlaXIgY29uc3RydWN0b3IsCisJICogd2hpY2ggaXMgYmVmb3JlIHRoZSBz
dWJkZXYgcG9pbnRlciBpcyB2YWxpZAorCSAqLworCWlmIChudl9pY2xhc3Mob2JqLCBOVl9TVUJE
RVZfQ0xBU1MpICYmCisJICAgIG52X3N1YmlkeChvYmopID09IE5WREVWX1NVQkRFVl9JTlNUTUVN
KQorCQlyZXR1cm4gb2JqOworCiAJcmV0dXJuICh2b2lkICopbnZfZGV2aWNlKG9iaiktPnN1YmRl
dltOVkRFVl9TVUJERVZfSU5TVE1FTV07CiB9CiAKZGlmZiAtLWdpdCBhL252a20vc3ViZGV2L3Ro
ZXJtL2ljLmMgYi9udmttL3N1YmRldi90aGVybS9pYy5jCmluZGV4IGU0NGVkN2IuLjhjMjZmZjEg
MTAwNjQ0Ci0tLSBhL252a20vc3ViZGV2L3RoZXJtL2ljLmMKKysrIGIvbnZrbS9zdWJkZXYvdGhl
cm0vaWMuYwpAQCAtMzEsNyArMzEsOCBAQCBzdGF0aWMgYm9vbAogcHJvYmVfbW9uaXRvcmluZ19k
ZXZpY2Uoc3RydWN0IG5vdXZlYXVfaTJjX3BvcnQgKmkyYywKIAkJCXN0cnVjdCBpMmNfYm9hcmRf
aW5mbyAqaW5mbykKIHsKLQlzdHJ1Y3Qgbm91dmVhdV90aGVybV9wcml2ICpwcml2ID0gKHZvaWQg
Kilub3V2ZWF1X3RoZXJtKGkyYyk7CisJc3RydWN0IG5vdXZlYXVfdGhlcm1fcHJpdiAqcHJpdiA9
CisJCSh2b2lkICopbnZfcGNsYXNzKGkyYywgTlZfU1VCREVWX0NMQVNTKTsKIAlzdHJ1Y3QgbnZi
aW9zX3RoZXJtX3NlbnNvciAqc2Vuc29yID0gJnByaXYtPmJpb3Nfc2Vuc29yOwogCXN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQ7CiAKLS0gCjEuOC41LjIKCg==
--001a11c29512de79e004efe72b27
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--001a11c29512de79e004efe72b27--
