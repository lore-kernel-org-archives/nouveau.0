From: Bernhard Kaindl <bk-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] [RANDR-1.2 branch] [NVSwitchMode] X crash by
 calling XF86 VidMode extension
Date: Tue, 4 Sep 2007 20:39:48 +0200 (CEST)
Message-ID: <alpine.LNX.0.999-openSUSE-1.0709041603260.25038@jbgna.fhfr.qr>
References: <alpine.LNX.0.999-openSUSE-1.0709031945560.22918@jbgna.fhfr.qr>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="168427776-2143782035-1188931191=:8889"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <alpine.LNX.0.999-openSUSE-1.0709031945560.22918-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--168427776-2143782035-1188931191=:8889
Content-Type: TEXT/PLAIN; charset=us-ascii; format=flowed

On Mon, 3 Sep 2007, Bernhard Kaindl wrote:
> 
> Hi,
>   Please find attached the patches which I currently use on my desktop
> machine for dual head with the randr branch to fix the issues which I found.
>
> They may help others as well but may e.g. also disable the Xv blitter
> which might be working for some (but didn't on my card) - more information
> is found in the text comments in the patches.

Anther patch: This one fixes a crash in the randr-1.2 branch which always
happens when a program tries to set a video mode thru the XF86 VidMode
extension (which are very many)

Patch below and in attachment.

Best Regards.
Bernhard

// With the current randr-1.2 branch, the X server crashes when
// the XF86 VidMode extension is used to switch the video mode.
//
// SDL and freeglut use it, so for example all program which
// which use either to switch to fullscreen mode cause the crash.
//
// Reason for the crash: The current implmentation of NVSwitchMode()
// which gets called by the extension to set the video mode tries
// to call a non-existing function.
//
// I implemented a version of that function which should do what
// is needed and with this, trackballs and glest not longer crash
// my X server.
//
// Since on my card (G70 - GeForce 7600 GS - NV40 generation), changing
// video modes is broken (using the xrandr does not give e.g. a working
/  1280x1024 mode), I didn't test to actually switch to different
// resolutionss thru the extension, but the X crash is gone and there
// is an implementation which could work for some, so it's definitely
// an improvement.
// 
// I also removed the prototypes for two other undefined functions
// from nv_proto.h
//
--- nouveau-0.20070903/xf86-video-nouveau/src/nv_crtc.c
+++ nouveau-0.20070902/xf86-video-nouveau/src/nv_crtc.c
@@ -1297,6 +1324,15 @@ void NVCrtcSetCursor(xf86CrtcPtr crtc, B
    NVWriteVgaCrtc(crtc, NV_VGA_CRTCX_CURCTL1, current);
  }

+void NVSetMode(ScrnInfoPtr pScrn, DisplayModePtr mode)
+{
+	xf86CrtcConfigPtr   xf86_config = XF86_CRTC_CONFIG_PTR(pScrn);
+	int i;
+	for (i = 0; i < xf86_config->num_crtc; i++)
+		if (xf86_config->crtc[i]->enabled)
+			nv_crtc_mode_set(xf86_config->crtc[i], mode, NULL, 0,0);
+}
+
  static void NVCrtcWriteDacMask(xf86CrtcPtr crtc, CARD8 value)
  {
    ScrnInfoPtr pScrn = crtc->scrn;
--- nouveau-0.20070903/xf86-video-nouveau/src/nv_driver.c
+++ nouveau-0.20070902/xf86-video-nouveau/src/nv_driver.c
@@ -818,7 +818,42 @@ NVProbe(DriverPtr drv, int flags)
  	return foundScreen;
  }

