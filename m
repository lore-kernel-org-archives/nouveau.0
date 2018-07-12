From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] drm/nouveau: Add support for dp_mst_info in
 debugfs
Date: Thu, 12 Jul 2018 13:10:45 -0400
Message-ID: <20180712171056.26359-1-lyude@redhat.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

VGhpcyBob29rcyB1cCB0aGUgRFJNIGhlbHBlcnMgZm9yIGR1bXBpbmcgaW5mb3JtYXRpb24gb24g
dGhlIGN1cnJlbnQKc3RhdHVzIG9mIGVhY2ggTVNUIHRvcG9sb2d5IGZyb20gbm91dmVhdSdzIHBl
cnNwZWN0aXZlIHRvIGRlYnVnZnMgZmlsZXMsCnNpbWlsYXIgdG8gd2hhdCBpOTE1IGRvZXMgKGFs
YmVpdCwgaTkxNSBsYWJlbHMgdGhlaXIgZGVidWdmcyBub2RlIGZvcgp0aGlzIGFzIGk5MTVfZHBf
bXN0X2luZm8pLgoKTHl1ZGUgUGF1bCAoMik6CiAgZHJtL25vdXZlYXU6IEV4cG9zZSBudjUwIE1T
VCBzdHJ1Y3R1cmVzIGluIGRpc3AuaAogIGRybS9ub3V2ZWF1OiBIb29rIHVwIGRwX21zdF9pbmZv
IGluIGRlYnVnZnMKCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgICB8
IDM0IC0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rp
c3AuaCAgIHwgMzUgKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfZGVidWdmcy5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKy0KIDMgZmlsZXMgY2hh
bmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
