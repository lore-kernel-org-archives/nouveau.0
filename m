From: Bernhard Kaindl <bk-l3A5Bk7waGM@public.gmane.org>
Subject: Re: Fixes and workarounds for regressions and issues in
 the randr-1.2 branch
Date: Wed, 5 Sep 2007 17:14:09 +0200 (CEST)
Message-ID: <alpine.LNX.0.9999-openSUSE-5.0709051657130.24186@jbgna.fhfr.qr>
References: <alpine.LNX.0.999-openSUSE-1.0709031945560.22918@jbgna.fhfr.qr>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="168427776-1028984428-1189005091=:24186"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <alpine.LNX.0.999-openSUSE-1.0709031945560.22918-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
Content-ID: <alpine.LNX.0.9999-openSUSE-5.0709051711370.24186-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Arthur Huillet <arthur.huillet-GANU6spQydw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--168427776-1028984428-1189005091=:24186
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII; FORMAT=flowed
Content-ID: <alpine.LNX.0.9999-openSUSE-5.0709051711371.24186-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>

On Mon, 3 Sep 2007, Bernhard Kaindl wrote:
>
> They may help others as well but may e.g. also disable the Xv blitter
> which might be working for some (but didn't on my card) - more information
> is found in the text comments in the patches.

The patch "xf86-video-nouveau-Xv_noblit.diff" which disabled the Xv blitter
on some cards was wrong, thanks to encouragement from Arthur Huillet and that
I had now some time to check out what was failing, I found out that the Xv
problems which I see are limited to two situations:

1) randr active and monitors configured side-by-side with xrandr

2) Option "ShadowFB" is used (or other NoAccel trigger)

While I have no fix for 1) yet, 2) is easy to deal with properly:

As driving the blitter requires the DMA FIFO, and while the overlay might work
without the DMA FIFO, it has a fallback to the blitter for Composite, we think
it's best to also disable the overlay for now when pNV->NoAccel is <> 0.

I attached and appended patch for the current master branch, which (with one
small change, which I am going to talk in a separate mail) works for me with
Randr12 (except for the Xv in side-by-side mode).

Thanks to Arthur for the guidance and explanations!

Bernhard

--- src/nv_video.c	2007-09-05 16:02:00.000000000 +0200
+++ src/nv_video.c	2007-09-05 16:24:22.000000000 +0200
@@ -2275,10 +2275,13 @@
  	XF86VideoAdaptorPtr  blitAdaptor = NULL;
  	int                  num_adaptors;

-	if (pScrn->bitsPerPixel == 8)
-		return;
-
-	if (pNv->Architecture < NV_ARCH_50) {
+	/*
+	 * Driving the blitter requires the DMA FIFO. Using the FIFO
+	 * without accel causes DMA errors. While the overlay might
+	 * might work without accel, we also disable it for now when
+	 * acceleration is disabled:
+	 */
+	if (pScrn->bitsPerPixel != 8 && pNv->Architecture < NV_ARCH_50 && !pNv->NoAccel) {
  		overlayAdaptor = NVSetupOverlayVideo(pScreen);
  		blitAdaptor    = NVSetupBlitVideo(pScreen);
  	}
======================================================

PS: 
The inspiration to change from this logic

-       if (pScrn->bitsPerPixel == 8)
-               return;

to this logic

+       if (pScrn->bitsPerPixel != 8 && pNv->Architecture < NV_ARCH_50 && !pNv->NoAccel)
                 overlayAdaptor = NVSetupOverlayVideo(pScreen);
                 blitAdaptor    = NVSetupBlitVideo(pScreen);
         }

to disable overlay and blitter came from the NV50 change (which you see in the
patch) and it seems reasonable to do it also for 8bit as
xf86-video-intel-2.1.1/src/i810_video.c does it similar for 8bit:

     if (pScrn->bitsPerPixel != 8)
     {
         newAdaptor = I810SetupImageVideo(pScreen);
         I810InitOffscreenImages(pScreen);
     }

     num_adaptors = xf86XVListGenericAdaptors(pScrn, &adaptors);

     if(newAdaptor) {
... similar to nouveau code here
     }

     if(num_adaptors)
         xf86XVScreenInit(pScreen, adaptors, num_adaptors);