-/* Usually mandatory */
+/*
+ * This function is needed by the XF86VideMode extension which is used by
+ * the current pre-randr clients. The API covers only one screen, but
+ * implementing the latest modesetting framework like done in the Intel
+ * driver is more than a few lines of patch, the randr-1.2 branch in its
+ * current form cannot the mode switching in a perfect way right now.
+ *
+ * As there are effors to bring modesetting into the kernel, controlled
+ * thru the drm module, of which nouveu currently requires its own version,
+ * one could even try to go one step further and try to bring the nouveau
+ * modesetting into the nouveau kernel module.c (as a first step which does
+ * not require a kernel patch), which would increase the chances that the
+ * text console is properly restored after X dies as the kernel can simply
+ * restore the text console when the process which has changed modes thru
+ * /dev/drm has been disconnected from the device.
+ *
+ * The current implementation simply tries to set each crtc to the mode
+ * for which the application asks for, hoping that one of them gives a
+ * usable monitor display (no error handling implemented), and sets
+ * the viewport of each crtc to (0,0), which means essentially clone
+ * mode with all monitors which managed to switch to the mode showing
+ * top left area of the framebuffer memory if the application's window
+ * is there. This is essentially what the Intel driver did in earlyer
+ * versions. To restore a LeftOf/RightOf layout, you two randr calls
+ * seem to be neccessary, one which sets the reversed layout, followed
+ * by one which sets the desired layout:
+ *
+ * xrandr --output Digital-1 --left-of Digital-0
+ * xrandr --output Digital-0 --left-of Digital-1
+ *
+ * FIXME: This could be fixed by getting the current viewports for the
+ * CRTCs and use these during mode settings, or (preferably) by getting
+ * the current screen layout and adapting the new viewports so that
+ * a new, continuos screen layout with the same monitor arrangement,
+ * but in the new mode is set up.
+ */
  Bool
  NVSwitchMode(int scrnIndex, DisplayModePtr mode, int flags)
  {
@@ -829,12 +864,16 @@ NVSwitchMode(int scrnIndex, DisplayModeP
  	NVFBLayout *pLayout = &pNv->CurrentLayout;

  	if (pLayout->mode != mode) {
-		if (!NVSetMode(pScrn, mode, RR_Rotate_0))
+#ifdef modesetting_has_error_handling // not implemented yet
+		if (NVSetMode(pScrn, mode))
+			pLayout->mode = mode;
+		else
  			ret = FALSE;
+#else
+		NVSetMode(pScrn, mode);
+		pLayout->mode = mode;
+#endif
  	}
-
-	pLayout->mode = mode;
-
  	return ret;
  }

--- nouveau-0.20070903/xf86-video-nouveau/src/nv_proto.h
+++ nouveau-0.20070902/xf86-video-nouveau/src/nv_proto.h
@@ -97,9 +97,7 @@ void nForceUpdateArbitrationSettings (un


  /* nv_crtc.c */
-Bool NVSetMode(ScrnInfoPtr pScrn, DisplayModePtr pMode, Rotation rotation);
-Bool NVCrtcSetMode(xf86CrtcPtr crtc, DisplayModePtr pMode, Rotation rotation, int x, int y);
-DisplayModePtr NVCrtcFindClosestMode(xf86CrtcPtr crtc, DisplayModePtr pMode);
+void NVSetMode(ScrnInfoPtr pScrn, DisplayModePtr mode);
  void NVCrtcSetBase (xf86CrtcPtr crtc, int x, int y);
  void NVCrtcLoadPalette(xf86CrtcPtr crtc);
  void NVCrtcBlankScreen(xf86CrtcPtr crtc, Bool on);
--168427776-2143782035-1188931191=:8889
Content-Type: TEXT/x-patch; name=xf86-video-nouveau-VidModExt.diff
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.LNX.0.999-openSUSE-1.0709042039481.8889-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
Content-Description: 
Content-Disposition: attachment; filename=xf86-video-nouveau-VidModExt.diff

Ly8NCi8vIEF1dGhvcjogQmVybmhhcmQgS2FpbmRsIDxia0BzdXNlLmRlPg0K
Ly8NCi8vIFRoaXMgcGF0Y2ggYXBwbGllcyB0byB0aGUgcmFuZHItMS4yIGJy
YW5jaCBvbmx5IQ0KLy8NCi8vIFdpdGggdGhlIGN1cnJlbnQgcmFuZHItMS4y
IGJyYW5jaCwgdGhlIFggc2VydmVyIGNyYXNoZXMgd2hlbg0KLy8gdGhlIFhG
ODYgVmlkTW9kZSBleHRlbnNpb24gaXMgdXNlZCB0byBzd2l0Y2ggdGhlIHZp
ZGVvIG1vZGUuDQovLw0KLy8gU0RMIGFuZCBmcmVlZ2x1dCB1c2UgaXQsIHNv
IGZvciBleGFtcGxlIGFsbCBwcm9ncmFtIHdoaWNoDQovLyB3aGljaCB1c2Ug
ZWl0aGVyIHRvIHN3aXRjaCB0byBmdWxsc2NyZWVuIG1vZGUgY2F1c2UgdGhl
IGNyYXNoLg0KLy8NCi8vIFJlYXNvbiBmb3IgdGhlIGNyYXNoOiBUaGUgY3Vy
cmVudCBpbXBsbWVudGF0aW9uIG9mIE5WU3dpdGNoTW9kZSgpDQovLyB3aGlj
aCBnZXRzIGNhbGxlZCBieSB0aGUgZXh0ZW5zaW9uIHRvIHNldCB0aGUgdmlk
ZW8gbW9kZSB0cmllcw0KLy8gdG8gY2FsbCBhIG5vbi1leGlzdGluZyBmdW5j
dGlvbi4NCi8vDQovLyBJIGltcGxlbWVudGVkIGEgdmVyc2lvbiBvZiB0aGF0
IGZ1bmN0aW9uIHdoaWNoIHNob3VsZCBkbyB3aGF0DQovLyBpcyBuZWVkZWQg
YW5kIHdpdGggdGhpcywgdHJhY2tiYWxscyBhbmQgZ2xlc3Qgbm90IGxvbmdl
ciBjcmFzaA0KLy8gbXkgWCBzZXJ2ZXIuDQovLw0KLy8gU2luY2Ugb24gbXkg
Y2FyZCAoRzcwIC0gR2VGb3JjZSA3NjAwIEdTIC0gTlY0MCBnZW5lcmF0aW9u
KSwgY2hhbmdpbmcNCi8vIHZpZGVvIG1vZGVzIGlzIGJyb2tlbiAodXNpbmcg
dGhlIHhyYW5kciBkb2VzIG5vdCBnaXZlIGUuZy4gYSB3b3JraW5nDQovICAx
MjgweDEwMjQgbW9kZSksIEkgZGlkbid0IHRlc3QgdG8gYWN0dWFsbHkgc3dp
dGNoIHRvIGRpZmZlcmVudA0KLy8gcmVzb2x1dGlvbnNzIHRocnUgdGhlIGV4
dGVuc2lvbiwgYnV0IHRoZSBYIGNyYXNoIGlzIGdvbmUgYW5kIHRoZXJlDQov
LyBpcyBhbiBpbXBsZW1lbnRhdGlvbiB3aGljaCBjb3VsZCB3b3JrIGZvciBz
b21lLCBzbyBpdCdzIGRlZmluaXRlbHkNCi8vIGFuIGltcHJvdmVtZW50Lg0K
Ly8gDQovLyBJIGFsc28gcmVtb3ZlZCB0aGUgcHJvdG90eXBlcyBmb3IgdHdv
IG90aGVyIHVuZGVmaW5lZCBmdW5jdGlvbnMNCi8vIGZyb20gbnZfcHJvdG8u
aA0KLy8NCi0tLSBub3V2ZWF1LTAuMjAwNzA5MDMveGY4Ni12aWRlby1ub3V2
ZWF1L3NyYy9udl9jcnRjLmMNCisrKyBub3V2ZWF1LTAuMjAwNzA5MDIveGY4
Ni12aWRlby1ub3V2ZWF1L3NyYy9udl9jcnRjLmMNCkBAIC0xMjk3LDYgKzEz
MjQsMTUgQEAgdm9pZCBOVkNydGNTZXRDdXJzb3IoeGY4NkNydGNQdHIgY3J0
YywgQg0KICAgTlZXcml0ZVZnYUNydGMoY3J0YywgTlZfVkdBX0NSVENYX0NV
UkNUTDEsIGN1cnJlbnQpOw0KIH0NCiANCit2b2lkIE5WU2V0TW9kZShTY3Ju
SW5mb1B0ciBwU2NybiwgRGlzcGxheU1vZGVQdHIgbW9kZSkNCit7DQorCXhm
ODZDcnRjQ29uZmlnUHRyICAgeGY4Nl9jb25maWcgPSBYRjg2X0NSVENfQ09O
RklHX1BUUihwU2Nybik7DQorCWludCBpOw0KKwlmb3IgKGkgPSAwOyBpIDwg
eGY4Nl9jb25maWctPm51bV9jcnRjOyBpKyspDQorCQlpZiAoeGY4Nl9jb25m
aWctPmNydGNbaV0tPmVuYWJsZWQpDQorCQkJbnZfY3J0Y19tb2RlX3NldCh4
Zjg2X2NvbmZpZy0+Y3J0Y1tpXSwgbW9kZSwgTlVMTCwgMCwwKTsNCit9DQor
DQogc3RhdGljIHZvaWQgTlZDcnRjV3JpdGVEYWNNYXNrKHhmODZDcnRjUHRy
IGNydGMsIENBUkQ4IHZhbHVlKQ0KIHsNCiAgIFNjcm5JbmZvUHRyIHBTY3Ju
ID0gY3J0Yy0+c2NybjsNCi0tLSBub3V2ZWF1LTAuMjAwNzA5MDMveGY4Ni12
aWRlby1ub3V2ZWF1L3NyYy9udl9kcml2ZXIuYw0KKysrIG5vdXZlYXUtMC4y
MDA3MDkwMi94Zjg2LXZpZGVvLW5vdXZlYXUvc3JjL252X2RyaXZlci5jDQpA
QCAtODE4LDcgKzgxOCw0MiBAQCBOVlByb2JlKERyaXZlclB0ciBkcnYsIGlu
dCBmbGFncykNCiAJcmV0dXJuIGZvdW5kU2NyZWVuOw0KIH0NCiANCi0vKiBV
c3VhbGx5IG1hbmRhdG9yeSAqLw0KKy8qDQorICogVGhpcyBmdW5jdGlvbiBp
cyBuZWVkZWQgYnkgdGhlIFhGODZWaWRlTW9kZSBleHRlbnNpb24gd2hpY2gg
aXMgdXNlZCBieQ0KKyAqIHRoZSBjdXJyZW50IHByZS1yYW5kciBjbGllbnRz
LiBUaGUgQVBJIGNvdmVycyBvbmx5IG9uZSBzY3JlZW4sIGJ1dA0KKyAqIGlt
cGxlbWVudGluZyB0aGUgbGF0ZXN0IG1vZGVzZXR0aW5nIGZyYW1ld29yayBs
aWtlIGRvbmUgaW4gdGhlIEludGVsDQorICogZHJpdmVyIGlzIG1vcmUgdGhh
biBhIGZldyBsaW5lcyBvZiBwYXRjaCwgdGhlIHJhbmRyLTEuMiBicmFuY2gg
aW4gaXRzDQorICogY3VycmVudCBmb3JtIGNhbm5vdCB0aGUgbW9kZSBzd2l0
Y2hpbmcgaW4gYSBwZXJmZWN0IHdheSByaWdodCBub3cuDQorICoNCisgKiBB
cyB0aGVyZSBhcmUgZWZmb3JzIHRvIGJyaW5nIG1vZGVzZXR0aW5nIGludG8g
dGhlIGtlcm5lbCwgY29udHJvbGxlZA0KKyAqIHRocnUgdGhlIGRybSBtb2R1
bGUsIG9mIHdoaWNoIG5vdXZldSBjdXJyZW50bHkgcmVxdWlyZXMgaXRzIG93
biB2ZXJzaW9uLA0KKyAqIG9uZSBjb3VsZCBldmVuIHRyeSB0byBnbyBvbmUg
c3RlcCBmdXJ0aGVyIGFuZCB0cnkgdG8gYnJpbmcgdGhlIG5vdXZlYXUNCisg
KiBtb2Rlc2V0dGluZyBpbnRvIHRoZSBub3V2ZWF1IGtlcm5lbCBtb2R1bGUu
YyAoYXMgYSBmaXJzdCBzdGVwIHdoaWNoIGRvZXMNCisgKiBub3QgcmVxdWly
ZSBhIGtlcm5lbCBwYXRjaCksIHdoaWNoIHdvdWxkIGluY3JlYXNlIHRoZSBj
aGFuY2VzIHRoYXQgdGhlDQorICogdGV4dCBjb25zb2xlIGlzIHByb3Blcmx5
IHJlc3RvcmVkIGFmdGVyIFggZGllcyBhcyB0aGUga2VybmVsIGNhbiBzaW1w
bHkNCisgKiByZXN0b3JlIHRoZSB0ZXh0IGNvbnNvbGUgd2hlbiB0aGUgcHJv
Y2VzcyB3aGljaCBoYXMgY2hhbmdlZCBtb2RlcyB0aHJ1DQorICogL2Rldi9k
cm0gaGFzIGJlZW4gZGlzY29ubmVjdGVkIGZyb20gdGhlIGRldmljZS4NCisg
Kg0KKyAqIFRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIHNpbXBseSB0cmll
cyB0byBzZXQgZWFjaCBjcnRjIHRvIHRoZSBtb2RlDQorICogZm9yIHdoaWNo
IHRoZSBhcHBsaWNhdGlvbiBhc2tzIGZvciwgaG9waW5nIHRoYXQgb25lIG9m
IHRoZW0gZ2l2ZXMgYQ0KKyAqIHVzYWJsZSBtb25pdG9yIGRpc3BsYXkgKG5v
IGVycm9yIGhhbmRsaW5nIGltcGxlbWVudGVkKSwgYW5kIHNldHMNCisgKiB0
aGUgdmlld3BvcnQgb2YgZWFjaCBjcnRjIHRvICgwLDApLCB3aGljaCBtZWFu
cyBlc3NlbnRpYWxseSBjbG9uZQ0KKyAqIG1vZGUgd2l0aCBhbGwgbW9uaXRv
cnMgd2hpY2ggbWFuYWdlZCB0byBzd2l0Y2ggdG8gdGhlIG1vZGUgc2hvd2lu
Zw0KKyAqIHRvcCBsZWZ0IGFyZWEgb2YgdGhlIGZyYW1lYnVmZmVyIG1lbW9y
eSBpZiB0aGUgYXBwbGljYXRpb24ncyB3aW5kb3cNCisgKiBpcyB0aGVyZS4g
VGhpcyBpcyBlc3NlbnRpYWxseSB3aGF0IHRoZSBJbnRlbCBkcml2ZXIgZGlk
IGluIGVhcmx5ZXINCisgKiB2ZXJzaW9ucy4gVG8gcmVzdG9yZSBhIExlZnRP
Zi9SaWdodE9mIGxheW91dCwgeW91IHR3byByYW5kciBjYWxscw0KKyAqIHNl
ZW0gdG8gYmUgbmVjY2Vzc2FyeSwgb25lIHdoaWNoIHNldHMgdGhlIHJldmVy
c2VkIGxheW91dCwgZm9sbG93ZWQNCisgKiBieSBvbmUgd2hpY2ggc2V0cyB0
aGUgZGVzaXJlZCBsYXlvdXQ6DQorICoNCisgKiB4cmFuZHIgLS1vdXRwdXQg
RGlnaXRhbC0xIC0tbGVmdC1vZiBEaWdpdGFsLTANCisgKiB4cmFuZHIgLS1v
dXRwdXQgRGlnaXRhbC0wIC0tbGVmdC1vZiBEaWdpdGFsLTENCisgKg0KKyAq
IEZJWE1FOiBUaGlzIGNvdWxkIGJlIGZpeGVkIGJ5IGdldHRpbmcgdGhlIGN1
cnJlbnQgdmlld3BvcnRzIGZvciB0aGUNCisgKiBDUlRDcyBhbmQgdXNlIHRo
ZXNlIGR1cmluZyBtb2RlIHNldHRpbmdzLCBvciAocHJlZmVyYWJseSkgYnkg
Z2V0dGluZw0KKyAqIHRoZSBjdXJyZW50IHNjcmVlbiBsYXlvdXQgYW5kIGFk
YXB0aW5nIHRoZSBuZXcgdmlld3BvcnRzIHNvIHRoYXQNCisgKiBhIG5ldywg
Y29udGludW9zIHNjcmVlbiBsYXlvdXQgd2l0aCB0aGUgc2FtZSBtb25pdG9y
IGFycmFuZ2VtZW50LA0KKyAqIGJ1dCBpbiB0aGUgbmV3IG1vZGUgaXMgc2V0
IHVwLg0KKyAqLw0KIEJvb2wNCiBOVlN3aXRjaE1vZGUoaW50IHNjcm5JbmRl
eCwgRGlzcGxheU1vZGVQdHIgbW9kZSwgaW50IGZsYWdzKQ0KIHsNCkBAIC04
MjksMTIgKzg2NCwxNiBAQCBOVlN3aXRjaE1vZGUoaW50IHNjcm5JbmRleCwg
RGlzcGxheU1vZGVQDQogCU5WRkJMYXlvdXQgKnBMYXlvdXQgPSAmcE52LT5D
dXJyZW50TGF5b3V0Ow0KIA0KIAlpZiAocExheW91dC0+bW9kZSAhPSBtb2Rl
KSB7DQotCQlpZiAoIU5WU2V0TW9kZShwU2NybiwgbW9kZSwgUlJfUm90YXRl
XzApKQ0KKyNpZmRlZiBtb2Rlc2V0dGluZ19oYXNfZXJyb3JfaGFuZGxpbmcg
Ly8gbm90IGltcGxlbWVudGVkIHlldA0KKwkJaWYgKE5WU2V0TW9kZShwU2Ny
biwgbW9kZSkpDQorCQkJcExheW91dC0+bW9kZSA9IG1vZGU7DQorCQllbHNl
DQogCQkJcmV0ID0gRkFMU0U7DQorI2Vsc2UNCisJCU5WU2V0TW9kZShwU2Ny
biwgbW9kZSk7DQorCQlwTGF5b3V0LT5tb2RlID0gbW9kZTsNCisjZW5kaWYN
CiAJfQ0KLQ0KLQlwTGF5b3V0LT5tb2RlID0gbW9kZTsNCi0NCiAJcmV0dXJu
IHJldDsNCiB9DQogDQotLS0gbm91dmVhdS0wLjIwMDcwOTAzL3hmODYtdmlk
ZW8tbm91dmVhdS9zcmMvbnZfcHJvdG8uaA0KKysrIG5vdXZlYXUtMC4yMDA3
MDkwMi94Zjg2LXZpZGVvLW5vdXZlYXUvc3JjL252X3Byb3RvLmgNCkBAIC05
Nyw5ICs5Nyw3IEBAIHZvaWQgbkZvcmNlVXBkYXRlQXJiaXRyYXRpb25TZXR0
aW5ncyAodW4NCiANCiANCiAvKiBudl9jcnRjLmMgKi8NCi1Cb29sIE5WU2V0
TW9kZShTY3JuSW5mb1B0ciBwU2NybiwgRGlzcGxheU1vZGVQdHIgcE1vZGUs
IFJvdGF0aW9uIHJvdGF0aW9uKTsNCi1Cb29sIE5WQ3J0Y1NldE1vZGUoeGY4
NkNydGNQdHIgY3J0YywgRGlzcGxheU1vZGVQdHIgcE1vZGUsIFJvdGF0aW9u
IHJvdGF0aW9uLCBpbnQgeCwgaW50IHkpOw0KLURpc3BsYXlNb2RlUHRyIE5W
Q3J0Y0ZpbmRDbG9zZXN0TW9kZSh4Zjg2Q3J0Y1B0ciBjcnRjLCBEaXNwbGF5
TW9kZVB0ciBwTW9kZSk7DQordm9pZCBOVlNldE1vZGUoU2NybkluZm9QdHIg
cFNjcm4sIERpc3BsYXlNb2RlUHRyIG1vZGUpOw0KIHZvaWQgTlZDcnRjU2V0
QmFzZSAoeGY4NkNydGNQdHIgY3J0YywgaW50IHgsIGludCB5KTsNCiB2b2lk
IE5WQ3J0Y0xvYWRQYWxldHRlKHhmODZDcnRjUHRyIGNydGMpOw0KIHZvaWQg
TlZDcnRjQmxhbmtTY3JlZW4oeGY4NkNydGNQdHIgY3J0YywgQm9vbCBvbik7
DQo=

--168427776-2143782035-1188931191=:8889
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--168427776-2143782035-1188931191=:8889--
