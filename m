From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [libdrm 06/13] nouveau: introduce object to represent
 the kernel client
Date: Thu, 26 Nov 2015 20:46:14 +0000
Message-ID: <CACvgo53_GZY0fFueULzjqQ+6321dY=KMiZfHFgYURednFGGKNw@mail.gmail.com>
References: <1448522050-4873-1-git-send-email-skeggsb@gmail.com>
 <1448522050-4873-6-git-send-email-skeggsb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1448522050-4873-6-git-send-email-skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gMjYgTm92ZW1iZXIgMjAxNSBhdCAwNzoxNCwgQmVuIFNrZWdncyA8c2tlZ2dzYkBnbWFpbC5j
b20+IHdyb3RlOgoKPiAtLS0gYS9ub3V2ZWF1L25vdXZlYXUuYwo+ICsrKyBiL25vdXZlYXUvbm91
dmVhdS5jCgo+ICtpbnQKPiArbm91dmVhdV9kcm1fbmV3KGludCBmZCwgc3RydWN0IG5vdXZlYXVf
ZHJtICoqcGRybSkKPiArewo+ICsgICAgICAgc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Cj4gKyAg
ICAgICBkcm1WZXJzaW9uUHRyIHZlcjsKPiArCj4gKyNpZmRlZiBERUJVRwo+ICsgICAgICAgZGVi
dWdfaW5pdChnZXRlbnYoIk5PVVZFQVVfTElCRFJNX0RFQlVHIikpOwo+ICsjZW5kaWYKPiArCj4g
KyAgICAgICBpZiAoIShkcm0gPSAqcGRybSA9IGNhbGxvYygxLCBzaXplb2YoKmRybSkpKSkKU2lt
aWxhciB0byBwcmV2aW91cyBwYXRjaCAtIHNldCAqcGRybSBhdCBhIGxhdGVyIHN0YWdlLgoKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAgICBkcm0tPmZkID0gZmQ7Cj4g
Kwo+ICsgICAgICAgaWYgKCEodmVyID0gZHJtR2V0VmVyc2lvbihmZCkpKSB7Cj4gKyAgICAgICAg
ICAgICAgIG5vdXZlYXVfZHJtX2RlbChwZHJtKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgZHJtLT5kcm1fdmVyc2lvbiA9ICh2ZXIt
PnZlcnNpb25fbWFqb3IgPDwgMjQpIHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAodmVy
LT52ZXJzaW9uX21pbm9yIDw8IDgpIHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgdmVy
LT52ZXJzaW9uX3BhdGNobGV2ZWw7Cj4gKyAgICAgICBkcm0tPmxpYl92ZXJzaW9uID0gMHgwMTAw
MDMwMDsKRG8gd2UgbmVlZCB0aGlzIC0gbmVpdGhlciBtZXNhIG5vciB4Zjg2LXZpZGVvLW5vdXZl
YXUgdXNlIGl0LgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
