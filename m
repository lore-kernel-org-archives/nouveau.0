From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Moving LRU handling into Nouveau v3
Date: Mon, 24 Aug 2020 17:26:43 +1000
Message-ID: <CAPM=9tyip4mbTT_rjz115xGtMCLr4LTu2pu2G4n99mpx4VHWgQ@mail.gmail.com>
References: <20200821160050.1368-1-christian.koenig@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200821160050.1368-1-christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

SSd2ZSBhbHNvIGdpdmVuIHRoaXMgYSBzcGluIGhlcmUsIHNlZW1zIHRvIGJlIG9rYXkuCgpJJ3Zl
IHJlYWQgdGhlIHBhdGNoZXMgYW5kIHRoZXkgYWxsIHNlZW0gZmluZS4KUmV2aWV3ZWQtYnk6IERh
dmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CmZvciBhbGwgMyBwYXRjaGVzLgoKRGF2ZS4K
Ck9uIFNhdCwgMjIgQXVnIDIwMjAgYXQgMDI6MDAsIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIGd1eXMsCj4KPiBzbyBJIGdv
dCBzb21lIGhhcmR3YXJlIGFuZCB0ZXN0ZWQgdGhpcyBhbmQgYWZ0ZXIgaGFtbWVyaW5nIG91dCB0
b25zIG9mIHR5cG9zIGl0IG5vdyBzZWVtcyB0byB3b3JrIGZpbmUuCj4KPiBDb3VsZCB5b3UgZ2l2
ZSBpdCBtb3JlIHRlc3Rpbmc/Cj4KPiBUaGFua3MgaW4gYWR2YW5jZSwKPiBDaHJpc3RpYW4KPgo+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
