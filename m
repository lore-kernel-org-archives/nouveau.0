From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/nouveau/fbcon: fix deadlock with FBIOPUT_CON2FBMAP
Date: Fri, 15 Jul 2016 12:34:08 +0100
Message-ID: <20160715113408.GL1841@nuc-i3427.alporthouse.com>
References: <20160712164934.1390-1-peter@lekensteyn.nl>
 <20160713171747.GM6157@nuc-i3427.alporthouse.com>
 <20160715112622.GB2632@al>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20160715112622.GB2632@al>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Wu <peter@lekensteyn.nl>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

T24gRnJpLCBKdWwgMTUsIDIwMTYgYXQgMDE6MjY6MjJQTSArMDIwMCwgUGV0ZXIgV3Ugd3JvdGU6
Cj4gT24gV2VkLCBKdWwgMTMsIDIwMTYgYXQgMDY6MTc6NDdQTSArMDEwMCwgQ2hyaXMgV2lsc29u
IHdyb3RlOgo+ID4gSG1tLCBzaW5jZSBzdXNwZW5kX3dvcmsgY2FuIHRoZW9yZWN0aWNhbGx5IHJl
YXJtIGl0c2VsZiwgdGhpcyBzaG91bGQgYmUKPiA+IGNhbmNlbF93b3JrX3N5bmMoKS4KPiAKPiBI
b3cgc28/IFRoZSB3b3JrZXIgY2FsbHMgd2l0aCBzdGF0ZSA9IEZCSU5GT19TVEFURV9SVU5OSU5H
IGFuZAo+IHN5bmNocm9ub3VzID0gdHJ1ZSwgc28gc2NoZWR1bGVfd29yaygpIGNhbiBuZXZlciBi
ZSBjYWxsZWQuCgpObyB3b3JpZXMgdGhlbiwgSSBmZWVsIHZpY3RpbSB0byBoYXZpbmcgdG8gcmVh
ZCB0aGUgY29kZSBhZ2Fpbi4KLUNocmlzCgotLSAKQ2hyaXMgV2lsc29uLCBJbnRlbCBPcGVuIFNv
dXJjZSBUZWNobm9sb2d5IENlbnRyZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
