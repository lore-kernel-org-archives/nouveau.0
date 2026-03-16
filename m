Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4767FF53D9A
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 20:46:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1D86310E4C3;
	Mon, 16 Mar 2026 20:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HxUKDD+K";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9EFC845184;
	Mon, 16 Mar 2026 20:35:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773693319;
 b=Pu9ii71/OhabIlDCdpkA5FiS6cflO4lytBxmu4hrJmIkmD1o+Au6iGOcFQWVpSzZYiKfh
 qEZzpNEqjA0YkUaEV75fc4mC/GiSyxXkWqOmJbZV8LpcgjfaKf6czht5lNIfvF0VvqDucwy
 0sNWh3Na66Igu3uIkG/M+JJNP1wliq2Uq8kvlE2E36cp2osmsBdAfE8sK4djPGiAzvMD7kd
 bOzNpsSM43PB2Bo0nV9CbUZ9qyHepG43+6c3SwzxIdDvgceJ71PPYxI0KCiTqn35K7mMsoV
 KyYYlXAG32KtvsG+qeNyGFqEPkigPzz+/sba2fBIXVXghzMFrtfkrwNpgORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773693319; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yoa+gKPzDXlz+Q0iRsqBoD9Nfhh8J2LaEjALAe2eNXE=;
 b=ts7wYaSTEM//NElX5MMhKUnR+W/CzhvdW9Qabxmt3Zu6RxcLQdBJ3Tiv7o5x+3fH0/Htb
 cLZm/QNaixTkyJ0UjH3zbElJSWKI1OBmHTYUoFWpaHmNWbP/SS87xWEBLrz7E8DF6rRBkx9
 0AMeRFIvJS8iD5ErUIrV0saovs9ycC6w3Y8G0waOmyo4epA+Zn5ITN5PVITqO+YL58mYqUv
 abXxa2N1l7WK3W6Tt4WxqQJDgRxHyUdPnvltOJqo8Ls3gBwl++Xu0WGd0s7bdfWkNAGrnyn
 D+eZHLbdefbypSbH8zD7KZHnC/A83yZfHKgYypomTLy1CNZ+kJvSyVth2QzA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3F04843790
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 20:35:17 +0000 (UTC)
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8774C10E3EE
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 20:46:04 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4852fbfc379so71276665e9.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Mar 2026 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773693963; x=1774298763;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yoa+gKPzDXlz+Q0iRsqBoD9Nfhh8J2LaEjALAe2eNXE=;
        b=HxUKDD+KYL15H/a2+ZkR7yXS4pMXYo1lHAaSdHTEoDAywI9K7gTyKVvP2Z/C/FcH3z
         SqwionjQ6TBfOT/AesggcAidY4p4c2wxydH8D8qRNTiCjGWbeADMDNj5SfyEAXUeeDam
         joWGy6GvxnI2mARMw56G/5SJLFMX/PkwVewBK1prvB5GVYudjO7HF0tOC10VmqdBDN9M
         aDfO9oaHgCxGo6x0dvWu2tpN/z/lHSbFOYti5yl3OEiWYrnCQgeOO2aHUkpOV1WdSQe3
         WWsmHni/9nCNF/yd60DaW48t79gkX2/+XNPT29o6QTtz3L/oF7PEO8JkYlazr/yJ3Y/z
         ni/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773693963; x=1774298763;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yoa+gKPzDXlz+Q0iRsqBoD9Nfhh8J2LaEjALAe2eNXE=;
        b=FO6y/kbP+Ni017deolDurt58+sNIQkse+zLbA5bAW1wxvv2D9IhOOACCMb7bq34+9r
         gx4BGHpyr9eheSQb23EchcydiaJqFncjZjU3NeraBCSJOBh4LUBngaGb+evXj8BsKW/u
         nNTPGGrDpQ/nRtDBTpY0bZoGQQCV89BWWLPaqW+8TTIOHB61du/kPoSt8NgdRDH/gmGM
         AV/1nEDMMZMH6jiVdkSj7ihIERIoEhFrDxKQEPlMqwOCGaqCQyv/rfnInbnsirKAy+WX
         LqQV5CwdsgwBsWtO2YGn0bBmskMdkWziFkqMTHFkKO/TsmR+q01qvwtrc/ZuXacZe0lB
         Vv/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXruXHN48/S0+SGHTmnY7eCDdy3X178zrXLm+PQmiLPOxi+VfAzxWnKPL+qlP5amK5nJn+SIOPH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWV6uQKLzKTwoxwinxJRsAKw4vO62ZSBp2VHicMTIH2wIIBHXV
	JLOU/Q41DdPx+yPVShF+D148VZ2FhiQOViVNHU+t2zuUPTOZ2te/m6vFIvMgXizfTCywNrFsFgf
	eoIkBUzcLCbIM6MXEZw==
X-Received: from wmcn3-n2.prod.google.com
 ([2002:a05:600c:c0c3:20b0:480:2e46:31e1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3494:b0:485:7f02:afd5 with SMTP id
 5b1f17b1804b1-4857f02b07dmr2155295e9.13.1773693962955;
 Mon, 16 Mar 2026 13:46:02 -0700 (PDT)
Date: Mon, 16 Mar 2026 20:46:01 +0000
In-Reply-To: <20260316055736.1690546-4-ttabi@nvidia.com>
Mime-Version: 1.0
References: <20260316055736.1690546-1-ttabi@nvidia.com>
 <20260316055736.1690546-4-ttabi@nvidia.com>
Message-ID: <abhsCSOuS3pi9qrh@google.com>
Subject: Re: [PATCH v9 3/6] rust: dma: implement BinaryWriter for
 CoherentAllocation<u8>
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: WKLWUCNFRYXDEB7SDUBW4X7MZ6UIBPI5
X-Message-ID-Hash: WKLWUCNFRYXDEB7SDUBW4X7MZ6UIBPI5
X-MailFrom: 
 3Cmy4aQkKBxkzA713GN6A5DD5A3.1DBCDJK3zJA7HIH.4G3323H9IDE.DG5@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>, mmaurer@google.com,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, ecourtney@nvidia.com,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WKLWUCNFRYXDEB7SDUBW4X7MZ6UIBPI5/>
Archived-At: <https://lore.freedesktop.org/abhsCSOuS3pi9qrh@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Mar 16, 2026 at 12:57:33AM -0500, Timur Tabi wrote:
> Implement the BinaryWriter trait for CoherentAllocation<u8>, enabling
> DMA coherent allocations to be exposed as readable binary files.
> The implementation handles offset tracking and bounds checking, copying
> data from the coherent allocation to userspace via write_dma().
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +        let count = self.count().saturating_sub(offset_val).min(writer.len());

It's kind of weird to call the length method self.count() rather than
self.len(). All other methods called count() in the stdlib are cases
where you get a length by literally counting with a for loop.

Anyway, not a problem of this patch. LGTM.

Alice
