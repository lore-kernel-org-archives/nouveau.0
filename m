From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Fwd: [PATCH] Fix null dereference oopses for nv40
 cards] kernel 3.13.0-rc8
Date: Tue, 14 Jan 2014 15:15:53 +1000
Message-ID: <CACAvsv7-3nLH=47oXCXkP3PGP+UXrBgHyW1qy-YjXq41xf_e+Q@mail.gmail.com>
References: <1389669776.1320.5.camel@s2895bg>
	<CACAvsv41kYncW3y_atf3LhEy7k6SOf-geHfcQRFmtMQYBBRZPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a1133d6ee4d2f6104efe7494c
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv41kYncW3y_atf3LhEy7k6SOf-geHfcQRFmtMQYBBRZPg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Bob Gleitsmann <rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--001a1133d6ee4d2f6104efe7494c
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 14, 2014 at 3:07 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Jan 14, 2014 at 1:22 PM, Bob Gleitsmann <rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org> wrote:
>> I should have mentioned that this applies to Linus' 3.13.0-rc7 and rc8
>> git. Maybe it's obvious.
> Hey Bob,
>
> Thanks for reporting this.  Can you try the attached patch instead and
> report if it helps you?
Thinko in first attempt, new one attached.

>
> Ben.
>
>>
>> Sorry about that.
>>
>> Bob
>> -------- Forwarded Message --------
>> From: Bob Gleitsmann <rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org>
>> To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
>> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> Subject: [PATCH] Fix null dereference oopses for nv40 cards
>> Date: Mon, 13 Jan 2014 01:45:36 -0500
>>
>> The problem affects nv40 cards during booting. It comes from there being
>> two places where subdev arrays are maintained. A commit was recently
>> added to make the two equal. However, the struct nouveau_device version
>> ends up being referenced before it is initialized. The problem arises
>> during the creation of the INSTMEM and THERM subdevs. '
>>
>> Signed off by: Bob Gleitsmann rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org
>>
>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c b/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
>> index b10a143..0f494ca 100644
>> --- a/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
>> +++ b/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
>> @@ -23,6 +23,7 @@
>>   */
>>
>>  #include <engine/graph/nv40.h>
>> +#include <core/device.h>
>>
>>  #include "nv04.h"
>>
>> @@ -38,6 +39,7 @@ nv40_instmem_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
>>
>>         ret = nouveau_instmem_create(parent, engine, oclass, &priv);
>>         *pobject = nv_object(priv);
>> +       device->subdev[NVDEV_SUBDEV_INSTMEM] = *pobject;
>>         if (ret)
>>                 return ret;
>>
>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
>> index 002e51b..59b25be 100644
>> --- a/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
>> +++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
>> @@ -187,9 +187,11 @@ nv40_therm_ctor(struct nouveau_object *parent,
>>  {
>>         struct nv40_therm_priv *priv;
>>         int ret;
>> +       struct nouveau_device *device = nv_device(parent);
>>
>>         ret = nouveau_therm_create(parent, engine, oclass, &priv);
>>         *pobject = nv_object(priv);
>> +       device->subdev[NVDEV_SUBDEV_THERM] = *pobject;
>>         if (ret)
>>                 return ret;
>>
>>
>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau

--001a1133d6ee4d2f6104efe7494c
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-fix-null-ptr-dereferences-on-some-boards.patch"
Content-Disposition: attachment;
	filename="0001-fix-null-ptr-dereferences-on-some-boards.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hqepkl211

RnJvbSAyZjQwYmNkODkwYWE5ZDg2MWM3ZTI2YjQ4Njc1ODBmNTg4MzZkOGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkRhdGU6
IFR1ZSwgMTQgSmFuIDIwMTQgMTQ6NTY6MjIgKzEwMDAKU3ViamVjdDogW1BBVENIXSBmaXggbnVs
bCBwdHIgZGVyZWZlcmVuY2VzIG9uIHNvbWUgYm9hcmRzCgpSZWdyZXNzaW9uIGZyb20gImRldmlj
ZTogcG9wdWxhdGUgbWFzdGVyIHN1YmRldiBwb2ludGVyIG9ubHkgd2hlbiBmdWxseQpjb25zdHJ1
Y3RlZCIKClJlcG9ydGVkLWJ5OiBCb2IgR2xlaXRzbWFubiA8cmpnbGVpdHNAYmVsbHNvdXRoLm5l
dD4KU2lnbmVkLW9mZi1ieTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgotLS0KIGRy
bS9kaXNwbnYwNC9kZnAuYyAgICAgICAgICAgIHwgIDIgKy0KIGRybS9kaXNwbnYwNC90dm52MDQu
YyAgICAgICAgIHwgIDIgKy0KIG52a20vaW5jbHVkZS9zdWJkZXYvaTJjLmggICAgIHwgIDIgKy0K
IG52a20vaW5jbHVkZS9zdWJkZXYvaW5zdG1lbS5oIHwgIDcgKysrKysrKwogbnZrbS9zdWJkZXYv
aTJjL2Jhc2UuYyAgICAgICAgfCAgNCArKy0tCiBudmttL3N1YmRldi90aGVybS9pYy5jICAgICAg
ICB8IDEwICsrKysrLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJtL2Rpc3BudjA0L2RmcC5jIGIvZHJtL2Rpc3Bu
djA0L2RmcC5jCmluZGV4IDkzNmE3MWMuLjdmZGM1MWUgMTAwNjQ0Ci0tLSBhL2RybS9kaXNwbnYw
NC9kZnAuYworKysgYi9kcm0vZGlzcG52MDQvZGZwLmMKQEAgLTY0Myw3ICs2NDMsNyBAQCBzdGF0
aWMgdm9pZCBudjA0X3RtZHNfc2xhdmVfaW5pdChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIp
CiAJICAgIGdldF90bWRzX3NsYXZlKGVuY29kZXIpKQogCQlyZXR1cm47CiAKLQl0eXBlID0gaTJj
LT5pZGVudGlmeShpMmMsIDIsICJUTURTIHRyYW5zbWl0dGVyIiwgaW5mbywgTlVMTCk7CisJdHlw
ZSA9IGkyYy0+aWRlbnRpZnkoaTJjLCAyLCAiVE1EUyB0cmFuc21pdHRlciIsIGluZm8sIE5VTEws
IE5VTEwpOwogCWlmICh0eXBlIDwgMCkKIAkJcmV0dXJuOwogCmRpZmYgLS1naXQgYS9kcm0vZGlz
cG52MDQvdHZudjA0LmMgYi9kcm0vZGlzcG52MDQvdHZudjA0LmMKaW5kZXggY2M0YjIwOC4uMjQ0
ODIyZCAxMDA2NDQKLS0tIGEvZHJtL2Rpc3BudjA0L3R2bnYwNC5jCisrKyBiL2RybS9kaXNwbnYw
NC90dm52MDQuYwpAQCAtNTksNyArNTksNyBAQCBpbnQgbnYwNF90dl9pZGVudGlmeShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCBpbnQgaTJjX2luZGV4KQogCXN0cnVjdCBub3V2ZWF1X2kyYyAqaTJj
ID0gbm91dmVhdV9pMmMoZHJtLT5kZXZpY2UpOwogCiAJcmV0dXJuIGkyYy0+aWRlbnRpZnkoaTJj
LCBpMmNfaW5kZXgsICJUViBlbmNvZGVyIiwKLQkJCSAgICAgbnYwNF90dl9lbmNvZGVyX2luZm8s
IE5VTEwpOworCQkJICAgICBudjA0X3R2X2VuY29kZXJfaW5mbywgTlVMTCwgTlVMTCk7CiB9CiAK
IApkaWZmIC0tZ2l0IGEvbnZrbS9pbmNsdWRlL3N1YmRldi9pMmMuaCBiL252a20vaW5jbHVkZS9z
dWJkZXYvaTJjLmgKaW5kZXggOWZhNWRhNy4uN2Y1MGE4NSAxMDA2NDQKLS0tIGEvbnZrbS9pbmNs
dWRlL3N1YmRldi9pMmMuaAorKysgYi9udmttL2luY2x1ZGUvc3ViZGV2L2kyYy5oCkBAIC03Myw3
ICs3Myw3IEBAIHN0cnVjdCBub3V2ZWF1X2kyYyB7CiAJaW50ICgqaWRlbnRpZnkpKHN0cnVjdCBu
b3V2ZWF1X2kyYyAqLCBpbnQgaW5kZXgsCiAJCQljb25zdCBjaGFyICp3aGF0LCBzdHJ1Y3Qgbm91
dmVhdV9pMmNfYm9hcmRfaW5mbyAqLAogCQkJYm9vbCAoKm1hdGNoKShzdHJ1Y3Qgbm91dmVhdV9p
MmNfcG9ydCAqLAotCQkJCSAgICAgIHN0cnVjdCBpMmNfYm9hcmRfaW5mbyAqKSk7CisJCQkJICAg
ICAgc3RydWN0IGkyY19ib2FyZF9pbmZvICosIHZvaWQgKiksIHZvaWQgKik7CiAJc3RydWN0IGxp
c3RfaGVhZCBwb3J0czsKIH07CiAKZGlmZiAtLWdpdCBhL252a20vaW5jbHVkZS9zdWJkZXYvaW5z
dG1lbS5oIGIvbnZrbS9pbmNsdWRlL3N1YmRldi9pbnN0bWVtLmgKaW5kZXggZTQwYjI2Yy4uYzFk
ZjI2ZiAxMDA2NDQKLS0tIGEvbnZrbS9pbmNsdWRlL3N1YmRldi9pbnN0bWVtLmgKKysrIGIvbnZr
bS9pbmNsdWRlL3N1YmRldi9pbnN0bWVtLmgKQEAgLTM1LDYgKzM1LDEzIEBAIHN0cnVjdCBub3V2
ZWF1X2luc3RtZW0gewogc3RhdGljIGlubGluZSBzdHJ1Y3Qgbm91dmVhdV9pbnN0bWVtICoKIG5v
dXZlYXVfaW5zdG1lbSh2b2lkICpvYmopCiB7CisJLyogbnYwNC9udjQwIGltcGxzIG5lZWQgdG8g
Y3JlYXRlIG9iamVjdHMgaW4gdGhlaXIgY29uc3RydWN0b3IsCisJICogd2hpY2ggaXMgYmVmb3Jl
IHRoZSBzdWJkZXYgcG9pbnRlciBpcyB2YWxpZAorCSAqLworCWlmIChudl9pY2xhc3Mob2JqLCBO
Vl9TVUJERVZfQ0xBU1MpICYmCisJICAgIG52X3N1YmlkeChvYmopID09IE5WREVWX1NVQkRFVl9J
TlNUTUVNKQorCQlyZXR1cm4gb2JqOworCiAJcmV0dXJuICh2b2lkICopbnZfZGV2aWNlKG9iaikt
PnN1YmRldltOVkRFVl9TVUJERVZfSU5TVE1FTV07CiB9CiAKZGlmZiAtLWdpdCBhL252a20vc3Vi
ZGV2L2kyYy9iYXNlLmMgYi9udmttL3N1YmRldi9pMmMvYmFzZS5jCmluZGV4IDA0MWZkNWUuLmMz
M2MwM2QgMTAwNjQ0Ci0tLSBhL252a20vc3ViZGV2L2kyYy9iYXNlLmMKKysrIGIvbnZrbS9zdWJk
ZXYvaTJjL2Jhc2UuYwpAQCAtMTk3LDcgKzE5Nyw3IEBAIHN0YXRpYyBpbnQKIG5vdXZlYXVfaTJj
X2lkZW50aWZ5KHN0cnVjdCBub3V2ZWF1X2kyYyAqaTJjLCBpbnQgaW5kZXgsIGNvbnN0IGNoYXIg
KndoYXQsCiAJCSAgICAgc3RydWN0IG5vdXZlYXVfaTJjX2JvYXJkX2luZm8gKmluZm8sCiAJCSAg
ICAgYm9vbCAoKm1hdGNoKShzdHJ1Y3Qgbm91dmVhdV9pMmNfcG9ydCAqLAotCQkJCSAgIHN0cnVj
dCBpMmNfYm9hcmRfaW5mbyAqKSkKKwkJCQkgICBzdHJ1Y3QgaTJjX2JvYXJkX2luZm8gKiwgdm9p
ZCAqKSwgdm9pZCAqZGF0YSkKIHsKIAlzdHJ1Y3Qgbm91dmVhdV9pMmNfcG9ydCAqcG9ydCA9IG5v
dXZlYXVfaTJjX2ZpbmQoaTJjLCBpbmRleCk7CiAJaW50IGk7CkBAIC0yMjEsNyArMjIxLDcgQEAg
bm91dmVhdV9pMmNfaWRlbnRpZnkoc3RydWN0IG5vdXZlYXVfaTJjICppMmMsIGludCBpbmRleCwg
Y29uc3QgY2hhciAqd2hhdCwKIAkJfQogCiAJCWlmIChudl9wcm9iZV9pMmMocG9ydCwgaW5mb1tp
XS5kZXYuYWRkcikgJiYKLQkJICAgICghbWF0Y2ggfHwgbWF0Y2gocG9ydCwgJmluZm9baV0uZGV2
KSkpIHsKKwkJICAgICghbWF0Y2ggfHwgbWF0Y2gocG9ydCwgJmluZm9baV0uZGV2LCBkYXRhKSkp
IHsKIAkJCW52X2luZm8oaTJjLCAiZGV0ZWN0ZWQgJXM6ICVzXG4iLCB3aGF0LAogCQkJCWluZm9b
aV0uZGV2LnR5cGUpOwogCQkJcmV0dXJuIGk7CmRpZmYgLS1naXQgYS9udmttL3N1YmRldi90aGVy
bS9pYy5jIGIvbnZrbS9zdWJkZXYvdGhlcm0vaWMuYwppbmRleCBlNDRlZDdiLi43NjEwZmM1IDEw
MDY0NAotLS0gYS9udmttL3N1YmRldi90aGVybS9pYy5jCisrKyBiL252a20vc3ViZGV2L3RoZXJt
L2ljLmMKQEAgLTI5LDkgKzI5LDkgQEAKIAogc3RhdGljIGJvb2wKIHByb2JlX21vbml0b3Jpbmdf
ZGV2aWNlKHN0cnVjdCBub3V2ZWF1X2kyY19wb3J0ICppMmMsCi0JCQlzdHJ1Y3QgaTJjX2JvYXJk
X2luZm8gKmluZm8pCisJCQlzdHJ1Y3QgaTJjX2JvYXJkX2luZm8gKmluZm8sIHZvaWQgKmRhdGEp
CiB7Ci0Jc3RydWN0IG5vdXZlYXVfdGhlcm1fcHJpdiAqcHJpdiA9ICh2b2lkICopbm91dmVhdV90
aGVybShpMmMpOworCXN0cnVjdCBub3V2ZWF1X3RoZXJtX3ByaXYgKnByaXYgPSBkYXRhOwogCXN0
cnVjdCBudmJpb3NfdGhlcm1fc2Vuc29yICpzZW5zb3IgPSAmcHJpdi0+Ymlvc19zZW5zb3I7CiAJ
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudDsKIApAQCAtOTYsNyArOTYsNyBAQCBub3V2ZWF1X3Ro
ZXJtX2ljX2N0b3Ioc3RydWN0IG5vdXZlYXVfdGhlcm0gKnRoZXJtKQogCQl9OwogCiAJCWkyYy0+
aWRlbnRpZnkoaTJjLCBOVl9JMkNfREVGQVVMVCgwKSwgIm1vbml0b3JpbmcgZGV2aWNlIiwKLQkJ
CQkgIGJvYXJkLCBwcm9iZV9tb25pdG9yaW5nX2RldmljZSk7CisJCQkgICAgICBib2FyZCwgcHJv
YmVfbW9uaXRvcmluZ19kZXZpY2UsIHRoZXJtKTsKIAkJaWYgKHByaXYtPmljKQogCQkJcmV0dXJu
OwogCX0KQEAgLTEwOCw3ICsxMDgsNyBAQCBub3V2ZWF1X3RoZXJtX2ljX2N0b3Ioc3RydWN0IG5v
dXZlYXVfdGhlcm0gKnRoZXJtKQogCQl9OwogCiAJCWkyYy0+aWRlbnRpZnkoaTJjLCBOVl9JMkNf
REVGQVVMVCgwKSwgIm1vbml0b3JpbmcgZGV2aWNlIiwKLQkJCQkgIGJvYXJkLCBwcm9iZV9tb25p
dG9yaW5nX2RldmljZSk7CisJCQkgICAgICBib2FyZCwgcHJvYmVfbW9uaXRvcmluZ19kZXZpY2Us
IHRoZXJtKTsKIAkJaWYgKHByaXYtPmljKQogCQkJcmV0dXJuOwogCX0KQEAgLTExNyw1ICsxMTcs
NSBAQCBub3V2ZWF1X3RoZXJtX2ljX2N0b3Ioc3RydWN0IG5vdXZlYXVfdGhlcm0gKnRoZXJtKQog
CSAgIGRldmljZS4gTGV0J3MgdHJ5IG91ciBzdGF0aWMgbGlzdC4KIAkgKi8KIAlpMmMtPmlkZW50
aWZ5KGkyYywgTlZfSTJDX0RFRkFVTFQoMCksICJtb25pdG9yaW5nIGRldmljZSIsCi0JCSAgICAg
IG52X2JvYXJkX2luZm9zLCBwcm9iZV9tb25pdG9yaW5nX2RldmljZSk7CisJCSAgICAgIG52X2Jv
YXJkX2luZm9zLCBwcm9iZV9tb25pdG9yaW5nX2RldmljZSwgdGhlcm0pOwogfQotLSAKMS44LjUu
MgoK
--001a1133d6ee4d2f6104efe7494c
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--001a1133d6ee4d2f6104efe7494c--
