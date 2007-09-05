From: Bernhard Kaindl <bk-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] Fix DPMS and Xvideo with Option Randr12 enabled
 and monitors side-by-side
Date: Wed, 5 Sep 2007 20:17:49 +0200 (CEST)
Message-ID: <alpine.LNX.0.9999-openSUSE-5.0709051943530.24186@jbgna.fhfr.qr>
References: <alpine.LNX.0.999-openSUSE-1.0709031945560.22918@jbgna.fhfr.qr>
	<alpine.LNX.0.999-openSUSE-1.0709042248510.8889@jbgna.fhfr.qr>
	<20070904231611.9363b0d0.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709042333450.19641@jbgna.fhfr.qr>
	<alpine.LNX.0.999-openSUSE-1.0709050114480.25400@jbgna.fhfr.qr>
	<alpine.LNX.0.999-openSUSE-1.0709050142010.25400@jbgna.fhfr.qr>
	<alpine.LNX.0.999-openSUSE-1.0709050203240.25400@jbgna.fhfr.qr>
	<20070905024520.d5c28cb8.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709050256200.25400@jbgna.fhfr.qr>
	<20070905032343.c6b0989e.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709050352050.29379@jbgna.fhfr.qr>
	<20070905115247.91d1ad03.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709051212550.21447@jbgna.fhfr.qr>
	<20070905171148.996b0c44.arthur.huillet@free.fr>
	<alpine.LNX.0.9999-openSUSE-5.0709051715010.24186@jbgna.fhfr.qr>
	<alpine.LNX.0.9999-openSUSE-5.0709051841520.24186@jbgna.fhfr.qr>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="168427776-1718164379-1189016270=:24186"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <alpine.LNX.0.9999-openSUSE-5.0709051841520.24186-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
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

--168427776-1718164379-1189016270=:24186
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Wed, 5 Sep 2007, Bernhard Kaindl wrote:
>
> I can trick mplayer with Xv to work now side-by-side by doing chvt 1 and
> chvt7 (with the chvt fix which I just sent) before starting using mplayer.
> I slight guess that this is might be related to the DPMS fix/hack with
> last_mode which I sent initially because DPMS also works again after a
> VC switch when the monitors are side-by-side. I guess that last_mode might
> be wrongly set in that case, will check.

Done.

Option Randr12 now (next to) fully works for me with a simple dual head setup,
with this patch for the master branch:

diff --git a/src/nv_output.c b/src/nv_output.c
index 7499247..95ee772 100644
--- a/src/nv_output.c
+++ b/src/nv_output.c
@@ -157,7 +157,7 @@ nv_digital_output_dpms(xf86OutputPtr output, int mode)
  	if (crtc) {
  		nv_crtc = crtc->driver_private;

-		fpcontrol = nvReadRAMDAC(pNv, nv_crtc->crtc, NV_RAMDAC_FP_CONTROL) & 0xCfffffCC; 
+		fpcontrol = nvReadRAMDAC(pNv, nv_crtc->crtc, NV_RAMDAC_FP_CONTROL);
  		switch(mode) {
  			case DPMSModeStandby:
  			case DPMSModeSuspend:
@@ -167,8 +167,9 @@ nv_digital_output_dpms(xf86OutputPtr output, int mode)
  				nvWriteRAMDAC(pNv, nv_crtc->crtc, NV_RAMDAC_FP_CONTROL, fpcontrol);
  				break;
  			case DPMSModeOn:
-				/* restore previous mode */
-				nv_output_mode_set(output, last_mode, NULL);
+				/* disable cutting the TMDS output */
+				fpcontrol &= ~0x20000022;
+				nvWriteRAMDAC(pNv, nv_crtc->crtc, NV_RAMDAC_FP_CONTROL, fpcontrol);
  				break;
  		}
  	}

This is the minium to reverse my previous patch which was more a hack to
get something working in the randr branch, it was never tested in the
master branch by me before I was applied as I wasn't aware that Randr12
has now been merged into the master branch (but I subscribed the nouveau
mailing lists now and monitor the git log as well).

This is only the minimum patch to make it clear what the change actually
does, the cleanup to reverse everything which my initial hack patch did
is larger and the real change would not be as obvioius then.

How I arrived at this patch:

