From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 21/33] drm/nouveau: use match_string() helper
Date: Tue, 22 May 2018 01:03:59 +0300
Message-ID: <CAHp75VctuGKvdG3=mHp7nA3MkYSP+Cxob1gtjYVq03KBcEJ7UQ@mail.gmail.com>
References: <1526903890-35761-1-git-send-email-xieyisheng1@huawei.com>
 <1526903890-35761-22-git-send-email-xieyisheng1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1526903890-35761-22-git-send-email-xieyisheng1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Yisheng Xie <xieyisheng1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCBNYXkgMjEsIDIwMTggYXQgMjo1NyBQTSwgWWlzaGVuZyBYaWUgPHhpZXlpc2hlbmcx
QGh1YXdlaS5jb20+IHdyb3RlOgo+IG1hdGNoX3N0cmluZygpIHJldHVybnMgdGhlIGluZGV4IG9m
IGFuIGFycmF5IGZvciBhIG1hdGNoaW5nIHN0cmluZywKPiB3aGljaCBjYW4gYmUgdXNlZCBpbnRl
YWQgb2Ygb3BlbiBjb2RlZCB2YXJpYW50LgoKPiAgICAgICAgIGlmIChub3V2ZWF1X3R2X25vcm0p
IHsKCj4gKyAgICAgICAgICAgICAgIGkgPSBtYXRjaF9zdHJpbmcobnYxN190dl9ub3JtX25hbWVz
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG51bV90dl9ub3Jtcywgbm91dmVh
dV90dl9ub3JtKTsKClNhbWUgY29tbWVudCBmb3IgbG9naWNhbCBzcGxpdCwgMm5kIHBhcmFtZXRl
ciBsb29rcyBiZXR0ZXIgb24gdGhlIHByZXZpb3VzIGxpbmUuCgo+ICsgICAgICAgICAgICAgICBp
ZiAoaSA+PSAwKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHR2X2VuYy0+dHZfbm9ybSA9IGk7
Cj4gKyAgICAgICAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgICAgICAgICBOVl9XQVJO
KGRybSwgIkludmFsaWQgVFYgbm9ybSBzZXR0aW5nIFwiJXNcIlxuIiwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG5vdXZlYXVfdHZfbm9ybSk7CgpJIHdvdWxkIHJhdGhlciBnbyB3
aXRoCgppZiAoaSA8IDApCiBOVl9XQVJOCmVsc2UKIC4uLgoKPiAgICAgICAgIH0KCgotLSAKV2l0
aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL25vdXZlYXUK
