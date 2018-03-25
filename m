From: Arushi Singhal <arushisinghal19971997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/2] gpu: drm/lease:: Use
 list_{next/prev}_entry instead of list_entry
Date: Sun, 25 Mar 2018 23:31:32 +0530
Message-ID: <1522000893-5331-2-git-send-email-arushisinghal19971997@gmail.com>
References: <1522000893-5331-1-git-send-email-arushisinghal19971997@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1522000893-5331-1-git-send-email-arushisinghal19971997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arushi Singhal <arushisinghal19971997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

SXQncyBiZXR0ZXIgdG8gdXNlIGxpc3RfZW50cnkgaW5zdGVhZCBvZiBsaXN0X3tuZXh0L3ByZXZ9
X2VudHJ5CmFzIGl0IG1ha2VzIHRoZSBjb2RlIG1vcmUgY2xlYXIgdG8gcmVhZC4KVGhpcyBwYXRj
aCByZXBsYWNlIGxpc3RfZW50cnkgd2l0aCBsaXN0X3tuZXh0L3ByZXZ9X2VudHJ5LgoKU2lnbmVk
LW9mZi1ieTogQXJ1c2hpIFNpbmdoYWwgPGFydXNoaXNpbmdoYWwxOTk3MTk5N0BnbWFpbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9sZWFzZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9sZWFzZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9sZWFzZS5jCmluZGV4IDE0MDJj
MGUuLjRkY2ZiNWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbGVhc2UuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2xlYXNlLmMKQEAgLTM0MCw3ICszNDAsNyBAQCBzdGF0aWMg
dm9pZCBfZHJtX2xlYXNlX3Jldm9rZShzdHJ1Y3QgZHJtX21hc3RlciAqdG9wKQogCQkJCWJyZWFr
OwogCiAJCQkvKiBPdmVyICovCi0JCQltYXN0ZXIgPSBsaXN0X2VudHJ5KG1hc3Rlci0+bGVzc2Vl
X2xpc3QubmV4dCwgc3RydWN0IGRybV9tYXN0ZXIsIGxlc3NlZV9saXN0KTsKKwkJCW1hc3RlciA9
IGxpc3RfbmV4dF9lbnRyeShtYXN0ZXIsIGxlc3NlZV9saXN0KTsKIAkJfQogCX0KIH0KLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
