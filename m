From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: hmm_range_fault related fixes and legacy API removal
 v2
Date: Mon, 22 Jul 2019 18:11:04 -0700
Message-ID: <7e1f33d4-4d3b-7927-38d1-b98b22ed4d78@nvidia.com>
References: <20190722094426.18563-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190722094426.18563-1-hch-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Ck9uIDcvMjIvMTkgMjo0NCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gSGkgSsOpcsO0
bWUsIEJlbiBhbmQgSmFzb24sCj4gCj4gYmVsb3cgaXMgYSBzZXJpZXMgYWdhaW5zdCB0aGUgaG1t
IHRyZWUgd2hpY2ggZml4ZXMgdXAgdGhlIG1tYXBfc2VtCj4gbG9ja2luZyBpbiBub3V2ZWF1IGFu
ZCB3aGlsZSBhdCBpdCBhbHNvIHJlbW92ZXMgbGVmdG92ZXIgbGVnYWN5IEhNTSBBUElzCj4gb25s
eSB1c2VkIGJ5IG5vdXZlYXUuCj4gCj4gVGhlIGZpcnN0IDQgcGF0Y2hlcyBhcmUgYSBidWcgZml4
IGZvciBub3V2ZWF1LCB3aGljaCBJIHN1c3BlY3Qgc2hvdWxkCj4gZ28gaW50byB0aGlzIG1lcmdl
IHdpbmRvdyBldmVuIGlmIHRoZSBjb2RlIGlzIG1hcmtlZCBhcyBzdGFnaW5nLCBqdXN0Cj4gdG8g
YXZvaWQgcGVvcGxlIGNvcHlpbmcgdGhlIGJyZWFrYWdlLgo+IAo+IENoYW5nZXMgc2luY2UgdjE6
Cj4gICAtIGRvbid0IHJldHVybiB0aGUgdmFsaWQgc3RhdGUgZnJvbSBobW1fcmFuZ2VfdW5yZWdp
c3Rlcgo+ICAgLSBhZGRpdGlvbmFsIG5vdXZlYXUgY2xlYW51cHMKPiAKCkkgcmFuIHNvbWUgT3Bl
bkNMIHRlc3RzIGZyb20gSmVyb21lIHdpdGggbm91dmVhdSBhbmQgdGhpcyBzZXJpZXMsCjUuMy4w
LXJjMSwgYW5kIG15IHR3byBITU0gZml4ZXM6CigibW0vaG1tOiBmaXggWk9ORV9ERVZJQ0UgYW5v
biBwYWdlIG1hcHBpbmcgcmV1c2UiKQooIm1tL2htbTogRml4IGJhZCBzdWJwYWdlIHBvaW50ZXIg
aW4gdHJ5X3RvX3VubWFwX29uZSIpCgpZb3UgY2FuIGFkZCBmb3IgdGhlIHNlcmllczoKVGVzdGVk
LWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
