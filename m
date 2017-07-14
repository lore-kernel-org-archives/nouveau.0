From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH xf86-video-amdgpu] Adapt to
 PixmapDirtyUpdateRec::src being a DrawablePtr
Date: Fri, 14 Jul 2017 11:14:57 +0900
Message-ID: <c687252a-1bc4-41b9-d022-4c7dff5e6675@daenzer.net>
References: <20170418100754.14621-1-michel@daenzer.net>
 <20170418100754.14621-2-michel@daenzer.net>
 <f341d20d-ded3-5413-90df-3de6cefc4ca2@daenzer.net>
 <CAKb7Uvi=u3yL3v4yQhNiJVVgYhOYNRvxOD07SfRkvd8mBETrYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvi=u3yL3v4yQhNiJVVgYhOYNRvxOD07SfRkvd8mBETrYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-CA
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org
List-Id: nouveau.vger.kernel.org

T24gMTMvMDcvMTcgMDk6MzEgUE0sIElsaWEgTWlya2luIHdyb3RlOgo+IE9uIFRodSwgSnVsIDEz
LCAyMDE3IGF0IDQ6MjcgQU0sIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+IHdy
b3RlOgo+PiBPbiAxOC8wNC8xNyAwNzowNyBQTSwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+PiBG
cm9tOiBNaWNoZWwgRMOkbnplciA8bWljaGVsLmRhZW56ZXJAYW1kLmNvbT4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBNaWNoZWwgRMOkbnplciA8bWljaGVsLmRhZW56ZXJAYW1kLmNvbT4KPj4+IC0t
LQo+Pj4KPj4+IENocmlzIC8gSWxpYSAvIEJlbiwgdGhpcyBzaG91bGQgYmUgbWFuYWdlYWJsZSBm
b3IgdGhlIGludGVsL25vdXZlYXUKPj4+IGRyaXZlcnMsIHJpZ2h0Pwo+Pgo+PiBBbnkgZmVlZGJh
Y2ssIGd1eXM/Cj4+Cj4+IEkgd2FudCB0byBwdXNoIHRoZSB4c2VydmVyIGNoYW5nZSBzb29uLWlz
aC4gSSBjb3VsZCBwcm9iYWJseSBjb21lIHVwCj4+IHdpdGggYSBjb3JyZXNwb25kaW5nIHBhdGNo
IGZvciBub3V2ZWF1IGluIHRoZSB3b3JzdCBjYXNlLCBidXQgSSdtIGFmcmFpZAo+PiBub3QgZm9y
IGludGVsLgo+IAo+IFNvcnJ5LCBJJ20gbm90IDEwMDAlIGNsZWFyIG9uIHdoYXQgdGhpcyBwYXRj
aCBpcyBkb2luZy4KCjEwMCUgc2hvdWxkIHN1ZmZpY2UuIDspCgo+IElzIGl0IGxpdGVyYWxseSBq
dXN0IGEgdHlwZSBjaGFuZ2UgZnJvbSBBIHRvIEIgYW5kIHNvIGNvZGUgaGFzIHRvIGJlIGZpeGVk
Cj4gdXAgZm9yIHRoZSBuZXcgQVBJPwoKVGhhdCdzIGJhc2ljYWxseSBpdCwgY29ycmVzcG9uZGlu
ZyB0bwpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMTUwOTM4LyAuCgoK
LS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAg
ICBodHRwOi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAg
ICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQo=
