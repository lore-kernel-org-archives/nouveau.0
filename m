From: Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: mesa: nvfx is broken seems to have undefined.
Date: Fri, 7 Jan 2011 21:10:34 +0100
Message-ID: <AANLkTinP3+Z3Ex_ohoNdBsdF6d-vLMQEiy2KX0H08BKU@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0023547c8a870548610499473685
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--0023547c8a870548610499473685
Content-Type: text/plain; charset=UTF-8

Hi,

It seems that 58c5e782e351621bde2693fa945d0c90d140b855 breaks nvfx and
expose a bug in nvfx_set_constant_buffer.
We should use pipe_resource_reference instead of a direct assignation,
from greping there is no other assignation so the patch should be
enought.

Cheers,
   Michel

--0023547c8a870548610499473685
Content-Type: application/octet-stream;
	name="0001-nvfx-Fix-constant-resource-reference-assignation.patch"
Content-Disposition: attachment;
	filename="0001-nvfx-Fix-constant-resource-reference-assignation.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ginipzv30

RnJvbSA2NDM3OWZlNDNkOTQxZTc5ZTFkNmU2ZDc1ZTVhM2Q0M2JiYTQxNDE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNaWNoZWwgSGVybWllciA8aGVybWllckBmcnVnYWx3YXJlLm9y
Zz4KRGF0ZTogRnJpLCA3IEphbiAyMDExIDIxOjAwOjM4ICswMTAwClN1YmplY3Q6IFtQQVRDSF0g
bnZmeDogRml4IGNvbnN0YW50IHJlc291cmNlIHJlZmVyZW5jZSBhc3NpZ25hdGlvbi4KCkZpeCBh
IHJlZmVyZW5jZSBjb3VudGluZyBidWcgaW50cm9kdWNlZCBieQo1OGM1ZTc4MmUzNTE2MjFiZGUy
NjkzZmE5NDVkMGM5MGQxNDBiODU1LgoKU2lnbmVkLW9mZi1ieTogTWljaGVsIEhlcm1pZXIgPGhl
cm1pZXJAZnJ1Z2Fsd2FyZS5vcmc+Ci0tLQogc3JjL2dhbGxpdW0vZHJpdmVycy9udmZ4L252Znhf
c3RhdGUuYyB8ICAgIDIgKy0KIDEgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NyYy9nYWxsaXVtL2RyaXZlcnMvbnZmeC9udmZ4X3N0
YXRlLmMgYi9zcmMvZ2FsbGl1bS9kcml2ZXJzL252ZngvbnZmeF9zdGF0ZS5jCmluZGV4IDU0NjE5
MDMuLmYzZGNiMjAgMTAwNjQ0Ci0tLSBhL3NyYy9nYWxsaXVtL2RyaXZlcnMvbnZmeC9udmZ4X3N0
YXRlLmMKKysrIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9udmZ4L252Znhfc3RhdGUuYwpAQCAtMzA0
LDcgKzMwNCw3IEBAIG52Znhfc2V0X2NvbnN0YW50X2J1ZmZlcihzdHJ1Y3QgcGlwZV9jb250ZXh0
ICpwaXBlLCB1aW50IHNoYWRlciwgdWludCBpbmRleCwKIHsKIAlzdHJ1Y3QgbnZmeF9jb250ZXh0
ICpudmZ4ID0gbnZmeF9jb250ZXh0KHBpcGUpOwogCi0JbnZmeC0+Y29uc3RidWZbc2hhZGVyXSA9
IGJ1ZjsKKwlwaXBlX3Jlc291cmNlX3JlZmVyZW5jZSgmbnZmeC0+Y29uc3RidWZbc2hhZGVyXSwg
YnVmKTsKIAludmZ4LT5jb25zdGJ1Zl9ucltzaGFkZXJdID0gYnVmID8gKGJ1Zi0+d2lkdGgwIC8g
KDQgKiBzaXplb2YoZmxvYXQpKSkgOiAwOwogCiAJaWYgKHNoYWRlciA9PSBQSVBFX1NIQURFUl9W
RVJURVgpIHsKLS0gCjEuNy4zLjQKCg==
--0023547c8a870548610499473685
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--0023547c8a870548610499473685--
