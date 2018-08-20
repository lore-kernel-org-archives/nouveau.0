From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] drm/nouveau: Fix GM107 disp init failures on
 ThinkPad P50
Date: Mon, 20 Aug 2018 13:20:25 -0400
Message-ID: <20180820172030.10963-1-lyude@redhat.com>
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
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

VGhpcyBzZXJpZXMgZml4ZXMgc29tZSBpbnRlcm1pdHRlbnQgaXNzdWVzIHdpdGggYnJpbmdpbmcg
dXAgdGhlCmRlZGljYXRlZCBHTTEwNyBHUFUgdGhhdCBJJ3ZlIGJlZW4gb2JzZXJ2aW5nIG9uIG15
IFRoaW5rUGFkIFA1MC4gTW9yZQpkZXRhaWxzIHdpdGhpbi4KCkx5dWRlIFBhdWwgKDIpOgogIGRy
bS9ub3V2ZWF1OiBGaXggR00xMDcgZGlzcCBjb3JlIGNoYW4gaW5pdCBvbiBUaGlua1BhZCBQNTAK
ICBkcm0vbm91dmVhdTogRml4IEdNMTA3IGRpc3AgZG1hYyBjaGFuIGluaXQgb24gVGhpbmtQYWQg
UDUwCgogLi4uL2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3AvY29yZWdmMTE5LmMgIHwgMjEg
KysrKysrKysrKysrKysrKystLQogLi4uL2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3AvZG1h
Y2dmMTE5LmMgIHwgMTkgKysrKysrKysrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
