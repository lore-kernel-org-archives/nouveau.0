Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87806CA5FCE
	for <nouveau@archiver.kernel.org>; Sun,  4 Oct 2026 13:45:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B8FA610E907;
	Sun,  4 Oct 2026 13:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=solom-dev.20251104.gappssmtp.com header.i=@solom-dev.20251104.gappssmtp.com header.b="LKpBuAgF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BE56D4892F;
	Sun,  4 Oct 2026 13:27:04 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791120424;
 b=bR7zktiHqXAyoLopFK4b7pBnsHcuhpkAZvCm9sIHV8BwK3WiYUgk4tonrqET5v0P9UmqF
 UE9v5PtmTBxSFEthAkXv3ucLG7cSEc+JtQTEEq57A1xakJpHGUqjCxlwIE85fNdA3gNlscw
 TQvt/iGUUV/sqaVFBduLGpw0EfnDwHsZfV7HbTlq9KdE+LxJCmEM0iZvRgyUEdmR2dnr2qu
 ulQJjx/67A0RwjyRVz4bEb5Ggn9alutgRqmx/wyuQdxLwT87A3xIUlJRR0fM/Ttv2x0NOYS
 3vN9qVr+J1++Oj3Qiz71b/7RAoRRMh9eqPRdB5wLqEziJEtGItRRLGcqA3cA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791120424; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yz8y+ZWxaN6SYlrNOvWQGh0SwawyuvVdxArSOnuaZ8Q=;
 b=Ee7Sv9clPjZBwBQLk7xY6KACrxF+BCtGW8nbnj16gjYvVZ2eFQxFZpAxU3gKVQSUh2Cbv
 QCUsKvOcUDBpGV0iOtuRwLLLUt7GqbLmYTUvudEeiIBIKe0TPM7c3lvVU8xALahTHsh85ia
 M6HubZU746dTF1RIACIsMc1Hk9BdBvE5kyVOrG41SOJGE2rqm6ldo0IhpWFUjoBiXZz/zcs
 1OVkMqCWaxXtVQhge6IKZOh/hwhIABd37PiwndxYWUNXJnvweq4xf7Cx7bGgiN+qtD0PLHV
 +4dytNRYL2KWEz3w6U9hO7hLMvDeWL6wT4vSbVdKEfpnE6ENRKxhR2FYjkTw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=solom-dev.20251104.gappssmtp.com;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=solom-dev.20251104.gappssmtp.com; arc=pass; dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D7FAA46D26
	for <nouveau@lists.freedesktop.org>; Sun,  4 Oct 2026 00:23:50 +0000 (UTC)
Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com
 [74.125.231.234])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB8010E335
	for <nouveau@lists.freedesktop.org>; Sun,  4 Oct 2026 00:42:03 +0000 (UTC)