First, I just cleared the "cut TMDS output" bits in the fpcontrol variable,
and changed the code back to not call nv_output_mode_set but nvWriteRAMDAC()
as it was before which restored the initial state which re-enabled the output
(monitors got signal again, they woke up, turned on backlight, but still showed
a black screen) but that didn't make the X output come back.

Second, I tried "fpcontrol |= pNV->fpSync" (which was there initiallty) in
addition to restore any saved fpSync bits, but fpSync turned out to be
all Nulls at that point so it had no effect.

Third, I remoed "& 0xCfffffCC" which you can see in the patch above and that
made additional bits appear in fpcontrol. cutting TMDS outputs still worked
as before but in the "case DPMSModeOn:" the X screen came back to light! YES!

So that was the fix. As I do not know which other cards might need which
bits in fpcontrol, I'd just use the patch as is and not try to find which
bits we could mask out when reading the register. After all what we read
is in set in the register and we might need to write all of them back or
we might break something as it happened with my G70 card.

Here is the cleanup patch with comments:

--- src/nv_output.c	2007-09-05 19:43:41.000000000 +0200
+++ src/nv_output.c	2007-09-05 19:29:36.000000000 +0200
@@ -138,40 +138,28 @@
  }

  static void
-nv_output_mode_set(xf86OutputPtr output, DisplayModePtr mode,
-		   DisplayModePtr adjusted_mode);
-
-static DisplayModePtr last_mode;
-
-static void
# I added these in my previous patch, obsolete
  nv_digital_output_dpms(xf86OutputPtr output, int mode)
  {
-	NVOutputPrivatePtr nv_output = output->driver_private;
# remove unused variable
  	xf86CrtcPtr crtc = output->crtc;
-	ScrnInfoPtr pScrn = output->scrn;
-	NVPtr pNv = NVPTR(pScrn);
-	NVCrtcPrivatePtr nv_crtc;
# moved these into the if-clause where they are used
-
-	CARD32 fpcontrol;

  	if (crtc) {
-		nv_crtc = crtc->driver_private;
+		NVPtr pNv = NVPTR(output->scrn);
# integrated "pScrn = output->scrn" as we only need pScrn to get pNv.
+		NVCrtcPrivatePtr nv_crtc = crtc->driver_private;
# just moved declaration down here

-		fpcontrol = nvReadRAMDAC(pNv, nv_crtc->crtc, NV_RAMDAC_FP_CONTROL); 
+		CARD32 fpcontrol = nvReadRAMDAC(pNv, nv_crtc->crtc, NV_RAMDAC_FP_CONTROL); 
# just moved declaration down here
  		switch(mode) {
  			case DPMSModeStandby:
  			case DPMSModeSuspend:
  			case DPMSModeOff:
  				/* cut the TMDS output */
  				fpcontrol |= 0x20000022;
-				nvWriteRAMDAC(pNv, nv_crtc->crtc, NV_RAMDAC_FP_CONTROL, fpcontrol);
  				break;
  			case DPMSModeOn:
  				/* disable cutting the TMDS output */
  				fpcontrol &= ~0x20000022;
-				nvWriteRAMDAC(pNv, nv_crtc->crtc, NV_RAMDAC_FP_CONTROL, fpcontrol);
  				break;
  		}
+		nvWriteRAMDAC(pNv, nv_crtc->crtc, NV_RAMDAC_FP_CONTROL, fpcontrol);
# nvWriteRAMDAC was placed here before, so there is only one call to it
  	}
  }

@@ -343,7 +331,6 @@
      int bpp;
      NVPtr pNv = NVPTR(pScrn);
      NVFBLayout *pLayout = &pNv->CurrentLayout;
-    last_mode = mode;
# clenup the no longer used last_mode variable from my previous patch,
# the definition is removed in the first lines of the cleanup patch
      RIVA_HW_STATE *state, *sv_state;
      Bool is_fp = FALSE;
      NVOutputRegPtr regp, savep;

Clean patches without comments in attachment.

Bernhard
--168427776-1718164379-1189016270=:24186
Content-Type: TEXT/x-patch; name=nouveau-fix-Randr12-DPMS-properly-minimum.diff
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.LNX.0.9999-openSUSE-5.0709052017490.24186-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
Content-Description: 
Content-Disposition: attachment; filename=nouveau-fix-Randr12-DPMS-properly-minimum.diff

