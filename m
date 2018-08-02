From: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 1/8] drm/nouveau: Fix bogus
 drm_kms_helper_poll_enable() placement
Date: Thu, 2 Aug 2018 21:10:47 +0200
Message-ID: <20180802191047.GA6180@wunner.de>
References: <20180801211459.7731-1-lyude@redhat.com>
 <20180801211459.7731-2-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180801211459.7731-2-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

SGkgTHl1ZGUsCgp0aGFua3MgYSBsb3QgZm9yIHlvdXIgcGVyc2lzdGVuY2UgaW4gYXR0YWNraW5n
IHRoZXNlIHJ1bnRpbWUgUE0KaXNzdWVzIGluIG5vdXZlYXUuICB2NCBvZiB0aGlzIHNlcmllcyBs
b29rcyB2ZXJ5IGdvb2Qgb3ZlcmFsbC4KSSBvbmx5IGhhdmUgY29tbWVudHMgb24gcGF0Y2hlcyAx
LCAyIGFuZCA4LiAgT24gdGhpcyBwYXRjaCAxCml0J3MgbWVyZWx5IGEgbml0OgoKT24gV2VkLCBB
dWcgMDEsIDIwMTggYXQgMDU6MTQ6NTFQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90ZToKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwo+IEBAIC04MzUsNyArODM1LDYgQEAgbm91dmVh
dV9wbW9wc19ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJCXJldHVybiAt
RUJVU1k7Cj4gIAl9Cj4gIAo+IC0JZHJtX2ttc19oZWxwZXJfcG9sbF9kaXNhYmxlKGRybV9kZXYp
Owo+ICAJbm91dmVhdV9zd2l0Y2hlcm9vX29wdGltdXNfZHNtKCk7Cj4gIAlyZXQgPSBub3V2ZWF1
X2RvX3N1c3BlbmQoZHJtX2RldiwgdHJ1ZSk7Cj4gIAlwY2lfc2F2ZV9zdGF0ZShwZGV2KTsKClRo
aXMgdGhpcmQgaHVuayBpbiB0aGUgcGF0Y2ggbGFja3MgYW4gZXhwbGFuYXRpb24gaW4gdGhlIGNv
bW1pdCBtZXNzYWdlLgpJIHRoaW5rIGl0cyByYXRpb25hbGUgaXMgdGhhdCBkcm1fa21zX2hlbHBl
cl9wb2xsX2Rpc2FibGUoKSBpcyBhbHJlYWR5Cmludm9rZWQgaW4gbm91dmVhdV9kaXNwbGF5X2Zp
bmkoKSwgd2hpY2ggZ2V0cyBjYWxsZWQgb24gLT5ydW50aW1lX3N1c3BlbmQsCmhlbmNlIG5lZWQg
bm90IGJlIGludm9rZWQgb25jZSBtb3JlIGluIG5vdXZlYXVfcG1vcHNfcnVudGltZV9zdXNwZW5k
KCkuCgpUaGFua3MsCgpMdWthcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXUK
