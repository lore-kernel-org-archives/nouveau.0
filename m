Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5148CD6E49
	for <nouveau@archiver.kernel.org>; Fri, 29 May 2026 18:37:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA58B1123D4;
	Fri, 29 May 2026 18:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eDUQQwqp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2EF21466D2;
	Fri, 29 May 2026 18:24:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780079046;
 b=j3+LqWSmOhynqt4nWT1OKp4SNFFPITOiQrd9ZV2PKjEQyny66T1DrGHq9KLZZE9i4oT/B
 b669IUSyF4p/AjNZeI6iX1CA7ovkFPOqsSP21hJc7uTdy5d5JxYAIjuxYnBwt6Fcsr+F3ii
 tEWjEnrw5qkKdPh5YRSoZgHd2dXu41gqtAu/lgkNq7wymauyMLHuzJlBXe6yCYeFb25sgWw
 /+UtDHeZIWv35DLCIZuT+6FTmQQ6zeScYeRrihxokKRc3sdtjKs1geBOglavTXZtB0EIJPm
 LYeGA2KC/xqLu4LWA26ta9Lb14/0kx7jsD82y/7PXE/Kh0uNzPJfuuq7QOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780079046; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cF/fCKGGsVn6l967F1Qq9M9WKaqTKMJ/A9UZOUtdnUs=;
 b=lUJulIpJJGCO+atXWEk0Cu6pOMenVP+8tRPB85smdt5s9iIBR6+f4XTrEu0sDcbL8Jjgs
 +VcSVQWNiPu+0NQ+Q5iP5JaYuG6kA82lmPUAps6/5u2et7jv61Xq81fUY8qmlRf6bWVD0vY
 p+fEYWJTDmZS82QoNXpy1TouyqXH6RT0C/5yrBAo0ITtooMwAYO6gYfmNinGrEz8ItQwtQN
 Tu0zcjJExcazJFX9xd8gzU4XYiYmcw89aAe6CE1fDwSElZxQ7AdXiGFH/mmagIKzS491ycv
 eBezVXm+AX/JexH3aUtLBMBg0byzZZKWyUjom/r4NBY6VIOHhlS90vg9zBCA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 708DC42910
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 18:24:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AADF81123D3
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 18:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780079852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cF/fCKGGsVn6l967F1Qq9M9WKaqTKMJ/A9UZOUtdnUs=;
	b=eDUQQwqpK1QxINUBK1NAx18VuqWq4t38B/x1aklBarvxF+R4XZYgRmrpYVX1ln7VzXPqhS
	JH85xgnIsRboPMj0/dvHDkYb+0fddNrL4Lkn8UVKFzPHGP75lF3V08vNcwdwZjRFpfFT9W
	Iif30nMK/BknVZ6K7uuyaMMwIGqQ5fM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-574-luTdiZlOM6a9-dwZsVaUpA-1; Fri,
 29 May 2026 14:37:27 -0400
X-MC-Unique: luTdiZlOM6a9-dwZsVaUpA-1
X-Mimecast-MFC-AGG-ID: luTdiZlOM6a9-dwZsVaUpA_1780079844
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6653518002CF;
	Fri, 29 May 2026 18:37:24 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.101])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 13D901686;
	Fri, 29 May 2026 18:37:20 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v15 4/6] rust: faux: Allow retrieving a bound Device
Date: Fri, 29 May 2026 14:34:02 -0400
Message-ID: <20260529183702.677677-5-lyude@redhat.com>
In-Reply-To: <20260529183702.677677-1-lyude@redhat.com>
References: <20260529183702.677677-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: fB3nz6B3f2eJiQ-WcDElJfXd6rbTXVkBM5NW2EeKXk4_1780079844
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: QD4AX4D7AJ3R26VVSFEB3KA3FUM3AWZT
X-Message-ID-Hash: QD4AX4D7AJ3R26VVSFEB3KA3FUM3AWZT
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QD4AX4D7AJ3R26VVSFEB3KA3FUM3AWZT/>
Archived-At: 
 <https://lore.freedesktop.org/20260529183702.677677-5-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

When writing up some rust code that used faux devices for unit testing, I
noticed that we never actually added the Bound device context to
faux::Registration's AsRef<device::Device> implementation. This being said:
the Registration object itself is proof that a driver is bound to the
device - so this should be safe.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/faux.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
index 43b4974f48cd2..e0856b2964a2c 100644
--- a/rust/kernel/faux.rs
+++ b/rust/kernel/faux.rs
@@ -25,7 +25,8 @@
 ///
 /// # Invariants
 ///
-/// `self.0` always holds a valid pointer to an initialized and registered [`struct faux_device`].
+/// - `self.0` always holds a valid pointer to an initialized and registered [`struct faux_device`].
+/// - This object is proof that the object described by this `Registration` is bound to a device.
 ///
 /// [`struct faux_device`]: srctree/include/linux/device/faux.h
 pub struct Registration(NonNull<bindings::faux_device>);
@@ -59,8 +60,8 @@ fn as_raw(&self) -> *mut bindings::faux_device {
     }
 }
 
-impl AsRef<device::Device> for Registration {
-    fn as_ref(&self) -> &device::Device {
+impl AsRef<device::Device<device::Bound>> for Registration {
+    fn as_ref(&self) -> &device::Device<device::Bound> {
         // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
         // a valid initialized `device`.
         unsafe { device::Device::from_raw(addr_of_mut!((*self.as_raw()).dev)) }
-- 
2.54.0