Received: by mail-oi2-f42.google.com with SMTP id
 5614622812f47-4f617316698so266176b6e.2
        for <nouveau@lists.freedesktop.org>;
 Sat, 03 Oct 2026 17:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791074523; cv=none;
        d=google.com; s=arc-20260327;
        b=Im3FwKrIfpA8YvA2BuTbynp0rYcxGgUW+K9GE3kO4eNzFBl9iiDjw54fPPQal5vLT7
         8UsmpGN2J6m0KgmaeYhmWnhxSxJnd85BCLx1u37T/Z/tzwlbzyVVe41jli+CXN4rapZl
         eqBsawm6SMpqnmzkCXy4DgHy8UkFgaB075Wc9RXoHILVDrQ2i5CNL4d7SUTrRN1iojs4
         +fatfJ9E1Ncs2o5d7o9nHwzh44i8CqVzbX3uPsStnYu5cInRpOepbY9ax3VuajBdUaG/
         yu6pJqYzqYFCv8lKn7iS5s+uVSx4mA2XsXkj40nQKFtdN+xY+d2SsngooIHfb/0KwDYL
         57+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yz8y+ZWxaN6SYlrNOvWQGh0SwawyuvVdxArSOnuaZ8Q=;
        fh=QI6NxIwaMlm5BNdW42IKrpD7/XGDGVUKQiMk4Bpi+zM=;
        b=df8aCcYbCevupjn+EV9XK6ag0yi3gwAvN0db5ZQvEFfPggAyPxbxHQEAWY4N7CBW9j
         jfS8OiQYdZoVaEwp7CVWPIOiEC2qzy5uCXV+2Lz5aztFOs2AOgZYQ9sLcreh2g2A44TP
         ZqRlexf9VuRx5l+HNimN6Geoo+gvROtV4Dq+e0hj6o+gIv080GDSUpZuuIkSp3O5eRrT
         bjm+bHTcYRo05eTaN4mLCiWxQ+5gbCLWUW36vUYW3ZlhdpFryTmHRso4p4omudqadZxi
         0t5cpmtGN5cVaBWngRrOWx3JGLv1KwYLxFcFV7KjSq4Y7K/T72oNYMM7itLZe+dUNcxP
         BjSg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solom-dev.20251104.gappssmtp.com; s=20251104; t=1791074523;
 x=1791679323; darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yz8y+ZWxaN6SYlrNOvWQGh0SwawyuvVdxArSOnuaZ8Q=;
        b=LKpBuAgF7/HYH8o768h/dIyN9jjB6ewbiEGqqnu+2Mjil5hGQOmfZ3c4O/fKugE3xd
         LgzFBoSuMET2ENkzLpIk+/SrY6FXPmi19MqhnlncBLJpuyJczrEtyiRgiMVkjrBjcVcm
         qqzh32JEy/+bGm0Iqc9XDOykb+uTIzSaEqsLir1l6/XbFuuNFPDcnA+p7+3Tqy3bZdqf
         DZH1lCRnQBajzXoA60p4r09ql15xQh9nyBhn1dHSUpgN0tUEhghQRRrbEZ4/loYgEJhL
         ReJJNA+QXhkfIfenaSLpehQ91fLNdlvXkGpTfWgzbY3VsA4E9mwjNyEIQEksn+K7RsIk
         IdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791074523; x=1791679323;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yz8y+ZWxaN6SYlrNOvWQGh0SwawyuvVdxArSOnuaZ8Q=;
        b=ign1iFa3ff0fY2GzN6+q9cMw2X22NTTI0fEssJZRUqSZKLaruXlzJmh9QwLG7BRFoZ
         cQvKZWm+AFt/A/T40uPG526Gspv6RoJgZLqFBuzDaFq7FX93quyq2v1GUn9DK2PBBH0G
         +2jZPJuLywyLnadc3goYaBgnMC1KBBb260qZgHbi7AQV8C9scvb1E5BfdSgAbjS/Kkcs
         iP+uQBu2aqvUpx/6X3deVu73ANnU+65NW3PDPncHgImvtvxB1XxmQb8GTgs0iDPXozAA
         OqRT/moKzSmMHajUx6jKg3BZujP6D/x0AsgBOhNrvX/kJTnORmyZXk+T6tdrVLcN3UVl
         F8Nw==
X-Gm-Message-State: AFuF++m08bPAZt1I12AuLc43u/ojG0nq8yQrfZ/mBYeeHessptPqXXw2
	Notwx4KLoS2JMlBFRQXMz9yPDgyWXoXawDclE9NTJ0hgxd8BDsTN77e3k/cDYxy1Bc/evBTIpoO
	pxZj5IkcqxVK0pmH4XmyM9bW405i9Lmf1xo9hZAq08zJrX7L82J4Hl4Epmw==