(The routine in nv_driver has basically the same code)

which means that generic, driver-independent Xv adaptors (such as the v4l Xv
adaptor) are always initialized, xf86XVListGenericAdaptors lists them if
such are there:

xf86XVListGenericAdaptors(
...
     /*
      * The v4l driver registers itself first, but can use surfaces registered
      * by other drivers.  So, call the v4l driver last.
      */
..
}

--168427776-1028984428-1189005091=:24186
Content-Type: TEXT/X-PATCH; NAME=Xv-NoAccel-master.diff
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.LNX.0.9999-openSUSE-5.0709051711310.24186-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=Xv-NoAccel-master.diff

LS0tIHNyYy9udl92aWRlby5jCTIwMDctMDktMDUgMTY6MDI6MDAuMDAwMDAw
MDAwICswMjAwDQorKysgc3JjL252X3ZpZGVvLmMJMjAwNy0wOS0wNSAxNjoy
NDoyMi4wMDAwMDAwMDAgKzAyMDANCkBAIC0yMjc1LDEwICsyMjc1LDEzIEBA
DQogCVhGODZWaWRlb0FkYXB0b3JQdHIgIGJsaXRBZGFwdG9yID0gTlVMTDsN
CiAJaW50ICAgICAgICAgICAgICAgICAgbnVtX2FkYXB0b3JzOw0KIA0KLQlp
ZiAocFNjcm4tPmJpdHNQZXJQaXhlbCA9PSA4KQ0KLQkJcmV0dXJuOw0KLQ0K
LQlpZiAocE52LT5BcmNoaXRlY3R1cmUgPCBOVl9BUkNIXzUwKSB7DQorCS8q
DQorCSAqIERyaXZpbmcgdGhlIGJsaXR0ZXIgcmVxdWlyZXMgdGhlIERNQSBG
SUZPLiBVc2luZyB0aGUgRklGTw0KKwkgKiB3aXRob3V0IGFjY2VsIGNhdXNl
cyBETUEgZXJyb3JzLiBXaGlsZSB0aGUgb3ZlcmxheSBtaWdodA0KKwkgKiBt
aWdodCB3b3JrIHdpdGhvdXQgYWNjZWwsIHdlIGFsc28gZGlzYWJsZSBpdCBm
b3Igbm93IHdoZW4NCisJICogYWNjZWxlcmF0aW9uIGlzIGRpc2FibGVkOg0K
KwkgKi8NCisJaWYgKHBTY3JuLT5iaXRzUGVyUGl4ZWwgIT0gOCAmJiBwTnYt
PkFyY2hpdGVjdHVyZSA8IE5WX0FSQ0hfNTAgJiYgIXBOdi0+Tm9BY2NlbCkg
ew0KIAkJb3ZlcmxheUFkYXB0b3IgPSBOVlNldHVwT3ZlcmxheVZpZGVvKHBT
Y3JlZW4pOw0KIAkJYmxpdEFkYXB0b3IgICAgPSBOVlNldHVwQmxpdFZpZGVv
KHBTY3JlZW4pOw0KIAl9DQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg0KVGhlIGluc3BpcmF0aW9u
IHRvIGNoYW5nZSBmcm9tIHRoaXMgbG9naWMNCg0KLSAgICAgICBpZiAocFNj
cm4tPmJpdHNQZXJQaXhlbCA9PSA4KQ0KLSAgICAgICAgICAgICAgIHJldHVy
bjsNCg0KdG8gdGhpcyBsb2dpYw0KDQorICAgICAgIGlmIChwU2Nybi0+Yml0
c1BlclBpeGVsICE9IDggJiYgcE52LT5BcmNoaXRlY3R1cmUgPCBOVl9BUkNI
XzUwICYmICFwTnYtPk5vQWNjZWwpDQogICAgICAgICAgICAgICAgb3Zlcmxh
eUFkYXB0b3IgPSBOVlNldHVwT3ZlcmxheVZpZGVvKHBTY3JlZW4pOw0KICAg
ICAgICAgICAgICAgIGJsaXRBZGFwdG9yICAgID0gTlZTZXR1cEJsaXRWaWRl
byhwU2NyZWVuKTsNCiAgICAgICAgfQ0KDQp0byBkaXNhYmxlIG92ZXJsYXkg
YW5kIGJsaXR0ZXIgY2FtZSBmcm9tIHRoZSBOVjUwIGNoYW5nZSAod2hpY2gg
eW91IHNlZSBhdm92ZSkNCmFuZCBpdCBzZWVtcyByZWFzb25hYmxlIHRvIGRv
IGl0IGFsc28gZm9yIDhiaXQgYXMNCnhmODYtdmlkZW8taW50ZWwtMi4xLjEv
c3JjL2k4MTBfdmlkZW8uYyBkb2VzIGl0IHNpbWlsYXIgZm9yIDhiaXQ6DQoN
CiAgICBpZiAocFNjcm4tPmJpdHNQZXJQaXhlbCAhPSA4KQ0KICAgIHsNCiAg
ICAgICAgbmV3QWRhcHRvciA9IEk4MTBTZXR1cEltYWdlVmlkZW8ocFNjcmVl
bik7DQogICAgICAgIEk4MTBJbml0T2Zmc2NyZWVuSW1hZ2VzKHBTY3JlZW4p
Ow0KICAgIH0NCg0KICAgIG51bV9hZGFwdG9ycyA9IHhmODZYVkxpc3RHZW5l
cmljQWRhcHRvcnMocFNjcm4sICZhZGFwdG9ycyk7DQoNCiAgICBpZihuZXdB
ZGFwdG9yKSB7DQouLi4gc2ltaWxhciB0byBub3V2ZWF1IGNvZGUgaGVyZQ0K
ICAgIH0NCg0KICAgIGlmKG51bV9hZGFwdG9ycykNCiAgICAgICAgeGY4NlhW
U2NyZWVuSW5pdChwU2NyZWVuLCBhZGFwdG9ycywgbnVtX2FkYXB0b3JzKTsN
Cg0KKFRoZSByb3V0aW5lIGluIG52X2RyaXZlciBoYXMgYmFzaWNhbGx5IHRo
ZSBzYW1lIGNvZGUpDQoNCndoaWNoIG1lYW5zIHRoYXQgZ2VuZXJpYywgZHJp
dmVyLWluZGVwZW5kZW50IFh2IGFkYXB0b3JzIChzdWNoIGFzIHRoZSB2NGwg
WHYNCmFkYXB0b3IpIGFyZSBhbHdheXMgaW5pdGlhbGl6ZWQsIHhmODZYVkxp
c3RHZW5lcmljQWRhcHRvcnMgbGlzdHMgdGhlbSBpZg0Kc3VjaCBhcmUgdGhl
cmU6DQoNCnhmODZYVkxpc3RHZW5lcmljQWRhcHRvcnMoDQouLi4NCiAgICAv
Kg0KICAgICAqIFRoZSB2NGwgZHJpdmVyIHJlZ2lzdGVycyBpdHNlbGYgZmly
c3QsIGJ1dCBjYW4gdXNlIHN1cmZhY2VzIHJlZ2lzdGVyZWQNCiAgICAgKiBi
eSBvdGhlciBkcml2ZXJzLiAgU28sIGNhbGwgdGhlIHY0bCBkcml2ZXIgbGFz
dC4NCiAgICAgKi8NCi4uDQp9DQoNCg==

--168427776-1028984428-1189005091=:24186
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--168427776-1028984428-1189005091=:24186--
