From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/5] nouveau: unified firmware loading
	functions
Date: Mon, 18 Jan 2016 15:15:09 +0900
Message-ID: <CAAVeFu+n5H5WQgwhkPZXUP53SrGAG=e7EWmtUdTo1bNhFCgZhg@mail.gmail.com>
References: <1453097233-11838-1-git-send-email-acourbot@nvidia.com>
 <CAKb7UvjAk-HBmJuyrLewK49qo_27trCtXW+oFW7TQ74rjNHsPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjAk-HBmJuyrLewK49qo_27trCtXW+oFW7TQ74rjNHsPQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBKYW4gMTgsIDIwMTYgYXQgMzoxMSBQTSwgSWxpYSBNaXJraW4gPGltaXJraW5AYWx1
bS5taXQuZWR1PiB3cm90ZToKPiBBbGwgdGhlIHZpZGVvIGRlY29kaW5nIGZpcm13YXJlIHdhcyAq
cHJldHR5KiBzdGFuZGFyZC4uLiBJIHN1c3BlY3QKPiB+ZXZlcnlvbmUgdXNlZCBteSBleHRyYWN0
aW9uIHNjcmlwdCBhbmQgaXQncyBzaXR0aW5nIGluCj4gL2xpYi9maXJtd2FyZS9ub3V2ZWF1IGZv
ciBldmVyeW9uZSB3aG8gdXNlcyBWRFBBVS4gVGhlcmUgYXJlIHBhY2thZ2VzCj4gaW4gc2V2ZXJh
bCBkaXN0cmlidXRpb25zIHdoaWNoIGdyYWIgdGhlIG52aWRpYSBibG9iLCBteSBzY3JpcHQsIGFu
ZAo+IHJ1biB0aGUgZXh0cmFjdGlvbiBvbiB0aGUgZW5kIHVzZXIncyBjb21wdXRlciB0byBhdm9p
ZCBsaWNlbnNpbmcKPiBjb21wbGljYXRpb25zLiBQbGVhc2Ugc3VwcG9ydCB0aGUgZXhpc3Rpbmcg
bG9jYXRpb25zLgoKT2ssIHNvIHRoZXJlICphcmUqIHNvbWUgZW5kLXVzZXJzIChub3QgZGV2ZWxv
cGVycykgcmVseWluZyBvbiB0aGVzZQpleHRlcm5hbCBmaXJtd2FyZXM/CgpJbiB0aGF0IGNhc2Ug
cHJvYmFibHkgdGhlIGJlc3QgdGhpbmcgdG8gZG8gaXMgdG8gbm90IHVzZSB0aGVzZSBuZXcKZnVu
Y3Rpb25zIGZvciB2aWRlbyAtIGF0IGxlYXN0IGZvciBjaGlwcyB0aGF0IGRvIG5vdCByZXF1aXJl
IHNpZ25lZApmaXJtd2FyZS4gQWxsIEknZCBsaWtlIHRvIGRvIGlzIHJlZHVjZSB0aGUgbnVtYmVy
IG9mIG9jY3VyZW5jZXMgb2YgdGhlCiJidWlsZCBwYXRoIC0gbG9hZCBmaXJtd2FyZSIgbG9naWMu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
