Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C8AFCA198
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 22:01:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 00C9110E5D1;
	Mon,  9 Mar 2026 22:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RvI5JFp1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E507544FDB;
	Mon,  9 Mar 2026 21:51:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773093081;
 b=1EGN98m6UDD1OZCtMFe/BhVwEwioHa2LwQ9ZY2zo02tieuddYoBYxa0/GZEJ88LTqx+Wd
 pT4O6NXjsWom4N/G+ftIu1sbTLmByu90YEonadydUyf94cS+W8pFK8TxjsdZvcXzvhrKeNv
 rdpOHkBOx2m5keOC4DPA4ThQCiluhfz9Oelal3eJYVBC7w2GxEARsZm3eEDbXBrGTPrLhqy
 3+UMew0VNkj8kRp0G1FN2Isb0ebXs43iSffMNsS62ngbz8XAKHbuRhXlwDLbIhGfmFpuCLi
 X7J6G34Z91Nk27Kw5NzDFq617CCh1hcnrZxBW86ZbqvlHPChptGiJ7zpA3ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773093081; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aHvp/ydDvwJNhlqaovNKYyy8F9mwenGS+ySHQYofdzU=;
 b=I+HuwAeFhBXB/awNF1O023fcsnP2DGVxmH5sgeX8LkSlaq2beYeAmu0pexi55qfr8vU4A
 P9mq1/QaDfc/N5+eGr1Rdk9yYkL29HC6JbDD/QxhL70FqEPa/OxpZe8n4DdSMCpcjs719YM
 aegA+/i42FZx/t73jc7+hFT4y4iSvgBJ2SE9z6j/caiXXY0NaT79QtzIuGShxbolZRSrLu9
 BZD3uWzVgFJ88b6kNE8S+I0SUOhmqiABYCUp7O9WvRRBlXrEHM841hCBHNtqEvByZG/ko3J
 7RzzzA+KuzproeKMOubRHWpni5sbRqKqeS2oYrC4LkCyWdqcpHWLXxYBK9ew==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3648E44FA1
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 21:51:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0680510E5C6;
	Mon,  9 Mar 2026 22:01:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6779D600B0;
	Mon,  9 Mar 2026 22:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53789C4CEF7;
	Mon,  9 Mar 2026 22:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773093710;
	bh=aHvp/ydDvwJNhlqaovNKYyy8F9mwenGS+ySHQYofdzU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=RvI5JFp17G6ngaZ1JKSX0k6cw+FhIcpfRhJVFCPCWuIsAyLXCg2qApKWf6zyOlcp5
	 lnQKIfFWuw7E9kjpU8QDj+RNvYR/1scHUesCsHd7mMwBR5/fPl5HCzgSO42WhDMHnE
	 eQOdaIwdpvZrNRxIfrcwR8a9b9viqE6/Wm4fKPxo+2xG7oq7O2I/Zj43Xoh9YzOB2H
	 eH98HCgXAr2xT48334A7+jDfNmep+IKjz9FJN/4ATcymS6nqd/Pl5i+T5P8V3j2T60
	 RdYpsQLChc3LwHqKaYTbJjIjbE1psl/swPoKPXOL6xDo3E50ZPUMmUjTVl58birVKs
	 2jNNtb+UUAMeQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 23:01:46 +0100
Message-Id: <DGYL9FS1Z00X.2HEJ96J8R3OK4@kernel.org>
Subject: Re: [PATCH 6/9] gpu: nova-core: generalize `flush_into_kvec` to
 `flush_into_vec`
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
 <093ca23e-7081-42db-a202-0a42c51741a3@kernel.org>
In-Reply-To: <093ca23e-7081-42db-a202-0a42c51741a3@kernel.org>
Message-ID-Hash: 4XSFO3SOMHIIBUP6WABR3VWFZ7J4AAVJ
X-Message-ID-Hash: 4XSFO3SOMHIIBUP6WABR3VWFZ7J4AAVJ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4XSFO3SOMHIIBUP6WABR3VWFZ7J4AAVJ/>
Archived-At: 
 <https://lore.freedesktop.org/DGYL9FS1Z00X.2HEJ96J8R3OK4@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 9, 2026 at 10:57 PM CET, Danilo Krummrich wrote:
> On 2/27/2026 1:32 PM, Eliot Courtney wrote:
>> Add general `flush_into_vec` function. Add `flush_into_kvvec`
>> convenience wrapper alongside the existing `flush_into_kvec` function.
>> This is generally useful but immediately used for e.g. holding RM
>> control payloads, which can be large (~>=3D20 KiB).
>
> Why not just always use KVVec? It also seems that the KVec variant is not=
 used?

(Besides its single usage in GspSequence, which wouldn't hurt to be a KVVec=
.)

> If there's no reason for having both, I'd also just call this into_vec().

