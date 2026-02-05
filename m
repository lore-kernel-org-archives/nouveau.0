Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C892ECD997
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 21:00:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EF7C710E10C;
	Thu,  5 Feb 2026 21:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ObNepT1m";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 492D741B4A;
	Thu,  5 Feb 2026 20:51:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770324671;
 b=UJhyd4l2gkLlWZu6aMyM/II8gTMuLjaka8P+l8kLWTzB4BDgrXBO2vpoT4XxAwqy5Edz9
 5z4Q8nDAXkibpv2kVD+YkOtwT9suFR9tXOeDnPFQdHj6GlDcUsgmAQkT/Q8nEs8IL5Q/jJc
 82f5U6amo9UxLXPeBbto9UVdkN2gRxBC0GiswbrWjuerBScLEg/jSV06lCvT67phf6OgJ1b
 d+GukJNrSqHAV5w8q6e0uRTod1wvymKLD1lY8bRywiCp8dcmSHYu+MLfkb4J0SUCjWpEoOH
 ckvaQBWpwMEy8eVYzbBGrFNDyZhyrJul/CbYjjMg9UKpSHGglYSIFzUrxFYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770324671; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Bysblly79RF2LtPRkhZUIzq0xEXxTiQQ0zgHTCq8A+8=;
 b=zjMIAEXULOCJzt/0q5CVXj34MI6UsXXCpmKEH3D7T6HRSOrqlXNMAlnZex0XE4hupy7vX
 mRN7xIfc7BU/fL2mHhwCRvLbQljKTPg5/SJIuxPK8zaiMIfnzdW0KLALRM7OZ/emwKG3pKV
 TUSwTPreUVG/nRyxtCwef4toc6CsrJBaxJQ4igeJrHR3ytQmNHBrtT1QpwAe+/SA2y96+3p
 pBuVIxWGuW9l1OoO26YCD4zdBKJMNXVyQzGQf6nQTEpXso8xq8M9olzzK+V1u45A1fQnK5I
 o4eRT/fMktu+UgnlNRIpaY/OasTO6xg+/q+fcSz40/GC06B5jxZ2uYG1gsFg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3B7CF402B7
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 20:51:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A308510E109
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bysblly79RF2LtPRkhZUIzq0xEXxTiQQ0zgHTCq8A+8=;
	b=ObNepT1mq8yMfb1Y/UcuH4xLRbyrUjhiIjztVdQUGbRKBYOJ3byMsVmGvWvmcz1f46EPQW
	d/uTJGFOhioYa+LTxUSanV8Ih/GRJAyGtJPPguNxiruSHutFrTfQhWjHb8VayRgUZTc9t2
	DYsWYWm/OjIQQIJ88kf0YDQeAtLJNjE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-H88Brb5_Ms6QSVmDYkf6cw-1; Thu, 05 Feb 2026 16:00:27 -0500
X-MC-Unique: H88Brb5_Ms6QSVmDYkf6cw-1
X-Mimecast-MFC-AGG-ID: H88Brb5_Ms6QSVmDYkf6cw_1770325226
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-89462dd72a6so52555616d6.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 13:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325226; x=1770930026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bysblly79RF2LtPRkhZUIzq0xEXxTiQQ0zgHTCq8A+8=;
        b=JU5f+6uwCppS4os2HtzEL9rQanpmcm9eNS/iBIbg/HWGoRIhalVPR4EQp1hhw/0vhb
         an67Ovv8dGYafs6SBYMbkA+s9c0uTL7+msleCdBjUpHKDD5GBQ84P6hoDTLOxD0lG3hA
         wdc0LQu9+pIwQTYK7sdHdgdkNFv1VGoLyRz0wfFqpKbIrSV3Alq6cY6j8mWTzu1iooJB
         SUqdLUPMOCV9GfRfDNyrvsiuFJPiSwnofBXIt2ECoxwxSD35J7+xinCc2idTzVIvrHXl
         enKbEVu4+eMs/joda8T6gGQeg15o/ubjGFEDiBEwMBmzlbczgDO/BVau5rIkYWXvUk1X
         AUvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUht7uxH1sntRpN3+uU6vQL71SIs7IMput1IkNSQtlUvxAP/8DuU9dUyXLOAzUAGLqPpX1dBoyg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaCzaoKLvSQsYe8mH8pjlzCobUtDMBi3mPtQqbE6xzFglHKUsv
	hQZ93Qgn97JlQQwI+Vqnr/faetGEI4mARgVPhmQSjcyWALyAK50PSKLqxNSnJWSfmMWLCSz/h6C
	tem/0mJVg3mM0TP2+TtdsOPj7dcB59YMWgkrdEOW1QBwzf/GK3L8n6nbdrJsrTNYEKaM=
