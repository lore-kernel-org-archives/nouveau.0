Return-Path: <SRS0=dzIU=JQ=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB52C433ED
	for <nouveau@archiver.kernel.org>; Mon, 19 Apr 2021 12:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7329561003
	for <nouveau@archiver.kernel.org>; Mon, 19 Apr 2021 12:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7329561003
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2875589DFE;
	Mon, 19 Apr 2021 12:43:25 +0000 (UTC)
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8BE89E06
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 12:43:23 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4FP61P3tC6z4x1wq
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 12:43:21 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="I0TxdzFD"
Date: Mon, 19 Apr 2021 12:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1618836196;
 bh=BhsA1aKlglGjpRdMu2peVecDmERAuTyLLhI53Hw2hvM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=I0TxdzFDKmlwELvKazwsOZeVnAcXV9VaM5fE7xvTiYShk0pxTrDSFHd9sh3BChcIS
 SJtM6S6tOIabpbg198P7OmsjHwDKknvTl1wZC9uRArB+d7ehIWWhv1zRZqnctCpOEv
 s05w/eD88hYfMYDivU8s/6xjI0HcjMBJoe1gZuxIUJnxM+GsqD3Yy1qPQUaNKcPlno
 RYJhlV0eRcNH9zu3xJJVynDQTJe0MrrmFT/tysCl0ebh6xga6enS97AUnExvs9zIwz
 9aAMqStAMBePn3JbVnH8MelKI1FmmNDsy45z2wPDFogj4q9Ip+0SHDLESzl7J6WuBS
 uXnwfxJ74YYrg==
To: Simon Ser <contact@emersion.fr>
From: Simon Ser <contact@emersion.fr>
Message-ID: <VKhLq4n4t7qH2ShmIjOdLd7DRUzdsb42LaS-JA0YMma54k3lBitJ9HSBIShLDHLAdvOs9jJq4eTSpElveJ7g1vuBPokhIyoJ6QqZ2usBi0g=@emersion.fr>
In-Reply-To: <20210205224140.28174-1-contact@emersion.fr>
References: <20210205224140.28174-1-contact@emersion.fr>
MIME-Version: 1.0
Subject: Re: [Nouveau] [v4] nouveau/dispnv50: add cursor pitch check
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ping
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
