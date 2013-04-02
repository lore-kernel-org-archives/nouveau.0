From: "Florian Scholz" <florian.scholz-opX7b8PCCKiELgA04lAiVw@public.gmane.org>
Subject: patch for backlight control with gt 525M (c0)
Date: Wed, 03 Apr 2013 00:06:19 +0200
Message-ID: <515B727B0200009700005215@gwia02n.pmx.stud.hn.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=__Part7F4F784B.0__="
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

This is a MIME message. If you are reading this text, you may want to 
consider changing to a mail reader or gateway that understands how to 
properly handle MIME multipart messages.

--=__Part7F4F784B.0__=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I wrote a patch for nouveau_backlight.c to support the backlight control =
of the GT 525M. Only the case NV_C0: is needed to get the backlight =
control with my NVC0 card working. I don't think that it's worth to add =
new functions for c0 if the old ones still work.

This is my first patch for the Linux kernel.

Best Regards

Florian Scholz


--=__Part7F4F784B.0__=
Content-Type: application/octet-stream; name="0001-drm-nouveau-adding-support-for-backlight-control-of-.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-drm-nouveau-adding-support-for-backlight-control-of-.patch"

RnJvbSBjNGFjY2U3ZmU3NzljNDk2OTViZmEzMjFlOTYxNDQzMGRlZDA5MzE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGbG9yaWFuIFNjaG9seiA8Zmxvcmlhbi5zY2hvbHpAc3R1ZC5o
bi5kZT4KRGF0ZTogVHVlLCAyIEFwciAyMDEzIDIzOjE2OjM4ICswMjAwClN1YmplY3Q6IFtQQVRD
SF0gZHJtL25vdXZlYXU6IGFkZGluZyBzdXBwb3J0IGZvciBiYWNrbGlnaHQgY29udHJvbCBvZiBH
VDUyNU0KIChDMCkKClRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciB0aGUgYmFja2xpZ2h0IGNv
bnRyb2wgb2YgdGhlIE5WSURJQSBHVCA1MjVNCiwgd2hpY2ggaWRlbnRpZmllcyBpdHNlbGYgYXMg
YSBtZW1iZXIgb2YgdGhlIEMwIGZhbWlseS4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2JhY2tsaWdodC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JhY2tsaWdodC5j
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iYWNrbGlnaHQuYwppbmRleCA1ZDk0
MDMwLi4xN2ZkMmRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2JhY2tsaWdodC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmFja2xp
Z2h0LmMKQEAgLTIzOSw2ICsyMzksNyBAQCBub3V2ZWF1X2JhY2tsaWdodF9pbml0KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpCiAJCWNhc2UgTlZfNDA6CiAJCQlyZXR1cm4gbnY0MF9iYWNrbGlnaHRf
aW5pdChjb25uZWN0b3IpOwogCQljYXNlIE5WXzUwOgorCQljYXNlIE5WX0MwOgogCQkJcmV0dXJu
IG52NTBfYmFja2xpZ2h0X2luaXQoY29ubmVjdG9yKTsKIAkJZGVmYXVsdDoKIAkJCWJyZWFrOwot
LSAKMS44LjEuNQoK

--=__Part7F4F784B.0__=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=__Part7F4F784B.0__=--
