From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH 3/4] pmu/fuc: call# seems to be broken on gk208
Date: Tue, 1 Mar 2016 16:53:00 -0500
Message-ID: <CAKb7UvgKF9deHTrP-PuB6WL=02OjMmUoi4qksDiboSucRVYR8A@mail.gmail.com>
References: <1456499974-1950-1-git-send-email-nouveau@karolherbst.de>
 <1456499974-1950-4-git-send-email-nouveau@karolherbst.de>
 <56D60D6B.7010808@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <56D60D6B.7010808-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gVHVlLCBNYXIgMSwgMjAxNiBhdCA0OjQ1IFBNLCBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5wZXJl
c0BmcmVlLmZyPiB3cm90ZToKPiBPbiAyNi8wMi8xNiAxNzoxOSwgS2Fyb2wgSGVyYnN0IHdyb3Rl
Ogo+Pgo+PiBmb3Igc29tZSByZWFzb25zIHRoZXNlIGNhbGxzIGRvbid0IHJlYWxseSBnbyB0aGVy
ZSB3aGVyZSB0aGV5IHNob3VsZCBnbwo+PiBsZWFkaW5nIHRvIHZhcmlvdXMgY29ycnVwdGlvbnMg
b2YgdGhlIFBNVSBzdGF0ZQo+Cj4KPiBJIGFtIGZpbmUgd2l0aCB0aGUgY2hhbmdlcyBidXQgbm90
IGZpbmUgYXQgYWxsIHdpdGggdGhlIGNvbW1pdCBtZXNzYWdlLiBpdAo+IHdvdWxkIGJlIG5pY2Ug
aWYgeW91IGNvdWxkIHVuZGVyc3RhbmQgYSBiaXQgbW9yZSB3aGF0IHRoZSBwcm9ibGVtIGlzIGlu
c3RlYWQKPiBvZiBqdXN0IHNheWluZzogIml0IHdvcmtzIHdpdGggdGhpcyBjaGFuZ2UgKFRNKSIK
ClRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlIGNhbGwgbWFjcm8gZXhpc3RzIGZvciBhIHJlYXNvbiwg
YnV0IGl0IHdhcwooYWNjaWRlbnRhbGx5KSBub3QgYmVpbmcgdXNlZCBoZXJlLgoKPgo+IEFueXdh
eSwgMS0zIGFyZToKPgo+IFJldmlld2VkLWJ5OiBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0Bm
cmVlLmZyPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
