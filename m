From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 11:30:44 +0200
Message-ID: <CAKMK7uEowhvc+4Jc6t2NAeE1joFaohJ6cP7sU-Akut6b3ta=1g@mail.gmail.com>
References: <20140709093124.11354.3774.stgit@patser>
 <20140722115737.GN15237@phenom.ffwll.local>
 <53CE56ED.4040109@vodafone.de>
 <20140722132652.GO15237@phenom.ffwll.local>
 <53CE6AFA.1060807@vodafone.de>
 <CAKMK7uG1d31zU_i__wc+Yq46A0x0tPeKnMBs+NHSmHS82uMsXQ@mail.gmail.com>
 <53CE84AA.9030703@amd.com>
 <CAKMK7uFa8vMBV9_JenbFGnFXtV_r9dk=WjbMkkCDWcauhrDdJg@mail.gmail.com>
 <53CE8A57.2000803@vodafone.de> <53CF58FB.8070609@canonical.com>
 <53CF5B9F.1050800@amd.com> <53CF5EFE.6070307@canonical.com>
 <53CF63C2.7070407@vodafone.de>
 <CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg@mail.gmail.com>
 <53CF6622.6060803@amd.com> <53CF699D.9070902@canonical.com>
 <53CF6B18.5070107@vodafone.de>
 <CAKMK7uGd65HR11thcv8KjDw-RnTa7W-QGOzFGFd+oO_hp8wyHA@mail.gmail.com>
 <53CF7035.2060808@amd.com> <53CF7191.2090008@canonical.com>
 <CAKMK7uGLqzePAREsWhX0D1oN4FdqKwPgAL6x8sULpJSqYH5LwA@mail.gmail.com>
 <53CF765E.7020802@vodafone.de>
 <CAKMK7uE1G-EjbJ2RAXC3ZfkaCo=Gber5PJuRG623Yoz9D=FmGw@mail.gmail.com>
 <53CF8010.9060809@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53CF8010.9060809-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gV2VkLCBKdWwgMjMsIDIwMTQgYXQgMTE6MjcgQU0sIENocmlzdGlhbiBLw7ZuaWcKPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gWW91IHN1Ym1pdCBhIGpvYiB0byB0aGUgaGFy
ZHdhcmUgYW5kIHRoZW4gYmxvY2sgdGhlIGpvYiB0byB3YWl0IGZvciByYWRlb24KPiB0byBiZSBm
aW5pc2hlZD8gV2VsbCB0aGFuIHRoaXMgd291bGQgaW5kZWVkIHJlcXVpcmUgYSBoYXJkd2FyZSBy
ZXNldCwgYnV0Cj4gd291bGRuJ3QgdGhhdCBtYWtlIHRoZSB3aG9sZSBwcm9ibGVtIGV2ZW4gd29y
c2U/Cj4KPiBJIG1lYW4gY3VycmVudGx5IHdlIGJsb2NrIG9uZSB1c2Vyc3BhY2UgcHJvY2VzcyB0
byB3YWl0IGZvciBvdGhlciBoYXJkd2FyZQo+IHRvIGJlIGZpbmlzaGVkIHdpdGggYSBidWZmZXIs
IGJ1dCB3aGF0IHlvdSBhcmUgZGVzY3JpYmluZyBoZXJlIGJsb2NrcyB0aGUKPiB3aG9sZSBoYXJk
d2FyZSB0byB3YWl0IGZvciBvdGhlciBoYXJkd2FyZSB3aGljaCBpbiB0aGUgZW5kIGJsb2NrcyBh
bGwKPiB1c2Vyc3BhY2UgcHJvY2VzcyBhY2Nlc3NpbmcgdGhlIGhhcmR3YXJlLgoKVGhlcmUgaXMg
bm90aGluZyBuZXcgaGVyZSB3aXRoIHByaW1lIC0gaWYgb25lIGNvbnRleHQgaGFuZ3MgdGhlIGdw
dSBpdApibG9ja3MgZXZlcnlvbmUgZWxzZSBvbiBpOTE1LgoKPiBUYWxraW5nIGFib3V0IGFsdGVy
bmF0aXZlIGFwcHJvYWNoZXMgd291bGRuJ3QgaXQgYmUgc2ltcGxlciB0byBqdXN0IG9mZmxvYWQK
PiB0aGUgd2FpdGluZyB0byBhIGRpZmZlcmVudCBrZXJuZWwgb3IgdXNlcnNwYWNlIHRocmVhZD8K
CldlbGwgdGhpcyBpcyBleGFjdGx5IHdoYXQgd2UnbGwgZG8gb25jZSB3ZSBoYXZlIHRoZSBzY2hl
ZHVsZXIuIEJ1dAp0aGlzIGlzIGFuIG9ydGhvZ29uYWwgaXNzdWUgaW1vLgotRGFuaWVsCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDAp
IDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1Cg==
