Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF561C43458
	for <nouveau@archiver.kernel.org>; Thu,  2 Jul 2026 16:17:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1A010F4CF;
	Thu,  2 Jul 2026 16:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ZIkxrHHs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8077A46E8B;
	Thu,  2 Jul 2026 16:02:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783008140;
 b=oH3esC6GTGtwIYmbhKCjeBVoRRlbev9i5ET3syIT3gae/U/6ufBy3CAbhtPxobJuAa//9
 Piw3PclmC4rpyqBY9mCTBGg0sTw9hBXT71mTToSnGgzrvxizcV3AUXDHLwaRrqzhgH/n8Ab
 9ilAIjlJ8Z+tmXlCEQwApJEPwioG60QjMCbtiS/ywMbV190BMUIaZNEzMzLhrZp3xRlWfLb
 0b4VMFNt8vnIKX+2Y+hh3m6LYj2pr8hvyTF3UGvcZ2ftgzhzrwrr3TkE/cpg+DJWK4Ldsbd
 mVEsjmxBccjpYic4NX5qkrPsHENZXA8os7Vc3GB/F7cEEUY2rW+HT2ibArsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783008140; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=;
 b=KQuKf+6GC0OaDJWXEjmVuhRW7jubd2JRX36wopoAVlpo81POXX1l4S+owVb31odIyYe5A
 H1o0cR5TDQK3nzQTDvSanTBADP+HQYA+SgdvYLetzBo0rd7fef3VPdzhamnvowzP7Ox+QQd
 n0pQtnL8nUN3099ugImJRl0M3NZetX5IdKwAFtveneRadHMegumWqW9Z+NPCWND+BOlbMEc
 m3C9wpKoGYQInQpM4WFOYrFhRW4CrkozUIqCUgEIWqIMewyLorCPYKH627EUEd4kzvcgEGg
 1+h+Hf+t1WkusI7rCDDAVjMViyabuWdVTV15uYWed06hDUdKDqX77SUM7KFg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=broadcom.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=broadcom.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E1FA246E24
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 18:32:57 +0000 (UTC)
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com
 [209.85.216.98])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 77C4610F0A0
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 18:47:42 +0000 (UTC)
Received: by mail-pj1-f98.google.com with SMTP id
 98e67ed59e1d1-380cda7f00cso263833a91.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 01 Jul 2026 11:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782931662; x=1783536462;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=;
        b=j3Qi4hZNQwTX+PtC5XCwBKjAIFxQpnpCmNIzPV8lF3BhbNgu0LBy5B4StF2YXuKnK+
         S/AtApeMrG2YAyDBo1pmiUEEMeiVyswEYbY6K5C9HjosY8ijsCpwoIJnaIU7jr45r+TE
         AmmVSqaM1NFCAsHpCojBRTc9nn6K94qtraQbrX/QoN3MmpKRq2QnOcW5OEN31QU2NukN
         3B9za9RZBav099UHS2Ux7lQc6KSdQ7fNzdr1pmVI8CxgXxpsgxbIckIemC2jf+uTpvbC
         KAuWrnkSt0ck1pnruHXmz4Cxg9mTLQIpXeAZV7FOC868THEf78eUpoo2dLDTrTTw3wyc
         EJzg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpHRJD+ZntJPp5EgXG6oEXTfOviCmxj7eaofW4V1yL4h2u5EGkSDDdRXG9MpZxRvrO0bF3xnZEP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGxXxRVugvMVUn2AFA5Pu4/T8iA3mtjZVAk0inNtFsh3UAb3d+
	W9NKyummIl+PJeBfbrFEgjB/oxGYmyM2XOcqsZkWbtpZy/Wf1i28rVnOFnQxq0qboYf1/FeBKv3
	/SC0YcqMRjl/IjKV85FKj2+gconXQnMuiiGGfPWj+UCfQtbmU0o0si/txErbX4qGOAc0x9vt4On
	RUvuDlaTkjM6nAG19XNSt1swp66aGFPvvx/ZpmHsfNAbZzuAhPY8GqrKuFqBYsPdEwwEOekws/w
	+Lbarz4FpoM8wEGmDIhkVOHeg==