ZGlmZiAtLWdpdCBhL3NyYy9udl9vdXRwdXQuYyBiL3NyYy9udl9vdXRwdXQu
Yw0KaW5kZXggNzQ5OTI0Ny4uOTVlZTc3MiAxMDA2NDQNCi0tLSBhL3NyYy9u
dl9vdXRwdXQuYw0KKysrIGIvc3JjL252X291dHB1dC5jDQpAQCAtMTU3LDcg
KzE1Nyw3IEBAIG52X2RpZ2l0YWxfb3V0cHV0X2RwbXMoeGY4Nk91dHB1dFB0
ciBvdXRwdXQsIGludCBtb2RlKQ0KIAlpZiAoY3J0Yykgew0KIAkJbnZfY3J0
YyA9IGNydGMtPmRyaXZlcl9wcml2YXRlOw0KIA0KLQkJZnBjb250cm9sID0g
bnZSZWFkUkFNREFDKHBOdiwgbnZfY3J0Yy0+Y3J0YywgTlZfUkFNREFDX0ZQ
X0NPTlRST0wpICYgMHhDZmZmZmZDQzsJDQorCQlmcGNvbnRyb2wgPSBudlJl
YWRSQU1EQUMocE52LCBudl9jcnRjLT5jcnRjLCBOVl9SQU1EQUNfRlBfQ09O
VFJPTCk7CQ0KIAkJc3dpdGNoKG1vZGUpIHsNCiAJCQljYXNlIERQTVNNb2Rl
U3RhbmRieToNCiAJCQljYXNlIERQTVNNb2RlU3VzcGVuZDoNCkBAIC0xNjcs
OCArMTY3LDkgQEAgbnZfZGlnaXRhbF9vdXRwdXRfZHBtcyh4Zjg2T3V0cHV0
UHRyIG91dHB1dCwgaW50IG1vZGUpDQogCQkJCW52V3JpdGVSQU1EQUMocE52
LCBudl9jcnRjLT5jcnRjLCBOVl9SQU1EQUNfRlBfQ09OVFJPTCwgZnBjb250
cm9sKTsNCiAJCQkJYnJlYWs7DQogCQkJY2FzZSBEUE1TTW9kZU9uOg0KLQkJ
CQkvKiByZXN0b3JlIHByZXZpb3VzIG1vZGUgKi8NCi0JCQkJbnZfb3V0cHV0
X21vZGVfc2V0KG91dHB1dCwgbGFzdF9tb2RlLCBOVUxMKTsNCisJCQkJLyog
ZGlzYWJsZSBjdXR0aW5nIHRoZSBUTURTIG91dHB1dCAqLw0KKwkJCQlmcGNv
bnRyb2wgJj0gfjB4MjAwMDAwMjI7DQorCQkJCW52V3JpdGVSQU1EQUMocE52
LCBudl9jcnRjLT5jcnRjLCBOVl9SQU1EQUNfRlBfQ09OVFJPTCwgZnBjb250
cm9sKTsNCiAJCQkJYnJlYWs7DQogCQl9DQogCX0NCg==

--168427776-1718164379-1189016270=:24186
Content-Type: TEXT/x-patch; name=nouveau-fix-Randr12-DPMS-properly-cleanup.diff
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.LNX.0.9999-openSUSE-5.0709052017491.24186-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
Content-Description: 
Content-Disposition: attachment; filename=nouveau-fix-Randr12-DPMS-properly-cleanup.diff

