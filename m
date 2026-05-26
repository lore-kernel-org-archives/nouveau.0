Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975B6CD5BC8
	for <nouveau@archiver.kernel.org>; Tue, 26 May 2026 21:29:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 43B7B10E646;
	Tue, 26 May 2026 21:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bH+46dSj";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2863946466;
	Tue, 26 May 2026 21:16:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779830160;
 b=ewPU2b/h5vlrd1KU/7mb24r3twAIA/7lp+nWR90BbS0lMXNeaiuxI4bECpiv5LBvg7O59
 sCJ+631neT2/CROgVat8hcot8qhkjGqHf5BSOzmhmP447V1StdhSzsMF0HWzZlXqY+ZaoQJ
 o4OOZCCByqHy4Z0Y/LfGPpae0vCrckvAkw+v6+Hy/sY6ZijuXLRdWevjtEE8vAyr+CQmsP2
 GwtQMNw9SSKgtml7bo4qYBGMipXY6YHF8QYGH96fECDGzSIJeg7cg1OJYumTgwKhxb8wxvp
 KXbOo7vs/qvEKox34utg7j1xQQfqqxhlJ/Zd79fkXIWwPtoClbviWNk6Oh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779830160; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cF/fCKGGsVn6l967F1Qq9M9WKaqTKMJ/A9UZOUtdnUs=;
 b=Ng3EH9LecEgtqfQNPF46jRXiUgUMVGP392/wuRwSpelq66OQQnHSEz5Rqf3THpo8Ki4fR
 fNPq4TZvj23ORyUFt2SU19MhoanXpGTzJ5jh7IVQeipd/UCrPjube+rdIoKXI7I+p9QGrvU
 bztXF88XxxdJoF0GymA/j8c7tZEC8Ab2yMrQr8g/6tD7mVXXQ31zGsXhiG/CEURJkZAbZrk
 uaPUbc+iBneA0V/Kvw2E+1oKHGxD6AzHZhjpLQ+IEmXJXHpxjtMPjIv6cKvEHXY44BOqk9M
 //+KSXgzctqCmJN4FnGuIE0/4LLyht30oQrX3tWQOwJeZm/vz9V4NhI3Pa8Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A80DF4641C
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 21:15:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 82BDD10E25A
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 21:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779830961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cF/fCKGGsVn6l967F1Qq9M9WKaqTKMJ/A9UZOUtdnUs=;
	b=bH+46dSjt8q22bLPH9gIMG+ZWTBD65YYqG9gDlRmsdBCmLujljLdd2rk/ikLLsSJb3cnZW
	vymry/D9kzxjj0slAZx4MU9jWzNIPq2mJh+cyr+HCf8ce/n0Br9lIi+wSGV737ZwLgGV+Z
	AksXQtSJcZ5W7dYHgOqQbhHphu4H9dA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-58-Zm3utFQkM5-IN6O6wWuj2g-1; Tue,
 26 May 2026 17:29:16 -0400
X-MC-Unique: Zm3utFQkM5-IN6O6wWuj2g-1
X-Mimecast-MFC-AGG-ID: Zm3utFQkM5-IN6O6wWuj2g_1779830953
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9095118002CB;
	Tue, 26 May 2026 21:29:12 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.238])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CC8F730001BE;
	Tue, 26 May 2026 21:29:08 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v14 1/6] rust: faux: Allow retrieving a bound Device
Date: Tue, 26 May 2026 17:28:52 -0400
Message-ID: <20260526212857.1158294-2-lyude@redhat.com>
In-Reply-To: <20260526212857.1158294-1-lyude@redhat.com>
References: <20260526212857.1158294-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 02GOYuCZrQvNPlxevurpIrVp3BUCGwUQuel4VR1P_w0_1779830953
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: IHGHORYQHSYZPHRB52TT3X4P6MIGLT57
X-Message-ID-Hash: IHGHORYQHSYZPHRB52TT3X4P6MIGLT57
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IHGHORYQHSYZPHRB52TT3X4P6MIGLT57/>
Archived-At: 
 <https://lore.freedesktop.org/20260526212857.1158294-2-lyude@redhat.com/>
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