X-Gm-Gg: AfdE7cnN7jqSXSBybv/asjY+8qiaGKT7xlmNyB+fVDZxdI8htTGh+W4lT0mWNVhldSl
	Kolfz8wV2PJDTQHRS/wNs9HG7ju7o34t+nhVuFD7192Ewc1Yrctt47L7UaB8oTdPrRpkpn5SuKX
	6UyxiuH8zFHhGymC6ebd7wWeMKsNyKtLhPWIIY/LGYfCEL0paYux+6pMrEksVxDAr/mid7e1dPi
	xT2iTGZBDIY4HTJibx4hbbpFFMsfUuGC24SVUr91rzRxwQjwoa02W1X6Q4MlAmrtooPWpX83Njo
	m5nw7L32o2Ixo2irsioVnm5CmJVjIlZJi5AGLBkxBd/fivHWOMdMdUSDbl/OcGCXYjSi8AA/KPW
	6UAHDHw21PIm6QxFPvz3RP/uRG2DNuih4SE0r5mOT7ftisDctf/FDGckWdMB8c9lkoKfO+1/70+
	e8RFwRvOg9DpWG+XKIL2tAnu34IrS8jxgt1LjD041ByX5ZkDDWa6I=
X-Received: by 2002:a17:90b:1844:b0:37f:c2a9:468 with SMTP id
 98e67ed59e1d1-380baa6b497mr1876325a91.18.1782931661875;
        Wed, 01 Jul 2026 11:47:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
        by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-380cd1cbedbsm56903a91.6.2026.07.01.11.47.41
        for <nouveau@lists.freedesktop.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Jul 2026 11:47:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c083f1818so8651961cf.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 01 Jul 2026 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1782931660; x=1783536460;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=;
        b=ZIkxrHHs6i7vB6aypxV1qnLBkPuyGXC34D3HIVhh+sqYGRk/QAPiUQzjZTzlQNJhbZ
         xpDqDvUk3bjFsIxPGYL8Z7y2DDBFKB3T+/6zONNydrMXpWQRCCOCSVqSutlYvZ5jN5Vt
         vx5XRkzCJvDXzcBq76QOINFfDm3kUJnvhmtjE=
X-Forwarded-Encrypted: i=1;
 AFNElJ+cdfHyWkw0Ozs4/MwMYqfEl9iUi8V+ys0zsiLWI+l7sCnwGdcZ9C4jvniWeXSKZs341QPcDpjE@lists.freedesktop.org
X-Received: by 2002:ac8:7f4d:0:b0:51c:1bcd:5cc3 with SMTP id
 d75a77b69052e-51c2ad5c37bmr24012521cf.25.1782931660556;
        Wed, 01 Jul 2026 11:47:40 -0700 (PDT)
X-Received: by 2002:ac8:7f4d:0:b0:51c:1bcd:5cc3 with SMTP id
 d75a77b69052e-51c2ad5c37bmr24012221cf.25.1782931660134;
        Wed, 01 Jul 2026 11:47:40 -0700 (PDT)
Received: from [10.211.247.235] ([192.19.50.250])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c1080d149sm57936471cf.1.2026.07.01.11.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 11:47:39 -0700 (PDT)
Message-ID: <d37a738d-f316-42cf-8dbc-99a732a33240@broadcom.com>
Date: Wed, 1 Jul 2026 11:51:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm: uapi: Add macro for chipset specific event ID
 region
To: Bence Csokas <bence.csokas@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20260616134802.636166-2-bence.csokas@arm.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20260616134802.636166-2-bence.csokas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-MailFrom: maaz.mombasawala@broadcom.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: ESIBTE3ABQAMKK7ILITTEWR5E66G6P5D
X-Message-ID-Hash: ESIBTE3ABQAMKK7ILITTEWR5E66G6P5D
X-Mailman-Approved-At: Thu, 02 Jul 2026 16:02:18 +0000
CC: Daniel Kiss <Daniel.Kiss@arm.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Danilo Krummrich <dakr@kernel.org>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ESIBTE3ABQAMKK7ILITTEWR5E66G6P5D/>
Archived-At: 
 <https://lore.freedesktop.org/d37a738d-f316-42cf-8dbc-99a732a33240@broadcom.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

LGTM!

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
