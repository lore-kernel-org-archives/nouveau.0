Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5F5ECD997
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 21:00:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D437E10E175;
	Thu,  5 Feb 2026 21:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q0ZuDU6W";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2CC3441B49;
	Thu,  5 Feb 2026 20:51:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770324682;
 b=qm+Tehk530oH/h7YjHh8GO/YBvDxsshi5zbqRuDq21H5LmcPS3VksIMpTPbJvhj2pvXY2
 50MyiUzXXZc7xEFBoe1I3RlfMPe1dbGxzGOOWA8yGjOe5z3YK3pA/yAeSP5bXtiAdC0JB4H
 uT/W2qtDItSrY2o96bkmP8/VCRt3RqDptr8u1AD19ZZH2yb4NSaPubptQK0KXt33oVqhV4H
 LFstWqk6Cir0n23DAlws7LeAQTS4hPnPgcn+F/MI8OT9JQvl33wgt07Gnm8v1xGVK+SyNax
 ieEb7y5wTyKQfWxrDN1hBySdNF3iIcxa1XGPobItjQBTFqc/K28obbVfKn0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770324682; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iChE2sHYyL+SE0NwtrGJ4SsAVC7actOKSXH6xK1kyOw=;
 b=wbZx35htPmnkX942nw1lSYlvaLmbnzL4XPn5XxFIXgdJW7ydNPsUxoZ1KHzaF64cd47G9
 kd8G42qO82ad7MkdGxu/V43+XtY1RtUbEPoW4CYQrl8l73sSTZmEUCfU/INDxZ1/2U8Xv/x
 xtTURCr4U1Ydi7GoyqZD4epdeeaNG9KajbEydzurGtt5pNhPiXnbED2mchhQ/+LZqzUbsbd
 u/WR0Go4D2o9zcQRQef1ztcrkYvWM5O8kyG5FR3NNEpHAPjQQM44+k6uOkECbMUFUK2Y/no
 rIz09oN62xJIublQNzRlaUUEOsul5YqE7+z97/XGNcmof2RCdsmGMfjmDg/g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B15A141B47
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 20:51:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA9B10E15E
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iChE2sHYyL+SE0NwtrGJ4SsAVC7actOKSXH6xK1kyOw=;
	b=Q0ZuDU6Why2aL+sRV6jj9bhCHZ5rE/jluIhLOGGodSG22s3IH9jKGsCz79UqAJjnMssfl6
	Ojz0INf1V9QrgOKgXespGzuni/d8xmSB8iEfR2X9k/W54RTBaSEK07+Lp6xvsDV5z7dV+q
	AgfcKl9+x5VD87r+hMXC3vke6bJTq34=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-tT0OWfOiP0iPF5S8I6V0XQ-1; Thu, 05 Feb 2026 16:00:38 -0500
X-MC-Unique: tT0OWfOiP0iPF5S8I6V0XQ-1
X-Mimecast-MFC-AGG-ID: tT0OWfOiP0iPF5S8I6V0XQ_1770325238
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52d3be24cso240723285a.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 13:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325238; x=1770930038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iChE2sHYyL+SE0NwtrGJ4SsAVC7actOKSXH6xK1kyOw=;
        b=Ev6Uz8dzB5GPk2nH8POhiFjz+CkTrsA2h1QaZKIxjN/YAh0ELbfgR0GxLdgX+2tQ/C
         muLh1Cv9C4kyButzq9YIpYT1Ci6TU3t5zIntUbepKcVfc1H2iJ4Iid0Y+kQ4+TAOtj1o
         6TNUMyX09/OuXFnBHW2fb4w2ITE2tjcle76mlwNDYwxYlTm4j+MSO2/zwe/W9seyvU1s
         /10tWW9V1agxdAVxcRZdBGfg63bqWbKrBf3ZzNOIVNBBCeji+UiuuUCPbZ42eK1kOoyb
         qNH0wiPH028u6auzpZ7QO32KHSXjMlovIy+TUME+Q5GJjrHxcDGtI6sY6kL+j/51aOSn
         vdvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD8uQ/yA0AUOcHmZJ/ibdM7YDOH8bikfX89VYqrC07DjssdxYjPxmHvVnyc8hWE9Nx2WGsPu8b@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk63f1uyjMoKBSmoizQcnx6BgzksZzjf3FfNA+PcgCUbQtMVjX
	pKXzYNm9yOgECCMxcnX3CVNMCYQSWOIxk4ee7rnMfn0MRLwgx1z936aoBGXY/5D10spSke5ujLU
	AcngirToTNGTEpH76h4vJmuauZnmhSaLno7HatD/unNMJE1f2iUGWSjXt4Ue66W9hU60=
X-Gm-Gg: AZuq6aInB/tl5D0IRlSKRSg3P/JauR0fXWBikRSpLtlfrnATR9NArHTEwtlJ+VQkddn
	MVVk05WZpXSvA+mkAIE+wiWNuVoLnIehxmxkGXfQ3oCuRKThpXiyryybRF5O61N+LHelbUdRjWM
	CQZC7TBMqrGcaqZPEwHRy73ovr20Y6wvt+6/0DWN/jQQ2SLC/HSUnB/fmrbXg9JSFSuFV4nv8bG
	Z799ajR9C89XBAhPAlE0s6PuD7aitXxU0qX/CL1Q46+gK6ope0bWcZd8ydlII9sy/36GxUNEZdU
	jvoVEln9WwcMVTRvo1op4laYg/oz/gY20EXloYS8ipWdSaDEK+H1jCOmXLfXmS+e6sRM1sKugne
	cvKjsnMi4kA8SVCI=
X-Received: by 2002:a05:620a:44cf:b0:8c5:3067:903c with SMTP id
 af79cd13be357-8caeeb50f3emr72336885a.11.1770325237534;
        Thu, 05 Feb 2026 13:00:37 -0800 (PST)
X-Received: by 2002:a05:620a:44cf:b0:8c5:3067:903c with SMTP id
 af79cd13be357-8caeeb50f3emr72328985a.11.1770325236916;
        Thu, 05 Feb 2026 13:00:36 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:36 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:55 -0500
Subject: [PATCH v2 08/10] rust: pci: add num_vf(), to return number of VFs
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-8-ef9400c7767b@redhat.com>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
In-Reply-To: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y9BQHPbA4Vl0eWIONMmRMQ6usB-vUNk1t28C-MKbcRM_1770325238
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XG4H3C4NJWOWMWO2RRKD5QUUIDTBWBSP
X-Message-ID-Hash: XG4H3C4NJWOWMWO2RRKD5QUUIDTBWBSP
X-MailFrom: pcolberg@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev,
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XG4H3C4NJWOWMWO2RRKD5QUUIDTBWBSP/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-rust-pci-sriov-v2-8-ef9400c7767b@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a method to return the number of Virtual Functions (VF) enabled for
a Physical Function (PF).

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index df39ad3f0d5fd898b034609efb03368f83c2a2e9..581930d0afe98ccc29d729e4d9aab75b4144e46c 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -498,6 +498,13 @@ pub fn is_virtfn(&self) -> bool {
         unsafe { (*self.as_raw()).is_virtfn() != 0 }
     }
 
+    /// Returns the number of Virtual Functions (VF) enabled for a Physical Function (PF).
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn num_vf(&self) -> i32 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { bindings::pci_num_vf(self.as_raw()) }
+    }
+
     /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {

-- 
2.52.0

