From: Bernhard Kaindl <bk-l3A5Bk7waGM@public.gmane.org>
Subject: Re: Xvideo blitter with randr12 enabled
Date: Wed, 5 Sep 2007 18:27:36 +0200 (CEST)
Message-ID: <alpine.LNX.0.9999-openSUSE-5.0709051818490.24186@jbgna.fhfr.qr>
References: <alpine.LNX.0.999-openSUSE-1.0709031945560.22918@jbgna.fhfr.qr>
	<20070904211539.b46ae32d.arthur.huillet@free.fr>
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
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="168427776-1707991653-1189009659=:24186"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <alpine.LNX.0.9999-openSUSE-5.0709051715010.24186-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
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

--168427776-1707991653-1189009659=:24186
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

On Wed, 5 Sep 2007, Bernhard Kaindl wrote:

> ... I hope, but first I would like to get the console switch working as it
> should and as I had it with my patch to the randr branch.

Ok that was quick, from my previous patch for the randr branch, this patch
wasn't yet applied to master:

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 92c22b8..873da8e 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -774,6 +774,8 @@ NVEnterVT(int scrnIndex, int flags)

      if (pNv->randr12_enable) {
  	xf86CrtcConfigPtr xf86_config = XF86_CRTC_CONFIG_PTR(pScrn);
+	int i;
+
  	pScrn->vtSema = TRUE;

  	if (pNv->Architecture == NV_ARCH_50) {
@@ -788,6 +790,10 @@ NVEnterVT(int scrnIndex, int flags)
  		NVSave(pScrn);
  	}

+	for (i = 0; i < xf86_config->num_crtc; i++) {
+		NVCrtcLockUnlock(xf86_config->crtc[i], 0);
+	}
+
  	NVResetCrtcConfig(pScrn, 0);
  	if (!xf86SetDesiredModes(pScrn))
  		return FALSE;

This fixes chvt 1;chvt 7 (back to X) with my NV40 card when Option "Randr12" is
enabled in xorg.conf.

It should be fine to commit this as it does not look like a workaround for me
but neccessary to enable writing the CRTC registers again. To my (non-expert)
impressin it looks like the equvalent of

     NVLockUnlock(pNv, 0);
     if(pNv->twoHeads) {
         nvWriteVGA(pNv, NV_VGA_CRTCX_OWNER, nvReg->crtcOwner);
         NVLockUnlock(pNv, 0);
     }

in NVModeInit which is used for the same in the !pNv->randr12_enable code
branch of NVEnterVT to enter the X screen.

Best Regards,
Bernhard
--168427776-1707991653-1189009659=:24186
Content-Type: TEXT/x-patch; name=nouveau-master-fix-chvt.diff
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.LNX.0.9999-openSUSE-5.0709051827360.24186-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
Content-Description: 
Content-Disposition: attachment; filename=nouveau-master-fix-chvt.diff

ZGlmZiAtLWdpdCBhL3NyYy9udl9kcml2ZXIuYyBiL3NyYy9udl9kcml2ZXIu
Yw0KaW5kZXggOTJjMjJiOC4uODczZGE4ZSAxMDA2NDQNCi0tLSBhL3NyYy9u
dl9kcml2ZXIuYw0KKysrIGIvc3JjL252X2RyaXZlci5jDQpAQCAtNzc0LDYg
Kzc3NCw4IEBAIE5WRW50ZXJWVChpbnQgc2NybkluZGV4LCBpbnQgZmxhZ3Mp
DQogICAgIA0KICAgICBpZiAocE52LT5yYW5kcjEyX2VuYWJsZSkgeyANCiAJ
eGY4NkNydGNDb25maWdQdHIgeGY4Nl9jb25maWcgPSBYRjg2X0NSVENfQ09O
RklHX1BUUihwU2Nybik7DQorCWludCBpOw0KKw0KIAlwU2Nybi0+dnRTZW1h
ID0gVFJVRTsNCiANCiAJaWYgKHBOdi0+QXJjaGl0ZWN0dXJlID09IE5WX0FS
Q0hfNTApIHsNCkBAIC03ODgsNiArNzkwLDEwIEBAIE5WRW50ZXJWVChpbnQg
c2NybkluZGV4LCBpbnQgZmxhZ3MpDQogCQlOVlNhdmUocFNjcm4pOw0KIAl9
DQogDQorCWZvciAoaSA9IDA7IGkgPCB4Zjg2X2NvbmZpZy0+bnVtX2NydGM7
IGkrKykgew0KKwkJTlZDcnRjTG9ja1VubG9jayh4Zjg2X2NvbmZpZy0+Y3J0
Y1tpXSwgMCk7DQorCX0NCisNCiAJTlZSZXNldENydGNDb25maWcocFNjcm4s
IDApOw0KIAlpZiAoIXhmODZTZXREZXNpcmVkTW9kZXMocFNjcm4pKQ0KIAkJ
cmV0dXJuIEZBTFNFOw0K

--168427776-1707991653-1189009659=:24186
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--168427776-1707991653-1189009659=:24186--
