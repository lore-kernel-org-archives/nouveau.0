From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/40] [Set 8] Rid W=1 warnings from GPU
Date: Mon, 23 Nov 2020 12:30:16 +0000
Message-ID: <20201123123016.GA4716@dell>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <feda98c5-a677-7bf5-c1e7-2bf311ba8097@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <feda98c5-a677-7bf5-c1e7-2bf311ba8097-5C7GfCeVMHo@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Tao Zhou <tao.zhou1-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sonny Jiang <sonny.jiang-5C7GfCeVMHo@public.gmane.org>, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Qinglang Miao <miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Likun Gao <Likun.Gao-5C7GfCeVMHo@public.gmane.org>, Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Marek <jonathan-eSc4qw6YbEQ@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Luben Tuikov <luben.tuikov-5C7GfCeVMHo@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jiansong Chen <Jiansong.Chen-5C7GfCeVMHo@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fritz Koenig <frkoenig-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Kalyan Thota <kalyan_t-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerome Glisse <glisse-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gTW9uLCAyMyBOb3YgMjAyMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKCj4gT25seSBza2lt
bWVkIG92ZXIgdGhlbSwgYnV0IG92ZXIgYWxsIGxvb2tzIHNhbmUgdG8gbWUuCj4gCj4gU2VyaWVz
IGlzIEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CgpUaGFua3MgQ2hyaXN0aWFuLCBtdWNoIGFwcHJlY2lhdGVkLgoKPiBBbSAyMy4xMS4yMCB1bSAx
MjoxOCBzY2hyaWViIExlZSBKb25lczoKPiA+IFRoaXMgc2V0IGlzIHBhcnQgb2YgYSBsYXJnZXIg
ZWZmb3J0IGF0dGVtcHRpbmcgdG8gY2xlYW4tdXAgVz0xCj4gPiBrZXJuZWwgYnVpbGRzLCB3aGlj
aCBhcmUgY3VycmVudGx5IG92ZXJ3aGVsbWluZ2x5IHJpZGRsZWQgd2l0aAo+ID4gbmlnZ2x5IGxp
dHRsZSB3YXJuaW5ncy4KPiA+IAo+ID4gT25seSA5MDAgKGZyb20gNTAwMCkgdG8gZ28hCj4gPiAK
PiA+IExlZSBKb25lcyAoNDApOgo+ID4gICAgZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlOiBDb25z
dW1lIG91ciBvd24gaGVhZGVyIHdoZXJlIHRoZSBwcm90b3R5cGVzCj4gPiAgICAgIGFyZSBsb2Nh
dGVkCj4gPiAgICBkcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtOiBBZGQgZGVzY3JpcHRpb24gZm9y
ICdwYWdlX2ZsYWdzJwo+ID4gICAgZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liOiBQcm92aWRlIGRv
Y3MgZm9yICdhbWRncHVfaWJfc2NoZWR1bGUoKSdzCj4gPiAgICAgICdqb2InIHBhcmFtCj4gPiAg
ICBkcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydDogQ29ycmVjdCBwb3NzaWJsZSBjb3B5L3Bhc3Rl
IG9yIGRvYy1yb3QKPiA+ICAgICAgbWlzbmFtaW5nIGlzc3VlCj4gPiAgICBkcm0vYW1kL2FtZGdw
dS9jaWtfaWg6IFN1cHBseSBkZXNjcmlwdGlvbiBmb3IgJ2loJyBpbgoKWy4uLl0KCi0tIApMZWUg
Sm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZp
Y2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xs
b3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
