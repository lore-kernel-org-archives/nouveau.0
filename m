Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2861FEFB7EB
	for <nouveau@archiver.kernel.org>; Tue, 24 Feb 2026 03:18:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E30C310E496;
	Tue, 24 Feb 2026 03:18:04 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7DD634349B;
	Tue, 24 Feb 2026 03:08:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771902483;
 b=0n7ZA2vpenjS3wMkm5KeNBcIRZc4bKmrj4HglaSsR0V2zYtZ3iFwSOuAjPuKun1TZzqp1
 Kpw5lL8Y4cEAEyyLM3hvLmqiCyqkqpI63oN/+BwqaIOjyvlnIz4lGmf+EF/TsoTN0EeE6ru
 866mvnkBGfn9dsdxIwrwvmdo3vHxPwqTPtWaFR8ZzdRCt736GqvrmygUwtXbUl21ALdx+ai
 Df+DnwtWaL15/rkXe2Sk9YE1wSDnotEUgTc2xN77RdiaYvvg8YEYi3yBDeyH8IjlLz6KSO1
 Ofj5IvbdkLT7nqBMP1Y0pe/hb55H6Hik7uNNngZynRuDp8+u7ZOi1OYI/SOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771902483; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4s7+/yQhIxdpg/l5tIZ2OjoCsy5NuDi1c0KeIG7fBKI=;
 b=pvYoLdMNADcprGUxh5uLElXGttHeb+gKC7nqrSq4rxEn8HCLZarF/wJ6lHezPYQw+hzKD
 6ieL281ugJeqKaNWsjB/Mo0dFLEXNofqnlZ7SSvYYaL7E1EOaAqhOLWqlGrKcuwjAy5GDRw
 KeTL0O1p+5WcmI2W/jGxqwLW2rrJ+MQ7VFy/X70pNlxxVFYMV7DoklxvLkUYvUDhiFW4YV5
 elE2sVZjLDsy7BJDZVbWj79xrfBNvQO+oN2J+psW4XmDZdMdA2JpNSQpuhYqevGH69WCG0F
 nTGHKZ2bwRkz5JYQcm7U5yoEG0uP2G86REaioEUJkrR3UoHcsSq3iaGAMt1A==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4F45C40805
	for <nouveau@lists.freedesktop.org>; Tue, 24 Feb 2026 03:08:00 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4317810E494
	for <nouveau@lists.freedesktop.org>; Tue, 24 Feb 2026 03:18:01 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-V0-39w9VNhmGEN-YvCqi2g-1; Mon,
 23 Feb 2026 22:17:57 -0500
X-MC-Unique: V0-39w9VNhmGEN-YvCqi2g-1
X-Mimecast-MFC-AGG-ID: V0-39w9VNhmGEN-YvCqi2g_1771903076
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C5D491800464;
	Tue, 24 Feb 2026 03:17:55 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.38])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7CCFD30001BB;
	Tue, 24 Feb 2026 03:17:52 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/dpcd: return EBUSY for aux xfer if the device is
 asleep
Date: Tue, 24 Feb 2026 13:17:50 +1000
Message-ID: <20260224031750.791621-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kTB7hqtjISjTIjX-bMIdIcE6lsj_u1_b8RM07PfsQ7k_1771903076
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: T4MCQWFUDHWKOK5KDBCFV7JPCJ5BLGBL
X-Message-ID-Hash: T4MCQWFUDHWKOK5KDBCFV7JPCJ5BLGBL
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/T4MCQWFUDHWKOK5KDBCFV7JPCJ5BLGBL/>
Archived-At: 
 <https://lore.freedesktop.org/20260224031750.791621-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

If we have runtime suspended, and userspace wants to use /dev/drm_dp_*
then just tell it the device is busy instead of crashing in the GSP
code.

WARNING: CPU: 2 PID: 565741 at drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r=
535/rpc.c:164 r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
Modules linked in: overlay uinput rfcomm snd_seq_dummy snd_hrtimer nf_connt=
rack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ip=
v6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct =
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables q=
rtr bnep s>
snd_soc_acpi intel_rapl_msr libarc4 kvm crc8 soundwire_bus irqbypass snd_so=
c_sdca rapl iwlwifi snd_soc_avs uvcvideo intel_cstate think_lmi uvc firmwar=
e_attributes_class intel_uncore intel_wmi_thunderbolt wmi_bmof snd_hda_code=
c_conexant snd_hda_codec_nvhdmi videobuf2_vmalloc snd_soc_hda_codec cfg8021=
1 videobu>
processor_thermal_mbox sparse_keymap intel_soc_dts_iosf intel_pch_thermal p=
latform_profile rfkill snd soundcore int3403_thermal int340x_thermal_zone i=
nt3400_thermal acpi_thermal_rel acpi_pad joydev loop nfnetlink zram lz4hc_c=
ompress lz4_compress xfs wacom hid_microsoft ff_memless nouveau ucsi_acpi t=
ypec_ucsi>
CPU: 2 UID: 0 PID: 565741 Comm: fwupd Not tainted 6.18.10-200.fc43.x86_64 #=
1 PREEMPT(lazy)
Hardware name: LENOVO 20QTS0PQ00/20QTS0PQ00, BIOS N2OET65W (1.52 ) 08/05/20=
24
RIP: 0010:r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]

This is a simple fix to get backported. We should probably engineer a prope=
r power domain solution to wake up devices and keep them away while fw upda=
tes are happening.

Cc: stable@vger.kernel.org
Signed-off-by: Dave Airlie <airlied@redhat.com<
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/=
nouveau/nouveau_connector.c
index 00d4530aea717..cc239492c7f0b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1230,6 +1230,9 @@ nouveau_connector_aux_xfer(struct drm_dp_aux *obj, st=
ruct drm_dp_aux_msg *msg)
 =09u8 size =3D msg->size;
 =09int ret;
=20
+=09if (pm_runtime_suspended(nv_connector->base.dev->dev))
+=09=09return -EBUSY;
+
 =09nv_encoder =3D find_encoder(&nv_connector->base, DCB_OUTPUT_DP);
 =09if (!nv_encoder)
 =09=09return -ENODEV;
--=20
2.53.0