X-Gm-Gg: AYBFou2YC02qqfMrxdjyp6cAQTRnJvFXeGDUnecbLclBoz63G4CZuIhKixRf7xTeqXU
	2tW4KROhPKi1hRF4hleSORK9pyGWqdeQEGbpuNvPEfDc52exiphB5Wjoy9feZ5Yo3CoAnDHatX4
	d4nVZT7ENN7pahMt1GyhvsfUToXLzzUTaWOsVPAB9VBCM+Fgd78pIFf+YsLYJlsR0W2SYvKiPQY
	Nscwru7EqpU4xG6cWffAZWwQP9wo34cbrd/SpE0xuOj3WRsPQYCJPuXdpCAOiKdUdqs3whGiGTT
	ABE7trNNpWm1mLlFUPabCVFpFGYIjmxZLQ67LjghYxw3TH1bxfxouTaPhY+6AsHjnu8=
X-Received: by 2002:a05:6809:53:20b0:4f5:cb60:33c5 with SMTP id
 5614622812f47-4f5cb603dfbmr3485965b6e.6.1791074522839; Sat, 03 Oct 2026
 17:42:02 -0700 (PDT)
MIME-Version: 1.0
From: Solom Tamawy <solom@solom.dev>
Date: Sat, 3 Oct 2026 17:41:52 -0700
X-Gm-Features: AclHuK-uRUXQjKtvXJpq4QctVEAPOr84ph67KwJ7gm3zkr-Y0shQUBKodqrNHfI
Message-ID: 
 <CACbN=AsQdd1GsAA1FpNMZCrd4YNHidX_dQ1CmBW4zYUnHbrioQ@mail.gmail.com>
Subject: [PATCH] drm/nouveau/kms: defer window LUT disable until the image
 update
To: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: solom@solom.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: VCF6J4FOMKJOGXKBB4WPRWPTZ4DGPPHU
X-Message-ID-Hash: VCF6J4FOMKJOGXKBB4WPRWPTZ4DGPPHU
X-Mailman-Approved-At: Sun, 04 Oct 2026 13:27:02 +0000
CC: Solom Tamawy <solom@solom.dev>, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VCF6J4FOMKJOGXKBB4WPRWPTZ4DGPPHU/>
Archived-At: 
 <https://lore.freedesktop.org/CACbN=AsQdd1GsAA1FpNMZCrd4YNHidX_dQ1CmBW4zYUnHbrioQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

A modeset on one head can set flush_disable for the entire atomic
commit while another window changes from an integer framebuffer to
FP16 without a modeset. The latter sets clr.xlut and set.image, but
not clr.image.

nv50_wndw_flush_clr() clears that window's ILUT before the intermediate
disable UPDATE, leaving the old integer image enabled without its LUT.
The new FP16 image is only programmed later in nv50_wndw_flush_set().
On hardware that uses the ILUT to convert integer input to the internal
FP16 pipeline, the intermediate state is invalid.

This ordering defect was found while investigating a Plasma login hang
on GB205 after atomic modesetting became enabled by default. The failure
logs contained window UPDATE exceptions followed by a core notifier
timeout:

   gsp: Xid:56 CMDre 00000001 00000200 00000001 00000005 0000002d
   gsp: Xid:56 CMDre 00000005 00000200 00000001 00000005 0000002d
   drm: core notifier timeout

Defer the LUT clear until the image update when the old image remains
enabled across a separate disable UPDATE. The LUT clear and new image
then take effect together. Keep early clears for windows whose images
are disabled and preserve the path without a separate disable UPDATE.
Pass flush_disable explicitly to the set phase, since the new plane
state's atomic-state backpointer is cleared during state swap.

Fixes: ebf8ca6b3d6d ("drm/nouveau/kms/nv50-: disable input lut harder")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Solom Tamawy <solom@solom.dev>
---
Based on linux-next f0406245cb9855e6318335a8a223551354291a46
(next-20261002). This is the functional fix only; atomic modesetting
remains enabled and the advertised formats are unchanged.

Testing:
- A focused C harness extracts the actual pristine and patched flush
   helpers and models two heads at each UPDATE boundary. The pristine
   helpers fail the mixed-head integer-to-FP16 case; the patched helpers
   pass all 14 cases. The model is not a full GPU simulator.
- Nouveau built against the matching kernel configuration and headers
   with successful modpost and BTF generation and no build warnings.
