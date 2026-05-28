Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0745CD5BD5
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 07:45:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D738C10ED4E;
	Thu, 28 May 2026 07:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dorfdsl.de header.i=@dorfdsl.de header.b="0ov75H+V";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7DE27465C7;
	Thu, 28 May 2026 07:32:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779953528;
 b=P2twNiOFRn8aUANfv5kbaNIcw1EyfDqRhF6K534txZhyDnf/id3sQO7JBrIRlrRXok3Q3
 w9OUUgR+m26ggCc3pSp5SvfdX0ygRg0nlS4/TpW+209P0/wO5FxRaAnj7k5hBccqS2TEme3
 Fo44uRUXhsdTuoOhtUNosO/4F7Xy3qkAqojV/yRSmXXn1j2nTq2dhldhS0dEH/j4rT6dXLt
 7J/tNfqDgl5QtqAP5Jl7kWAUfoEyXlR6WoPPUAhCtArKYftoaQEmCqD6vnzz6k3V4+lDGnR
 uE3E1dhaKgFmCwA6ijBK2QVHybDFllfQETEMEZNdIiK6gzLrpv9xstN4+kWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779953528; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UGzheLD8e96meIwKVoJW6GsaQdPMKNqZ7aqZK+l8Z3M=;
 b=wxgW3MY1Pkhew0vWlzNkrJyJJBuBSd9MuIMrdtDpOvUyQHxE3wmZT3vNhIGAWAQ+2TNdo
 BkD/oOcpuOou5hMmOxz1Jap9BfdmLRxbec0Zi+OTsF6ZWRmIsZzXh8iBw/z2A6BvfrlTvSc
 KLeby3CbrvvJRVG4P22+dEoKRJ67I49RRY9T54mKU4HMmArUrf+NCmcHodLSWXeA0abt2M2
 CpS0OlCg+U+9Nn1KeAUEAaCf1Z62SWtcWK+8/dGRcDRmn74E7HNbKeyAEbFfbJX4rzUjHWi
 6uZMplgKcJ1zthhdi816Bnnu4jMgUNXIec8dlMXFaeWqIs2DPGQNrGGEYLfA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=dorfdsl.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=dorfdsl.de
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=dorfdsl.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=dorfdsl.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CE00E414FB
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 07:32:04 +0000 (UTC)
Received: from srv1.dorfdsl.de (srv1.dorfdsl.de [82.139.252.16])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1948C10ED4B
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 07:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorfdsl.de;
	s=default; t=1779954329;
	bh=vfiP9zLcawJ3V3FZEvpHFIUDHgwDQC+3jSl7QUha73s=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=0ov75H+VQa84b5IZ+KoWZ3CAfACr5HTm/drIL/ZllwFG+GV2S3ATE/Hv+dgsEEojN
	 SWtYUfHVhqDGzlBwr4EYKMRxP3XyolRVAZgdjZMdrj+A21ul0vSDf5zxymqn5RKrRo
	 V3+Sq8fX9nsKDZ60mj3GfjbEpm/wUTC96TJX/pCyU8rTot4ABDg6VmboSZyJr+ZDwj
	 VAXRRTiAVCh3zkiSHRYZYNnxMDZmC+3JeVckd8Ed6rRDN29s4xbUDx2EQkf/1902GF
	 jPlgo2Vj/T9baLT1yZ4mgRR32pSQ+rxgJglR5c5+cuu/6LJB6NJTNhRPW2r0zHZ6ll
	 Ussblbax/cjOw==
Received: from [IPV6:2a01:170:118f:1:f5f4:a4f0:5b6b:d795]
 ([IPv6:2a01:170:118f:1:f5f4:a4f0:5b6b:d795])
	(authenticated bits=0)
	by srv1.dorfdsl.de (8.18.1/8.18.1/Debian-6) with ESMTPSA id 64S7jTCF022119
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 09:45:29 +0200
Message-ID: <95da0383-8bc6-47e0-ab51-0c2a26d5ac7d@dorfdsl.de>
Date: Thu, 28 May 2026 09:45:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: display issues on Quadro K2100M with nouveau
To: nouveau@lists.freedesktop.org
References: <934530dd-61d0-4c43-a323-8947eb9be137@dorfdsl.de>
Content-Language: en-US, de-DE
From: Marco Moock <mm@dorfdsl.de>
Autocrypt: addr=mm@dorfdsl.de; keydata=
 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
 MCwzZXR/AA==
In-Reply-To: <934530dd-61d0-4c43-a323-8947eb9be137@dorfdsl.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z2RSWURGLN6JNSPHKJKGNWXOHNHTKGMS
X-Message-ID-Hash: Z2RSWURGLN6JNSPHKJKGNWXOHNHTKGMS
X-MailFrom: mm@dorfdsl.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Z2RSWURGLN6JNSPHKJKGNWXOHNHTKGMS/>
Archived-At: 
 <https://lore.freedesktop.org/95da0383-8bc6-47e0-ab51-0c2a26d5ac7d@dorfdsl.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Am 27.05.26 um 14:24 schrieb Marco Moock:
> It only happens on monitors connected to DP or DVI, eDP is fine (but I 
> assume this port is connected to the Intel HD 4600).
> Both graphics cards are enabled in the UEFI.

It works if I disable the IGP hybrid graphics option in the UEFI.

-- 
Gruß
Marco

Junk-Mail bitte an trashcan@stinkedores.dorfdsl.de
