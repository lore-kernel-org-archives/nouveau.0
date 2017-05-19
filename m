From: Robert Foss <robert.foss-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v3] drm: Add DRM_MODE_ROTATE_ and
 DRM_MODE_REFLECT_ to UAPI
Date: Fri, 19 May 2017 16:40:46 -0400
Message-ID: <e62bab71-34c5-c106-a6bb-aafd05c3a203@collabora.com>
References: <20170518013911.29626-1-robert.foss@collabora.com>
 <20170518094956.GY12629@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170518094956.GY12629-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, liviu.dudau-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, syeh-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, =?UTF-8?Q?Kristian_H=c3=b8gsberg?= <hoegsberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, brian.starkey-5wv7dgnIgG8@public.gmane.org
List-Id: nouveau.vger.kernel.org

CgpPbiAyMDE3LTA1LTE4IDA1OjQ5IEFNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gV2Vk
LCBNYXkgMTcsIDIwMTcgYXQgMDk6Mzk6MTFQTSAtMDQwMCwgUm9iZXJ0IEZvc3Mgd3JvdGU6Cj4+
ICsvKgo+PiArICogRFJNX01PREVfUkVGTEVDVF88YXhpcz4KPj4gKyAqCj4+ICsgKiBTaWduYWxz
IHRoYXQgdGhlIGNvbnRlbnRzIG9mIGEgZHJtIHBsYW5lIGhhcyBiZWVuIHJlZmxlY3RlZCBpbgo+
PiArICogdGhlIDxheGlzPiBheGlzLgo+IAo+IFN0aWxsIHZhZ3VlLgoKQWNrLCBJJ2xsIGFkZCBz
b21lIHZlcmJpYWdlLgoKPiAKPiBBbHNvIHlvdSBkaWRuJ3QgcmVzcG9uZCB0byBteSBjb21tZW50
IGFib3V0IHRoZSB1c2Ugb2YgcGFzdCB0ZW5zZS4KCkZpeGVkIGluIHY0LgoKClJvYi4KCj4gCj4+
ICsgKgo+PiArICogVGhpcyBkZWZpbmUgaXMgcHJvdmlkZWQgYXMgYSBjb252ZW5pZW5jZSwgbG9v
a2luZyB1cCB0aGUgcHJvcGVydHkgaWQKPj4gKyAqIHVzaW5nIHRoZSBuYW1lLT5wcm9wIGlkIGxv
b2t1cCBpcyB0aGUgcHJlZmVycmVkIG1ldGhvZC4KPj4gKyAqLwo+PiArI2RlZmluZSBEUk1fTU9E
RV9SRUZMRUNUX1ggICAgICAoMTw8NCkKPj4gKyNkZWZpbmUgRFJNX01PREVfUkVGTEVDVF9ZICAg
ICAgKDE8PDUpCj4+ICsKPj4gKy8qCj4+ICsgKiBEUk1fTU9ERV9SRUZMRUNUX01BU0sKPj4gKyAq
Cj4+ICsgKiBCaXRtYXNrIHVzZWQgdG8gbG9vayBmb3IgZHJtIHBsYW5lIHJlZmxlY3Rpb25zLgo+
PiArICovCj4+ICsjZGVmaW5lIERSTV9NT0RFX1JFRkxFQ1RfTUFTSyAoXAo+PiArCQlEUk1fTU9E
RV9SRUZMRUNUX1ggfCBcCj4+ICsJCURSTV9NT0RFX1JFRkxFQ1RfWSkKPj4gKwo+PiArCj4+ICAg
c3RydWN0IGRybV9tb2RlX21vZGVpbmZvIHsKPj4gICAJX191MzIgY2xvY2s7Cj4+ICAgCV9fdTE2
IGhkaXNwbGF5Owo+PiAtLSAKPj4gMi4xMS4wLjQ1My5nNzg3Zjc1ZjA1Cj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxp
c3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