- I successfully logged into Plasma Wayland on RTX 5070
   (GB205), with three NVIDIA DP displays, amdgpu active on the integrated
   GPU, and a CalDigit TS5 Plus dock connected before login. No atomic=0
   override or USB/PCIe/Thunderbolt PM workarounds were present. The
   expected patched module was loaded, and the I confirmed a
   successful DRM_CLIENT_CAP_ATOMIC=1 capability probe. No Xid or core
   notifier timeout appeared in this boot.

  drivers/gpu/drm/nouveau/dispnv50/disp.c |  2 +-
  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 13 ++++++++++++-
  drivers/gpu/drm/nouveau/dispnv50/wndw.h |  4 ++--
  3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e91130f93db6..b7022a9b6e6f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2351,7 +2351,7 @@ nv50_disp_atomic_commit_tail(struct
drm_atomic_commit *state)
                     (!asyw->clr.mask || atom->flush_disable))
                         continue;

-               nv50_wndw_flush_set(wndw, interlock, asyw);
+               nv50_wndw_flush_set(wndw, interlock,
atom->flush_disable, asyw);
         }

         /* Flush update. */
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 74eb1dfcc043..ac59219e162a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -137,6 +137,14 @@ nv50_wndw_flush_clr(struct nv50_wndw *wndw, u32
*interlock, bool flush,
         union nv50_wndw_atom_mask clr = {
                 .mask = asyw->clr.mask & ~(flush ? 0 : asyw->set.mask),
         };
+
+       /* A different head can require a separate disable update while this
+        * window only changes format. Keep its LUT enabled for the old
image
+        * until the new image is programmed: integer formats require an
ILUT.
+        */
+       if (flush && !clr.image && asyw->set.image)
+               clr.xlut = false;
+
         if (clr.sema ) wndw->func-> sema_clr(wndw);
         if (clr.ntfy ) wndw->func-> ntfy_clr(wndw);
         if (clr.xlut ) wndw->func-> xlut_clr(wndw);
@@ -147,7 +155,7 @@ nv50_wndw_flush_clr(struct nv50_wndw *wndw, u32
*interlock, bool flush,
  }

  void
-nv50_wndw_flush_set(struct nv50_wndw *wndw, u32 *interlock,
+nv50_wndw_flush_set(struct nv50_wndw *wndw, u32 *interlock, bool flush,
                     struct nv50_wndw_atom *asyw)
  {
         if (interlock[NV50_DISP_INTERLOCK_CORE]) {
@@ -157,6 +165,9 @@ nv50_wndw_flush_set(struct nv50_wndw *wndw, u32
*interlock,

         if (asyw->set.sema ) wndw->func->sema_set (wndw, asyw);
         if (asyw->set.ntfy ) wndw->func->ntfy_set (wndw, asyw);
+       /* Apply a deferred LUT disable together with the new image. */
+       if (flush && asyw->clr.xlut && !asyw->clr.image && asyw->set.image)
+               wndw->func->xlut_clr(wndw);
         if (asyw->set.image) wndw->func->image_set(wndw, asyw);

         if (asyw->set.xlut ) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
index 7bd8bcc199db..b0b1b10cf782 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
@@ -40,8 +40,8 @@ int nv50_wndw_new_(const struct nv50_wndw_func *,
struct drm_device *,
                    const u32 *format, u32 heads,
                    enum nv50_disp_interlock_type, u32 interlock_data,
                    struct nv50_wndw **);
-void nv50_wndw_flush_set(struct nv50_wndw *, u32 *interlock,
-                        struct nv50_wndw_atom *);
+void nv50_wndw_flush_set(struct nv50_wndw *wndw, u32 *interlock, bool
flush,
+                        struct nv50_wndw_atom *asyw);
  void nv50_wndw_flush_clr(struct nv50_wndw *, u32 *interlock, bool flush,
                          struct nv50_wndw_atom *);
  void nv50_wndw_ntfy_enable(struct nv50_wndw *, struct nv50_wndw_atom *);

base-commit: f0406245cb9855e6318335a8a223551354291a46
