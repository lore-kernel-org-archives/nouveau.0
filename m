From: "Stefan Lippers-Hollmann" <s.L-H@gmx.de>
Subject: Re: [PATCH] drm/nouveau: only runtime suspend by default in optimus
	configuration
Date: Thu, 12 Dec 2013 19:48:25 +0000
Message-ID: <201312121949.49613.s.L-H@gmx.de>
References: <1386818341-11506-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1386818341-11506-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

SGkKCk9uIFRodXJzZGF5IDEyIERlY2VtYmVyIDIwMTMsIElsaWEgTWlya2luIHdyb3RlOgo+IFRo
ZSBpbnRlbnQgd2FzIHRvIG9ubHkgZW5hYmxlIGl0IGJ5IGRlZmF1bHQgZm9yIG9wdGltdXMsIGUu
Zy4gc2VlIHRoZQo+IHJ1bnRpbWVfaWRsZSBjYWxsYmFjay4gVGhlIHN1c3BlbmQgY2FsbGJhY2sg
bWF5IGJlIGNhbGxlZCBkaXJlY3RseSwgZS5nLgo+IGFzIGEgcmVzdWx0IG9mIG5vdXZlYXVfY3J0
Y19zZXRfY29uZmlnLgo+IAo+IFJlcG9ydGVkLWJ5OiBTdGVmYW4gTGlwcGVycy1Ib2xsbWFubiA8
cy5sLWhAZ214LmRlPgo+IFNpZ25lZC1vZmYtYnk6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0u
bWl0LmVkdT4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+IAo+IFNlZSBodHRw
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDEzLU5vdmVtYmVy
LzA0OTczOC5odG1sCj4gZm9yIG15IGFuYWx5c2lzIG9mIHRoZSBzaXR1YXRpb24uIFNpbmNlIHRo
aXMgaGFzIGJlZW4gYXJvdW5kIHNpbmNlIDMuMTIsIEknbQo+IHRhZ2dpbmcgaXQgZm9yIHN0YWJs
ZS4KW+KApl0KClRoYW5rcyBhIGxvdCwgdGhpcyB3b3JrcyBmaW5lIG9uIHRoZSBhZmZlY3RlZCBz
eXN0ZW1bMV0gKHdpdGggYW5kIAp3aXRob3V0IGEgbW9uaXRvciBhdHRhY2hlZCBhbmQgd2l0aG91
dCB0aGUgbm91dmVhdS5ydW5wbT0wIHdvcmthcm91bmQpOwpmZWVsIGZyZWUgdG8gYWRkCgpUZXN0
ZWQtYnk6IFN0ZWZhbiBMaXBwZXJzLUhvbGxtYW5uIDxzLmwtaEBnbXguZGU+CgpSZWdhcmRzCglT
dGVmYW4gTGlwcGVycy1Ib2xsbWFubgoKWzFdCXRyaXZpYWxseSByZWJhc2VkIGFnYWluc3QgMy4x
Mi40Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
