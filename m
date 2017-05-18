From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] drm: Add DRM_MODE_ROTATE_ and
	DRM_MODE_REFLECT_ to UAPI
Date: Thu, 18 May 2017 10:42:03 +0100
Message-ID: <CACvgo51QR7YtODj3VOsUpMpvMJjP5=S2g96RhvdXkAb++yswqw@mail.gmail.com>
References: <20170518013911.29626-1-robert.foss@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170518013911.29626-1-robert.foss-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Robert Foss <robert.foss-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Vetter,
 Daniel" <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Sinclair Yeh <syeh-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, VMware Graphics <linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Mali DP Maintainers <malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jani
List-Id: nouveau.vger.kernel.org

SGkgUm9iLAoKT24gMTggTWF5IDIwMTcgYXQgMDI6MzksIFJvYmVydCBGb3NzIDxyb2JlcnQuZm9z
c0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPiBBZGQgRFJNX01PREVfUk9UQVRFXyBhbmQgRFJNX01P
REVfUkVGTEVDVF8gZGVmaW5lcyB0byB0aGUgVUFQSQo+IGFzIGEgY29udmVuaWVuY2UuCj4KPiBJ
ZGVhbGx5IHRoZSBEUk1fUk9UQVRFXyBhbmQgRFJNX1JFRkxFQ1RfIHByb3BlcnR5IGlkcyBhcmUg
bG9va2VkIHVwCj4gdGhyb3VnaCB0aGUgYXRvbWljIEFQSSwgYnV0IHJlYWxpemluZyB0aGF0IHVz
ZXJzcGFjZSBpcyBsaWtlbHkgdG8gdGFrZQo+IHNob3J0Y3V0cyBhbmQgYXNzdW1lIHRoYXQgdGhl
IGVudW0gdmFsdWVzIGFyZSB3aGF0IGlzIHNlbnQgb3ZlciB0aGUKPiB3aXJlLgo+Cj4gQXMgYSBy
ZXN1bHQgdGhlc2UgZGVmaW5lcyBhcmUgcHJvdmlkZWQgcHVyZWx5IGFzIGEgY29udmVuaWVuY2Ug
dG8KPiB1c2Vyc3BhY2UgYXBwbGljYXRpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEZv
c3MgPHJvYmVydC5mb3NzQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2MjoK
PiAgLSBDaGFuZ2VkIGRlZmluZSBwcmVmaXggZnJvbSBEUk1fTU9ERV9QUk9QXyB0byBEUk1fTU9E
RV8KPiAgLSBGaXggY29tcGlsYXRpb24gZXJyb3JzCj4gIC0gQ2hhbmdlZCBjb21tZW50IGZvcm1h
dHRpbmcKPiAgLSBEZWR1cGxpY2F0ZWQgY29tbWVudCBsaW5lcwo+ICAtIENsYXJpZmllZCBEUk1f
TU9ERV9QUk9QX1JFRkxFQ1RfIGNvbW1lbnQKPgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gIC0gTW92
ZWQgZGVmaW5lcyBmcm9tIGRybS5oIHRvIGRybV9tb2RlLmgKPiAgLSBDaGFuZ2VkIGRlZmluZSBw
cmVmaXggZnJvbSBEUk1fIHRvIERSTV9NT0RFX1BST1BfCj4gIC0gVXBkYXRlZCB1c2VzIG9mIHRo
ZSBkZWZpbmVzIHRvIHRoZSBuZXcgcHJlZml4Cj4gIC0gUmVtb3ZlZCBpbmNsdWRlIGZyb20gZHJt
X3JlY3QuYwo+ICAtIFN0b3BwZWQgdXNpbmcgdGhlIEJJVCgpIG1hY3JvCj4KUmV2aWV3ZWQtYnk6
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CgotRW1pbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGlu
ZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
