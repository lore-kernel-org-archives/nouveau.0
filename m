From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 0/5] Fix legacy DPMS changes with MST
Date: Thu,  4 Oct 2018 20:29:49 -0400
Message-ID: <20181005002956.7317-1-lyude@redhat.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

TmV4dCB2ZXJzaW9uIG9mIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMv
NDk4NzgvIC4gTm8KY2hhbmdlcywgZXhjZXB0IHRoYXQgdGhlc2UgcGF0Y2hlcyBhcmUgYWdhaW5z
dCBtYXN0ZXIgc28gaG9wZWZ1bGx5CmludGVsJ3MgQ0kgZG9lc24ndCBnZXQgY29uZnVzZWQgdGhp
cyB0aW1lLgoKTHl1ZGUgUGF1bCAoNSk6CiAgZHJtL2F0b21pY19oZWxwZXI6IERpc2FsbG93IG5l
dyBtb2Rlc2V0cyBvbiB1bnJlZ2lzdGVyZWQgY29ubmVjdG9ycwogIGRybS9ub3V2ZWF1OiBGaXgg
bnY1MF9tc3RjLT5iZXN0X2VuY29kZXIoKQogIGRybS9pOTE1OiBMZWF2ZSBpbnRlbF9jb25uLT5t
c3RfcG9ydCBzZXQsIHVzZSBtc3RfcG9ydF9nb25lIGluc3RlYWQKICBkcm0vaTkxNTogU2tpcCB2
Y3BpIGFsbG9jYXRpb24gZm9yIE1TVEIgcG9ydHMgdGhhdCBhcmUgZ29uZQogIGRybS9pOTE1OiBG
aXggaW50ZWxfZHBfbXN0X2Jlc3RfZW5jb2RlcigpCgogZHJpdmVycy9ncHUvZHJtL2RybV9hdG9t
aWNfaGVscGVyLmMgICAgIHwgMjEgKysrKysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2ludGVsX2RwX21zdC5jICAgICB8IDMxICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Rydi5oICAgICAgICB8ICA2ICsrKysrCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCAxNCArKysrLS0tLS0tLQogNCBmaWxl
cyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
