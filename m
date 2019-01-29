From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] drm/nouveau: Don't WARN_ON VCPI allocation failures
Date: Tue, 29 Jan 2019 23:15:59 +0000
Message-ID: <20190129231600.7E38220882__49326.3047932246$1548803771$gmane$org@mail.kernel.org>
References: <20190128210352.18066-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190128210352.18066-1-lyude@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sasha Levin <sashal@kernel.org>, Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

SGksCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlzIGNvbW1pdCBoYXMgYmVlbiBw
cm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhICJGaXhlczoiIHRhZywKZml4aW5nIGNvbW1p
dDogZjQ3OWMwYmE0YTE3IGRybS9ub3V2ZWF1L2ttcy9udjUwOiBpbml0aWFsIHN1cHBvcnQgZm9y
IERQIDEuMiBtdWx0aS1zdHJlYW0uCgpUaGUgYm90IGhhcyB0ZXN0ZWQgdGhlIGZvbGxvd2luZyB0
cmVlczogdjQuMjAuNSwgdjQuMTkuMTgsIHY0LjE0Ljk2LgoKdjQuMjAuNTogQnVpbGQgT0shCnY0
LjE5LjE4OiBCdWlsZCBPSyEKdjQuMTQuOTY6IEZhaWxlZCB0byBhcHBseSEgUG9zc2libGUgZGVw
ZW5kZW5jaWVzOgogICAgVW5hYmxlIHRvIGNhbGN1bGF0ZQoKCkhvdyBzaG91bGQgd2UgcHJvY2Vl
ZCB3aXRoIHRoaXMgcGF0Y2g/CgotLQpUaGFua3MsClNhc2hhCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
