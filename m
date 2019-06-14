From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/dmem: missing mutex_lock in error
 path
Date: Fri, 14 Jun 2019 00:24:04 +0000
Message-ID: <20190614002359.GI22062@mellanox.com>
References: <20190614001121.23950-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190614001121.23950-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Content-ID: <563E69CBF7DBDB4381F3D484B873273B-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDU6MTE6MjFQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gSW4gbm91dmVhdV9kbWVtX3BhZ2VzX2FsbG9jKCksIHRoZSBkcm0tPmRtZW0tPm11
dGV4IGlzIHVubG9ja2VkIGJlZm9yZQo+IGNhbGxpbmcgbm91dmVhdV9kbWVtX2NodW5rX2FsbG9j
KCkuCj4gUmVhY3F1aXJlIHRoZSBsb2NrIGJlZm9yZSBjb250aW51aW5nIHRvIHRoZSBuZXh0IHBh
Z2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEu
Y29tPgo+IC0tLQo+IAo+IEkgZm91bmQgdGhpcyB3aGlsZSB0ZXN0aW5nIEphc29uIEd1bnRob3Jw
ZSdzIGhtbSB0cmVlIGJ1dCB0aGlzIGlzCj4gaW5kZXBlbmRhbnQgb2YgdGhvc2UgY2hhbmdlcy4g
SSBndWVzcyBpdCBjb3VsZCBnbyB0aHJvdWdoCj4gRGF2aWQgQWlybGllJ3MgdHJlZSBmb3Igbm91
dmVhdSBvciBKYXNvbidzIHRyZWUuCgpUaGlzIHNlZW1zIGxpa2UgYSBiYWQgZW5vdWdoIGJ1ZyB0
byBzZW5kIGl0IGludG8gLXJjPwoKSXQgcHJvYmFibHkgc2hvdWxkIGdvIHRocm91Z2ggdGhlIG5v
cm1hbCBub3V2ZWF1IGNoYW5uZWxzLCB0aGFua3MKCkphc29uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQ==