X-Gm-Gg: AZuq6aLND863EyuimtGqp9P7Y8bGw74aAdlYiENONmsnzMMWh3eg9EUnH0Yq9cvdIcf
	VyLzdTYkZiaTzr3ByDdi2ViC/60s9iUJeutKE+QfojoHoe6flekT3zJXOJWkNXR71LroExlG1QJ
	7SdjPPTeYUm7SllKWWl3/efCtI+zNTv1TvCurx28LKHC6HryAbKFVLSL+BG9s1YBO0HD8zjJ635
	Cam8k2LlbBdQhKRkoBsIsu+nA8+VbRkeedfbB6rx/wJEelvLb9d3XrojWiy4eTdP+1plj1f1xQa
	1avTI/AmCkx+fZPvtDp1IuA5W4zLg7zFr6ElLz5cxOQK5RcUBCH0BjZLapqEY+v/qeu0WGYB0bP
	xZL8BGtUVk2HcqPs=
X-Received: by 2002:ad4:5c45:0:b0:882:6cd3:7f64 with SMTP id
 6a1803df08f44-8953cc8c1c3mr6671056d6.44.1770325225697;
        Thu, 05 Feb 2026 13:00:25 -0800 (PST)
X-Received: by 2002:ad4:5c45:0:b0:882:6cd3:7f64 with SMTP id
 6a1803df08f44-8953cc8c1c3mr6669906d6.44.1770325225055;
        Thu, 05 Feb 2026 13:00:25 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:22 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:49 -0500
Subject: [PATCH v2 02/10] fpga: dfl-pci: set driver flag to disable SR-IOV
 on remove()
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-2-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: jsw_eGHcfgjedL0ygFhwrl92gquWP8iTqcZBY5F4PJE_1770325226
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CKO3OPAFOGBRA4A3QB53RLSAONPKUZ7D
X-Message-ID-Hash: CKO3OPAFOGBRA4A3QB53RLSAONPKUZ7D
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CKO3OPAFOGBRA4A3QB53RLSAONPKUZ7D/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-rust-pci-sriov-v2-2-ef9400c7767b@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Set the flag managed_sriov in the pci_driver structure to show how a
PCI driver may opt into disabling the Single Root I/O Virtualization
(SR-IOV) capability of the device when the driver is removed.

Merge the function cci_remove_feature_devs() into cci_pci_remove().

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Demonstrate flag managed_sriov for dfl-pci driver.
---
 drivers/fpga/dfl-pci.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
index 602807d6afcc09af9e1d53368b41460ef86545d8..7965c307f9b79bdd2c2c3277d519ab2c4e701797 100644
--- a/drivers/fpga/dfl-pci.c
+++ b/drivers/fpga/dfl-pci.c
@@ -125,15 +125,6 @@ static int cci_init_drvdata(struct pci_dev *pcidev)
 	return 0;
 }
 
-static void cci_remove_feature_devs(struct pci_dev *pcidev)
-{
-	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
-
-	/* remove all children feature devices */
-	dfl_fpga_feature_devs_remove(drvdata->cdev);
-	cci_pci_free_irq(pcidev);
-}
-
 static int *cci_pci_create_irq_table(struct pci_dev *pcidev, unsigned int nvec)
 {
 	unsigned int i;
@@ -425,10 +416,11 @@ static int cci_pci_sriov_configure(struct pci_dev *pcidev, int num_vfs)
 
 static void cci_pci_remove(struct pci_dev *pcidev)
 {
-	if (dev_is_pf(&pcidev->dev))
-		cci_pci_sriov_configure(pcidev, 0);
+	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
 
-	cci_remove_feature_devs(pcidev);
+	/* remove all children feature devices */
+	dfl_fpga_feature_devs_remove(drvdata->cdev);
+	cci_pci_free_irq(pcidev);
 }
 
 static struct pci_driver cci_pci_driver = {
@@ -437,6 +429,7 @@ static struct pci_driver cci_pci_driver = {
 	.probe = cci_pci_probe,
 	.remove = cci_pci_remove,
 	.sriov_configure = cci_pci_sriov_configure,
+	.managed_sriov = true,
 };
 
 module_pci_driver(cci_pci_driver);

-- 
2.52.0

