Return-Path: <SRS0=1QWf=KG=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D0EC433B4
	for <nouveau@archiver.kernel.org>; Tue, 11 May 2021 14:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 983C461376
	for <nouveau@archiver.kernel.org>; Tue, 11 May 2021 14:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 983C461376
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117B56EA51;
	Tue, 11 May 2021 14:38:27 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A730A6E89E
 for <nouveau@lists.freedesktop.org>; Mon, 10 May 2021 10:00:42 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id x188so13250398pfd.7
 for <nouveau@lists.freedesktop.org>; Mon, 10 May 2021 03:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FsG0kiz0NRABZofCxSQspiIrXqavy4umxXhfkY+/Sxk=;
 b=W+HYriAR9Do/fBW2QstFckigQIl1nRoVqh8kV8zVcpd71XHdedwgr9ODHG4afQkOIy
 ynwXu3yhnIcmMABVDj/QNeRt0F7V/f3la3pyVX+S+CEgEQdWOUMw7w57whXmk3tKqZQ+
 S7fuzxNEGgGmhiunD9+8473p2BUhLcDS4p74Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FsG0kiz0NRABZofCxSQspiIrXqavy4umxXhfkY+/Sxk=;
 b=QsPUWQqvSQ3hjU5+Ggm46N3AWzpnqJg2gL+zYXXD3A12Ic/9D2d4RHgVL2oIqjyp0r
 dKovqk7QeQKwXbrF/uHtYvmwyZj6yRCRiBwFFnTX0z5Xju3ipI7bwg8KXQ6xXeH/PDfe
 TmgyWCfTpBgG6PaAwNC0iGQ1zu98R1PnijXK7pZF7NZPoi9TbcEJvmcIuAukLgyeeRPr
 B0T0AUdjnkFaG8W/QgYCoIoaFYdsPhtOb7eFrpnwUEQ4jchOr6EYigDeTajqDlQU9fgE
 73hiDGeKEDVPJD9pgY93BjlS32urek9o4/AwvBHffaC9G+Hhnajsqym3JDhzx8MZ8SwX
 0gtg==
X-Gm-Message-State: AOAM531n29EDHn4gvIF1H88WYdAUAmxbDG429GxEAaJHJyziCQQetZD4
 mp2O0gkXJ7UOiU4tyvGhU+lx2/iYZTGIfw==
X-Google-Smtp-Source: ABdhPJyE7UfX3/k1s6AKnhEGpcrB8YSE6GI0JcOgoefUF4HyNL6R3N7ppxmkNUtofne7QC6AEc0xFQ==
X-Received: by 2002:a65:5083:: with SMTP id r3mr24237354pgp.231.1620640841822; 
 Mon, 10 May 2021 03:00:41 -0700 (PDT)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com.
 [209.85.215.175])
 by smtp.gmail.com with ESMTPSA id s23sm4153552pjg.15.2021.05.10.03.00.41
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 03:00:41 -0700 (PDT)
Received: by mail-pg1-f175.google.com with SMTP id k15so153270pgb.10
 for <nouveau@lists.freedesktop.org>; Mon, 10 May 2021 03:00:41 -0700 (PDT)
X-Received: by 2002:a92:6804:: with SMTP id d4mr20856971ilc.5.1620640447894;
 Mon, 10 May 2021 02:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
In-Reply-To: <20210422081508.3942748-1-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Mon, 10 May 2021 17:53:57 +0800
X-Gmail-Original-Message-ID: <CALiNf2_h8r6jpd1JqTwNEmW22KK8aT9B4djLKkYP7Hhnju2EKw@mail.gmail.com>
Message-ID: <CALiNf2_h8r6jpd1JqTwNEmW22KK8aT9B4djLKkYP7Hhnju2EKw@mail.gmail.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
 boris.ostrovsky@oracle.com, jgross@suse.com, Christoph Hellwig <hch@lst.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailman-Approved-At: Tue, 11 May 2021 14:38:26 +0000
Subject: Re: [Nouveau] [PATCH v5 00/16] Restricted DMA
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, Jianxiong Gao <jxgao@google.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, Robin Murphy <robin.murphy@arm.com>,
 jani.nikula@linux.intel.com, Nicolas Boichat <drinkcat@chromium.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 nouveau@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

v6: https://lore.kernel.org/patchwork/cover/1423201/
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
