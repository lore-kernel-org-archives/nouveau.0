From: Arushi Singhal <arushisinghal19971997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] drm: Replace list_entry
Date: Sun, 25 Mar 2018 23:31:31 +0530
Message-ID: <1522000893-5331-1-git-send-email-arushisinghal19971997@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

UmVwbGFjZSBsaXN0X2VudHJ5IHdpdGggbGlzdF97bmV4dC9wcmV2fV9lbnRyeS4KCkFydXNoaSBT
aW5naGFsICgyKToKICBncHU6IGRybS9sZWFzZTo6IFVzZSBsaXN0X3tuZXh0L3ByZXZ9X2VudHJ5
IGluc3RlYWQgb2YgbGlzdF9lbnRyeQogIGdwdTogZHJtOiBub3V2ZWF1OiBVc2UgbGlzdF97bmV4
dC9wcmV2fV9lbnRyeSBpbnN0ZWFkIG9mIGxpc3RfZW50cnkKCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2xlYXNlLmMgICAgICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbnZrbS9zdWJkZXYvY2xrL2Jhc2UuYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0gCmNoYW5nZXMgaW4gdjIKKkFsbCB0aGUgbWFp
bnRhaW5lcnMgYXJlIGFkZGVkLgoqTW9yZSBhY2N1cmF0ZSBjb2NjaW5lbGxlIHNjcmlwdCBpcyB1
c2VkCmZvciB0aGlzIHBhdGNoIHRoYW4gdGhlIG9uZSB1c2VkIGluIHByZXZpb3VzIHZlcnNpb24u
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpO
b3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
