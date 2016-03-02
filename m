From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fifo/gk104: kick channel upon removal
Date: Wed, 2 Mar 2016 18:07:24 +0900
Message-ID: <CAAVeFuLGtLK9=qsLf1PcRFrpxuxOTfH6xunb83LBbqqdNPuoQw@mail.gmail.com>
References: <1456819145-3141-1-git-send-email-acourbot@nvidia.com>
 <20160302035335.GB2526@zzz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20160302035335.GB2526@zzz>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Eric Biggers <ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBNYXIgMiwgMjAxNiBhdCAxMjo1MyBQTSwgRXJpYyBCaWdnZXJzIDxlYmlnZ2VyczNA
Z21haWwuY29tPiB3cm90ZToKPiBPbiBUdWUsIE1hciAwMSwgMjAxNiBhdCAwNDo1OTowNVBNICsw
OTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90ZToKPj4KPj4gRXJpYywgc2luY2UgeW91IHJlcG9y
dGVkIHRoZSByZWdyZXNzaW9uIG9uIHRoZSBmaXJzdCB2ZXJzaW9uLCB3b3VsZCB5b3UgbWluZCB0
cnlpbmcKPj4gdGhpcyBvbmUgYW5kIGdpdmluZyB1cyB5b3VyIFRlc3RlZC1ieT8gSSBoYXZlIHRl
c3RlZCBpdCBvbiBkR1BVIGJ1dCB1bmZvcnR1bmF0ZWx5Cj4+IGNvdWxkIG5vdCBzZXQgaXQgdXAg
aW4gYW4gb3B0aW11cy1saWtlIG1hbm5lciwgd2l0aCBwb3dlciBtYW5hZ2VtZW50IGtpY2tpbmcg
aW4uCj4+Cj4KPiBUaGFua3MuICBJJ3ZlIHRlc3RlZCBMaW51eCA0LjUtcmM2IHdpdGggeW91ciBw
YXRjaCBhcHBsaWVkLCBhbmQgSSd2ZSB5ZXQgdG8KPiBlbmNvdW50ZXIgdGhlIGNyYXNoIGFmdGVy
IGFib3V0IGhhbGYgYSBkb3plbiByZWJvb3RzLiAgU28gaXQgc2VlbXMgZ29vZCBzbyBmYXIsCj4g
YnV0IEknbGwga2VlcCBydW5uaW5nIGl0IGFuZCB3aWxsIGxldCB5b3Uga25vdyBpZiBJIG5vdGlj
ZSBhIHByb2JsZW0uCgpHcmVhdCBuZXdzLCB0aGlzIG9uZSB3YXMgYm90aGVyaW5nIG1lIGZvciBz
b21lIHRpbWUuIFdvdWxkIGJlIGdyYXRlZnVsCmlmIHlvdSBjb3VsZCBsZXQgdXMga25vdyB3aGV0
aGVyIHRoaW5ncyBhcmUgc3RpbGwgZ29pbmcgd2VsbCBhZnRlcgpmdXJ0aGVyIHRlc3RpbmcuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFp
bGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
