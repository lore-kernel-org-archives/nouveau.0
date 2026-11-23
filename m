Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D30606A31E
	for <nouveau@archiver.kernel.org>; Tue, 24 Nov 2026 02:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=kbsdTwEQ
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B21ED10F323;
	Tue, 24 Nov 2026 02:13:21 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2E4704047C;
	Tue, 24 Nov 2026 02:13:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795486393;
 b=If4+CecxN1blszDbmwU9dRCqlUn5S5d1zzgGOfL25BnBJMgrwXFlawvR5RU84EFR7Bzas
 Lyg7jgYhhqTa53L8SeqpPtFTr+3YMCevRW1aCpXX6+KJ6Bz/dMz7RFkpgoAAf6F3D4aUaN+
 /m7uhm/fffFM798dYv5ZMQu6G7RxwwdQpaLvu4ZmuZV71FMPecvW2JyeVXisE4uhh0vNvfR
 JZmOrueT0k85W0cXKJ5w7qPgxXsPH+5edbjZqgWS82b8KLIkg9av7mEg9diBoNF9xcM24Fc
 10MJOAt+WFQZVZYtAV+ryTgY2obMLNl/43BLVcHaUcInu0fnWUZpVcs199BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795486393; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rhAFp8q6hcVFicw1cnkwUehJMti1UXGDz3sIyHd3ZfU=;
 b=RdaZI4zlqnk+nCwsiszRQ5sAp0vXX+Niuc02/YA6XdPLR/WUjAGmuDfMGxwsAx7Gs3SPm
 ZBGMdkmt4v8kCpo4rmiYCvuH0yovfOu5XsuR0WPXAYYcbTkMAWG67MZcbJnSKl8agBQeEQW
 RnMwHX4zKd0Z25qzAOrBLoQmLaL1W+mQdbIQStrXBfwT481x3wXy3IPLjrX1pYEenYwBr55
 Xh+WnTlBjHFB1DIWx35JOPnNP/LHsuVLKnxpn2A7vhyVJtooAxnuZlXl+sXDOqtBbYjxUxD
 EgBOTLCrvVKnmiFYm+DGnYMBG5qttQvzcN6mknW4/J2FrF0g7L099RGon1lg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=cirad.fr;
 arc=none;
 dmarc=pass header.from=cirad.fr policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=cirad.fr;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=cirad.fr policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 325EF402FE
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 10:25:00 +0000 (UTC)
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 08FED10EBE1
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 10:24:55 +0000 (UTC)
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id A1A6C20DC66E;
	Mon, 23 Nov 2026 11:17:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 7DFCB20DC66D;
	Mon, 23 Nov 2026 11:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 7DFCB20DC66D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795429046;
	bh=rhAFp8q6hcVFicw1cnkwUehJMti1UXGDz3sIyHd3ZfU=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=kbsdTwEQx3Qet/c/r74j7BeWCKXfebqtsECFzaLjncgdOeUZTMcZzQV/1t8pINZaQ
	 VzdpzXh9w2JzL0VocJt46lQT7I0qEp4250WiPOSQOqtVQViZzfjKBGglZq2b8nptOs
	 kNttmQNxKLHpdOALqZc0uMrLB+k+4m8pgsW1uAaNyxyrVUlTh5MaMIY+SyU5D2iQvt
	 DG5YxUHozYi+ngVwB4hq4Au/U3JuMfTtGLWnBS0H0ZLppr9QbqqjgeOWOMkFFOdbKV
	 bJ9N2/2ToVUQLDeUSDwhemT3N3iuSrOZCoFAt4CqOPkgoYr30zb2zs9hLb0KjBp1jG
	 YJ6WOvApPMnCw==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id s7PvU-pu6kNA; Mon, 23 Nov 2026 11:17:26 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net
 [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 2A8F320DB5C2;
	Mon, 23 Nov 2026 11:17:26 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 2/2] drm/nouveau/dispnv50: reject DP modes that don't fit the
 link
Date: Mon, 23 Nov 2026 11:16:59 +0100
Message-ID: <20261123101659.600247-3-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123101659.600247-1-frederic.mahe@cirad.fr>
References: <20261123101659.600247-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: frederic.mahe@cirad.fr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
Message-ID-Hash: UFE2P6O6MQJAT75PFPATCT3SUVGZBMRT
X-Message-ID-Hash: UFE2P6O6MQJAT75PFPATCT3SUVGZBMRT
X-Mailman-Approved-At: Tue, 24 Nov 2026 02:13:11 +0000
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UFE2P6O6MQJAT75PFPATCT3SUVGZBMRT/>
Archived-At: 
 <https://lore.freedesktop.org/20261123101659.600247-3-frederic.mahe@cirad.fr/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

nv50_dp_mode_valid() keeps modes that are too fast for the DP link out
of the connector's mode list, but a user-supplied mode only goes through
atomic check, where nv50_outp_atomic_fix_depth() lowers bpc to 6 and
then accepts the mode even if it still does not fit.  Link training
then fails, the display stays dark and, before the previous fix, the
kernel crashed.

This happens with Xorg's modesetting driver, which builds modes from
the EDID itself: on a Quadro 600 (DP 1.1, 4 lanes at 2.7 Gbit/s) with a
4K monitor it sets 3840x2160@60 (533 MHz), which needs 1200 MB/s even
at 18 bpp against 1080 MB/s for the link.

Return -EINVAL from atomic check in that case, so userspace can fall
back to another mode.  Only check when the link capabilities are known,
so that a sink that is asleep or still resuming does not make every
commit fail.

Written with help from Claude (Anthropic); reviewed and tested on hardwar=
e.

Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
index e91130f..fbe8528 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -423,6 +423,21 @@ nv50_outp_atomic_check(struct drm_encoder *encoder,
 	/* We might have to reduce the bpc */
 	nv50_outp_atomic_fix_depth(encoder, crtc_state);
=20
+	/* Reject a mode that does not fit the DP link even at the lowest bpc:
+	 * link training would fail and the display would stay dark.  Only
+	 * when the link capabilities are known, so that a sink that is
+	 * asleep or still resuming does not make every commit fail.
+	 */
+	if (crtc_state->mode_changed && crtc_state->active) {
+		struct nouveau_encoder *nv_encoder =3D nouveau_encoder(encoder);
+
+		if (nv_encoder->dcb->type =3D=3D DCB_OUTPUT_DP &&
+		    nv_encoder->dp.link_nr && nv_encoder->dp.link_bw &&
+		    nv50_dp_mode_valid(nv_encoder, &crtc_state->adjusted_mode,
+				       NULL) !=3D MODE_OK)
+			return -EINVAL;
+	}
+
 	return 0;
 }
=20
--=20
2.53.0

