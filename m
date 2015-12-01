From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NV50 compute support questions
Date: Tue, 1 Dec 2015 17:00:26 +0100
Message-ID: <565DC41A.9040305@gmail.com>
References: <564EF7CA.4090809@redhat.com> <564F452A.1010206@gmail.com>
 <5655C92E.5010605@redhat.com> <5656C5F1.2000406@gmail.com>
 <5656F958.1030201@redhat.com> <56570087.80800@gmail.com>
 <565C4EAD.8030508@redhat.com> <565C67A3.2090609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <565C67A3.2090609-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

CgpPbiAxMS8zMC8yMDE1IDA0OjEzIFBNLCBTYW11ZWwgUGl0b2lzZXQgd3JvdGU6Cj4KPgo+IE9u
IDExLzMwLzIwMTUgMDI6MjcgUE0sIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBP
biAyNi0xMS0xNSAxMzo1MiwgU2FtdWVsIFBpdG9pc2V0IHdyb3RlOgo+Pgo+PiA8c25pcD4KPj4K
Pj4+PiBJIGRvIG5vdCBoYXZlIGEgR0sxMDYsIEkndmUgYSBHSzIwOCwgYW5kIElJUkMgdGhhdCBv
bmUgaXMga25vd24gdG8gbm90Cj4+Pj4gd29yaywKPj4+PiBJIGd1ZXNzIEkgY2FuIGdpdmUgaXQg
YSB0cnkuCj4+Pgo+Pj4gQ29tcHV0ZSBzdXBwb3J0IGlzIG5vdCBzdXBwb3J0ZWQgb24gR0sxMTAr
LCB5ZWFoLi4uCj4+Pgo+Pj4gSWYgeW91IHByb3ZpZGUgbWUgYSBNTVQgdHJhY2Ugb2YsIGZvciBl
eGFtcGxlLCB2ZWN0b3JBZGQgZnJvbSB0aGUgQ1VEQQo+Pj4gc2FtcGxlcyBJIGNvdWxkIGhhdmUg
YSBsb29rLgo+Pgo+PiBPaywgaGVyZSBpcyBhIE1NVCB0cmFjZSBvZiB2ZWN0b3JBZGQ6Cj4+Cj4+
IGh0dHBzOi8vZmVkb3JhcGVvcGxlLm9yZy9+andyZGVnb2VkZS92ZWN0b3JBZGQubG9nLmd6Cj4K
PiBIaSBIYW5zLAo+Cj4gVGhhbmtzIGEgbG90LgoKV2VsbCwgSSBkaWRuJ3Qga25vdyBidXQgTWFy
dGluIGhhcyBhIEdLMjA4Li4uCkkganVzdCB0ZXN0ZWQgdGhlIGNvbXB1dGUgc3VwcG9ydCBvbiBo
aXMgY2FyZCBhbmQgLi4uIGl0IHdvcmtzIHdpdGhvdXQgCmFueSBjaGFuZ2VzLiA6LSkKCkknbSBz
b3JyeSwgSSB3YXMgc3VyZSB0aGUgY29tcHV0ZSBzdXBwb3J0IGRpZG4ndCB3b3JrIG9uIHRoaXMg
Y2hpcHNldC4KCkZlZWwgZnJlZSB0byB0ZXN0IG9uIHlvdXIgR0syMDggYW5kIHJlcG9ydCBiYWNr
IGlmIHlvdSBoYXZlIHByb2JsZW1zLgoKVGhhbmtzLgoKPgo+Pgo+PiBSZWdhcmRzLAo+Pgo+PiBI
YW5zCj4KCi0tIAotU2FtdWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
Cg==
