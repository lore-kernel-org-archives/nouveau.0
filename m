Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC9BEF8FEB
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 14:18:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 45C3610EA22;
	Wed,  4 Mar 2026 14:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="GG0rIZeU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1DF5144E37;
	Wed,  4 Mar 2026 14:08:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772633317;
 b=lkDnCUOf3BG1vJQtMo47+QHPHz1jfRs6CzzijXZvRu6Wn0KinRy4/lL2xClPdypFg49At
 Y0MXKBqVfXhPiC/U67gVDrsgtIw2lBtWK/ogAAaqM7M3PvTGOXqccclK2Q8dkNVTUXt+dTO
 aUBfeesZ/I37dYKdS0TRMwtBH+GOeL1VKrXzZ+5Z8KzlwBMqBmPwgcYwVgJFQ79C4rY8e1d
 JZ3Fe8wgbbbYJhCkAqelmKgz9ZwPttPwhC4CNb3RXl4/J+cmu2rTOhVzfuK8xbtNPS5W2UC
 maoZJ9oCPZCDi0hSbMiSYD73OyTC+6qNKVP6ybxq6afc4+P4EXZ77kMO5zBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772633317; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VJb/uIHrYqSTg+GB6V2BLb5y0MXgSCVKzM/ARVauTlU=;
 b=smY1gxrutqwEXof9iImlDXDK3wgjHa8NlADGHUPXlXO+LGexcgOtRh+XV1spu7SgUKE4K
 c9mIgyVczwUQx70Ic3ahadkaTEr8L1eVyfuBzyuMLJ4CwcqW2RB0S4gEZ56Vi51DV9AsnaM
 H5QdKJSV0+uxvEAKXDMBbhYOlC36ICzz2fJZlCGSqcwMESOZOvj0q8DcLwoDoFplBJaXsbp
 r/+fm+QaVg2O86KLx7gWDu3aIPruaOh/TVw0PAQpfZOIBLw20gvkFtpMLRGPz5upWna4fIT
 esToUdIcLMvnEWxoak3WBsvXtSl/EpUGF7wPWfzGQFEL3RIovUN2Ry3ixDwg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2AD5C44DAA
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 14:08:35 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EA32310EA1C
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 14:18:54 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-50334dd44d2so78491611cf.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Mar 2026 06:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772633934; x=1773238734;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VJb/uIHrYqSTg+GB6V2BLb5y0MXgSCVKzM/ARVauTlU=;
        b=GG0rIZeUJ6WyWlvn9oNJ6fcID8Be9zkb9o087bvqQBnv1BwP9wBRe12HgZorSOtnPy
         BGDOZtnuOGblGt5/bh5/zt7ytxr0C5noWKHOUfs9Obxx7EUPigP9NGwIsMlodtrXnqpO
         jRuivkeV1NrwbFp4Xom7yAlWZDU9KpFhcRLenkawXqKcFsVHxEh5+Sk9sLboaEjw6PUa
         18BGxhXdV/hcXdQ/ZJIfIKLe7HxUzd0ZRvvbnFflm1gw1MY4/vlmBIa7aCgnyz7nINcL
         kpOeDh14D79KDkPvxqzqP6Jxu9sIDyhnCkqAIKvpVOLtrEOK9eX6+kWeKFbOshx41oqC
         VFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633934; x=1773238734;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VJb/uIHrYqSTg+GB6V2BLb5y0MXgSCVKzM/ARVauTlU=;
        b=pzTUto+KenozbAxK/+5YO6//Av73ebYp47l5vVY3udXUH0y0ZaC9ucLt1OB9wMAaOj
         IUFH9rhNZO0VuxfE68Suf84xqrgAOMpzu3GenXNq6I84oqeMF9SirmUU71IXvTcIdSN5
         +0GAPhs3N8EmTETdaKvq1DShvj2NTfcfd9OgLxfcl/AzuoyN5UlfY85dynOZHZ4vry+I
         2CgaXARWZ21agnYERae5r9pBpm2H2E/MqWqruqP42vhPVBCXGdtbe1QE3VZ/wtIUjSb4
         JDSrMb26FSOnvnXyVUTMlUd2jwM87QOxfqQA0zU76mUOGL5dpwb0+4QQwmqmKnxUjXAw
         meLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBf99T0Tn50Tw3li95aV2Qmu48w3rmO06ZInXkwVo4y4zo+QdGwEPwVdavg+NXklvRgtXLuDiJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZC1nMD3qMen4/d3AUSRhOxlinhHDMomBbofq/CieLufE7DTbW
	UbiJaPuJfbH8+aIVkHz4Vdj3OmkvFocLb/U7hFZe+t1rrHvsjnUpm4Nx5ZXPgv5Nc2w=
X-Gm-Gg: ATEYQzwesQTSpxDUahU+L32febbFqCEc6odfPXs81ZlTYD1kZNbQ9pG0hc7gZ+hOv0D
	j4p2OOqkn5iSBOij7H6rEPvkxEDMOgV3cAVvPbUe+ilHo1LzV9GIYUKwXA01uns9Jvko8Xo+5zP
	FTVy8LNQOV4XtBWSmyz31Pnm4F/JbqpBkVNWxx/Mm/acLWEcPMyX5a0KhGsAs6OTfazcENL4AXF
	xcV+QIJw6a543cptG7Q0vDk4oNoJ76eOwhyqW2ncfZShAENShAoD5JRu34wg8vEE9HZsn20A4Az
	6bNQjhind41gG+mKmZ+agJIw4gh3drZbWPFbHgH3nmGO/gbHeouCfS+YQUGY5vu56aiEB7WcErM
	0CZ7KVpq0zY1V2sei3+kxrhiEOOTB+inELUA0vAk6oRA3ti/fxetqVKPEJxK6xxH/h2nPiXdLVx
	NQFlebjmZCS6ATdyurVczHOhqpE8LhgX08gab9ut08iIN4MQmCTfZXtkQ9cuX+psOtI2Ue0DB+E
	Yyeo01goTykHMsmZ8c=
X-Received: by 2002:a05:622a:1899:b0:4f4:e15e:528f with SMTP id
 d75a77b69052e-508db3773fbmr27695511cf.62.1772633933669;
        Wed, 04 Mar 2026 06:18:53 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50744ad885bsm152669541cf.28.2026.03.04.06.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:18:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vxn3s-000000056cr-144y;
	Wed, 04 Mar 2026 10:18:52 -0400
Date: Wed, 4 Mar 2026 10:18:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV
 capability
Message-ID: <20260304141852.GF964116@ziepe.ca>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304084750.GW12611@unreal>
Message-ID-Hash: TIUTJ2APJH3D7TEKXRDHOJC4SOWTRGBG
X-Message-ID-Hash: TIUTJ2APJH3D7TEKXRDHOJC4SOWTRGBG
X-MailFrom: jgg@ziepe.ca
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Boqun Feng <boqun@kernel.org>, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TIUTJ2APJH3D7TEKXRDHOJC4SOWTRGBG/>
Archived-At: <https://lore.freedesktop.org/20260304141852.GF964116@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
> On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> > capability of a PCI device. Provide a minimal set of wrappers for the
> > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> 
> <...>
> 
> > For PF drivers written in C, disabling SR-IOV on remove() may be opted
> > into by setting the flag managed_sriov in the pci_driver structure. For
> > PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> 
> Why? Could you explain the rationale behind this difference between C and
> Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
> for a practical and well‑established reason: maximizing hardware
> utilization.

Personally I think drivers doing this are wrong. That such a driver
bug was allowed to become UAPI is pretty bad. The rust approach is
better.

Jason
