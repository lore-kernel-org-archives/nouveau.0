From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Subject: Re: [PATCH 1/2] drm: allow limiting the scatter list size.
Date: Tue, 18 Aug 2020 10:31:19 +0200
Message-ID: <03c03129-db27-c6da-df8f-909141d2a3f7@amd.com>
References: <20200818074828.9509-1-kraxel@redhat.com>
 <20200818074828.9509-2-kraxel@redhat.com>
 <9c355d64-1a61-eb59-be80-d9fc863ddf22@amd.com>
 <20200818082703.7z6fcvoymiqow5kw@sirius.home.kraxel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200818082703.7z6fcvoymiqow5kw-+1R1O5xHTTbdA3i/FDNR4v2rGJfVMZC7@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:DRM DRIVERS FOR VIVANTE GPU IP" <etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:ARM/Rockchip SoC support" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Russell King <linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

QW0gMTguMDguMjAgdW0gMTA6Mjcgc2NocmllYiBHZXJkIEhvZmZtYW5uOgo+IE9uIFR1ZSwgQXVn
IDE4LCAyMDIwIGF0IDA5OjU3OjU5QU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDE4LjA4LjIwIHVtIDA5OjQ4IHNjaHJpZWIgR2VyZCBIb2ZmbWFubjoKPj4+IEFkZCBtYXhf
c2VnbWVudCBhcmd1bWVudCB0byBkcm1fcHJpbWVfcGFnZXNfdG9fc2coKS4gIFdoZW4gc2V0IHBh
c3MgaXQKPj4+IHRocm91Z2ggdG8gdGhlIF9fc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlcygpIGNh
bGwsIG90aGVyd2lzZSB1c2UKPj4+IFNDQVRURVJMSVNUX01BWF9TRUdNRU5ULgo+Pj4KPj4+IEFs
c28gYWRkIG1heF9zZWdtZW50IGZpZWxkIHRvIGdlbSBvYmplY3RzIGFuZCBwYXNzIGl0IHRvCj4+
PiBkcm1fcHJpbWVfcGFnZXNfdG9fc2coKSBjYWxscyBpbiBkcml2ZXJzIGFuZCBoZWxwZXJzLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+
PiBJJ20gbWlzc2luZyBhbiBleHBsYW5hdGlvbiB3aHkgdGhpcyBzaG91bGQgYmUgdXNlZnVsIChp
dCBjZXJ0YWlubHkgaXMpLgo+IHZpcnRpby1ncHUgbmVlZHMgdGhpcyB0byB3b3JrIHByb3Blcmx5
IHdpdGggU0VWIChzZWUgcGF0Y2ggMi8yIG9mIHRoaXMKPiBzZXJpZXMpLgoKWWVhaCwgdGhhdCdz
IHRoZSBwcm9ibGVtIHBhdGNoIDIvMiBuZXZlciBzaG93ZWQgdXAgaGVyZSA6KQoKPj4gQW5kIHRo
ZSBtYXhpbXVtIHNlZ21lbnQgc2l6ZSBzZWVtcyBtaXNwbGFjZWQgaW4gdGhlIEdFTSBvYmplY3Qu
IFRoaXMgaXMKPj4gdXN1YWxseSBhIHByb3BlcnR5IG9mIHRoZSBkZXZpY2Ugb3IgZXZlbiBjb21w
bGV0ZWx5IGNvbnN0YW50Lgo+IFBsYWNpbmcgaXQgaW4gZHJtX2RldmljZSBpbnN0ZWFkIHdvdWxk
IGluZGVlZCB3b3JrIGZvciB2aXJ0aW8tZ3B1LCBzbyBJCj4gZ3Vlc3MgeW91IGFyZSBzdWdnZXN0
aW5nIHRoYXQgaW5zdGVhZD8KClRoYXQgaXMgcHJvYmFibHkgdGhlIGJlc3QgYXBwcm9hY2gsIHll
cy4KCkZvciBJbnRlbCBhbmQgQU1EIGl0IGNvdWxkIGV2ZW4gYmUgZ2xvYmFsL2NvbnN0YW50LCBi
dXQgaXQgY2VydGFpbmx5IApkb2Vzbid0IG5lZWRzIHRvIGJlIGtlcHQgYXJvdW5kIGZvciBlYWNo
IGJ1ZmZlci4KCkNocmlzdGlhbi4KCj4KPiB0YWtlIGNhcmUsCj4gICAgR2VyZAo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