LS0tIHNyYy9udl9vdXRwdXQuYwkyMDA3LTA5LTA1IDE5OjQzOjQxLjAwMDAw
MDAwMCArMDIwMA0KKysrIHNyYy9udl9vdXRwdXQuYwkyMDA3LTA5LTA1IDE5
OjI5OjM2LjAwMDAwMDAwMCArMDIwMA0KQEAgLTEzOCw0MCArMTM4LDI4IEBA
DQogfQ0KIA0KIHN0YXRpYyB2b2lkDQotbnZfb3V0cHV0X21vZGVfc2V0KHhm
ODZPdXRwdXRQdHIgb3V0cHV0LCBEaXNwbGF5TW9kZVB0ciBtb2RlLA0KLQkJ
ICAgRGlzcGxheU1vZGVQdHIgYWRqdXN0ZWRfbW9kZSk7DQotDQotc3RhdGlj
IERpc3BsYXlNb2RlUHRyIGxhc3RfbW9kZTsNCi0NCi1zdGF0aWMgdm9pZA0K
IG52X2RpZ2l0YWxfb3V0cHV0X2RwbXMoeGY4Nk91dHB1dFB0ciBvdXRwdXQs
IGludCBtb2RlKQ0KIHsNCi0JTlZPdXRwdXRQcml2YXRlUHRyIG52X291dHB1
dCA9IG91dHB1dC0+ZHJpdmVyX3ByaXZhdGU7DQogCXhmODZDcnRjUHRyIGNy
dGMgPSBvdXRwdXQtPmNydGM7DQotCVNjcm5JbmZvUHRyIHBTY3JuID0gb3V0
cHV0LT5zY3JuOw0KLQlOVlB0ciBwTnYgPSBOVlBUUihwU2Nybik7DQotCU5W
Q3J0Y1ByaXZhdGVQdHIgbnZfY3J0YzsNCi0NCi0JQ0FSRDMyIGZwY29udHJv
bDsNCiANCiAJaWYgKGNydGMpIHsNCi0JCW52X2NydGMgPSBjcnRjLT5kcml2
ZXJfcHJpdmF0ZTsNCisJCU5WUHRyIHBOdiA9IE5WUFRSKG91dHB1dC0+c2Ny
bik7DQorCQlOVkNydGNQcml2YXRlUHRyIG52X2NydGMgPSBjcnRjLT5kcml2
ZXJfcHJpdmF0ZTsNCiANCi0JCWZwY29udHJvbCA9IG52UmVhZFJBTURBQyhw
TnYsIG52X2NydGMtPmNydGMsIE5WX1JBTURBQ19GUF9DT05UUk9MKTsJDQor
CQlDQVJEMzIgZnBjb250cm9sID0gbnZSZWFkUkFNREFDKHBOdiwgbnZfY3J0
Yy0+Y3J0YywgTlZfUkFNREFDX0ZQX0NPTlRST0wpOwkNCiAJCXN3aXRjaCht
b2RlKSB7DQogCQkJY2FzZSBEUE1TTW9kZVN0YW5kYnk6DQogCQkJY2FzZSBE
UE1TTW9kZVN1c3BlbmQ6DQogCQkJY2FzZSBEUE1TTW9kZU9mZjoNCiAJCQkJ
LyogY3V0IHRoZSBUTURTIG91dHB1dCAqLwkgICAgDQogCQkJCWZwY29udHJv
bCB8PSAweDIwMDAwMDIyOw0KLQkJCQludldyaXRlUkFNREFDKHBOdiwgbnZf
Y3J0Yy0+Y3J0YywgTlZfUkFNREFDX0ZQX0NPTlRST0wsIGZwY29udHJvbCk7
DQogCQkJCWJyZWFrOw0KIAkJCWNhc2UgRFBNU01vZGVPbjoNCiAJCQkJLyog
ZGlzYWJsZSBjdXR0aW5nIHRoZSBUTURTIG91dHB1dCAqLw0KIAkJCQlmcGNv
bnRyb2wgJj0gfjB4MjAwMDAwMjI7DQotCQkJCW52V3JpdGVSQU1EQUMocE52
LCBudl9jcnRjLT5jcnRjLCBOVl9SQU1EQUNfRlBfQ09OVFJPTCwgZnBjb250
cm9sKTsNCiAJCQkJYnJlYWs7DQogCQl9DQorCQludldyaXRlUkFNREFDKHBO
diwgbnZfY3J0Yy0+Y3J0YywgTlZfUkFNREFDX0ZQX0NPTlRST0wsIGZwY29u
dHJvbCk7DQogCX0NCiB9DQogDQpAQCAtMzQzLDcgKzMzMSw2IEBADQogICAg
IGludCBicHA7DQogICAgIE5WUHRyIHBOdiA9IE5WUFRSKHBTY3JuKTsNCiAg
ICAgTlZGQkxheW91dCAqcExheW91dCA9ICZwTnYtPkN1cnJlbnRMYXlvdXQ7
DQotICAgIGxhc3RfbW9kZSA9IG1vZGU7DQogICAgIFJJVkFfSFdfU1RBVEUg
KnN0YXRlLCAqc3Zfc3RhdGU7DQogICAgIEJvb2wgaXNfZnAgPSBGQUxTRTsN
CiAgICAgTlZPdXRwdXRSZWdQdHIgcmVncCwgc2F2ZXA7DQo=

--168427776-1718164379-1189016270=:24186
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--168427776-1718164379-1189016270=:24186--
