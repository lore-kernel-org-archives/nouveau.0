From: Sergey Senozhatsky <sergey.senozhatsky.work-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau: DRM: GPU lockup - switching to software fbcon
Date: Wed, 19 Jun 2019 14:48:26 +0900
Message-ID: <20190619054826.GA2059@jagdpanzerIV>
References: <20190614024957.GA9645@jagdpanzerIV>
 <20190619050811.GA15221@jagdpanzerIV>
 <CAKb7UvhdN=RUdfrnWswT4ANK5UwPcM-upDP85=84zsCF+a5-bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7UvhdN=RUdfrnWswT4ANK5UwPcM-upDP85=84zsCF+a5-bg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

T24gKDA2LzE5LzE5IDAxOjIwKSwgSWxpYSBNaXJraW4gd3JvdGU6Cj4gT24gV2VkLCBKdW4gMTks
IDIwMTkgYXQgMTowOCBBTSBTZXJnZXkgU2Vub3poYXRza3kKPiA8c2VyZ2V5LnNlbm96aGF0c2t5
LndvcmtAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiAoMDYvMTQvMTkgMTE6NTApLCBTZXJn
ZXkgU2Vub3poYXRza3kgd3JvdGU6Cj4gPiA+IGRtZXNnCj4gPiA+Cj4gPiA+ICBub3V2ZWF1IDAw
MDA6MDE6MDAuMDogRFJNOiBHUFUgbG9ja3VwIC0gc3dpdGNoaW5nIHRvIHNvZnR3YXJlIGZiY29u
Cj4gPiA+ICBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmlmbzogU0NIRURfRVJST1IgMGEgW0NUWFNX
X1RJTUVPVVRdCj4gPiA+ICBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmlmbzogcnVubGlzdCAwOiBz
Y2hlZHVsZWQgZm9yIHJlY292ZXJ5Cj4gPiA+ICBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmlmbzog
Y2hhbm5lbCA1OiBraWxsZWQKPiA+ID4gIG5vdXZlYXUgMDAwMDowMTowMC4wOiBmaWZvOiBlbmdp
bmUgNjogc2NoZWR1bGVkIGZvciByZWNvdmVyeQo+ID4gPiAgbm91dmVhdSAwMDAwOjAxOjAwLjA6
IGZpZm86IGVuZ2luZSAwOiBzY2hlZHVsZWQgZm9yIHJlY292ZXJ5Cj4gPiA+ICBub3V2ZWF1IDAw
MDA6MDE6MDAuMDogZmlyZWZveFs0NzZdOiBjaGFubmVsIDUga2lsbGVkIQo+ID4gPiAgbm91dmVh
dSAwMDAwOjAxOjAwLjA6IGZpcmVmb3hbNDc2XTogZmFpbGVkIHRvIGlkbGUgY2hhbm5lbCA1IFtm
aXJlZm94WzQ3Nl1dCj4gPiA+Cj4gPiA+IEl0IGxvY2t1cHMgc2V2ZXJhbCB0aW1lcyBhIGRheS4g
VHdpY2UgaW4ganVzdCBvbmUgaG91ciB0b2RheS4KPiA+ID4gQ2FuIHdlIGZpeCB0aGlzPwo+ID4K
PiA+IFVudXNhYmxlCj4gCj4gQXJlIHlvdSB1c2luZyBhIEdUWCA2NjAgYnkgYW55IGNoYW5jZT8g
WW91J3ZlIHByb3ZpZGVkIHJhdGhlciBtaW5pbWFsCj4gc3lzdGVtIGluZm8uCgowMTowMC4wIFZH
QSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IE5WSURJQSBDb3Jwb3JhdGlvbiBHSzIwOEIgW0dlRm9y
Y2UgR1QgNzMwXSAocmV2IGExKQoKCS1zcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXU=
