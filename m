Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EB8CD4F54
	for <nouveau@archiver.kernel.org>; Wed, 27 May 2026 15:46:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F2C7A10E7F9;
	Wed, 27 May 2026 15:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.b="f0HJJt3d";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1FA6446487;
	Wed, 27 May 2026 15:32:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779895965;
 b=eqAwePQQ9cqPMEWuXIBBsFMMP4+lGBv1OMyZYjT6Z1QwUUDKw71V8tNEOI/T/lewGugtx
 wa+Lx/U7i9tXBuNMDI3aCOh8Cp7tHHVzvlHyOuwW2dfvtfjenLBFaAa1BI/q2ibBO9GY6M2
 2YvRwVvKhpQRh0QfF+te47kXXFIyj8fXQXNzVS/fUlHWwJAiiuE0EVIlHmKSiXdHMfV6rbf
 TS9Pcm3wc11+bMjjAy1KQTkcNjLfuBQu6xCf+TjkOdeqahZ8289YF9HK8JewaGJHOYqnp40
 sjqm05eqc40RK1846bk0AssZU977xjbYjhbKFqP+3UddIV2El9nCDsWAE+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779895965; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DRewvKHciVqU5Ur9lYxZwRFH8ppi1XJT7zMqz7YMBqM=;
 b=M8ZqczX/DT63qTObPmcgKs7jkl2fvOyGl+I+jM2CTeRQZX5AYvAG3bTuxxyIv4D7wfrfn
 OKx/qHObhywW2+5WV1DS4wY0HrGBIss0pKoY4bImD39ML6cBNKRXeyfrjO63r+lv9p5QQzD
 FshoLV6hYtF95dMQt+UpRYHHsBdoa46nkqJct12vbct6Ikrwqinyg3+n3r+p3c0LQcwms4D
 Ht041hqyXtPjKt+q7ojPxb5NqtzbDFRfc5M9FE9wyeUvegCRZPhJ1cR6wXki5pBvyR8QvOj
 nJyX9WDCyunN8bsl0YCU4s40EoUbdOJMSIKyT98DypEFoi/A/RCzn9HYF6Gw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=126.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=126.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=126.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=126.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8B82041A07
	for <nouveau@lists.freedesktop.org>; Wed, 27 May 2026 01:50:50 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 27 May 2026 02:04:14 UTC
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E24F810E21E;
	Wed, 27 May 2026 02:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=DRewvKHciVqU5Ur9lYxZwRFH8ppi1XJT7zMqz7YMBqM=;
	b=f0HJJt3dRyCyor0k//LxRNSYqgvbW6y809cBfnZneVWcy1CfqQ5id2M27vo7Ly
	60Rt8YIlw3wnh0LS8YWxvVWbTR1e3pJMBHJAk9niZoPFJWrKInJaio8j24jROcNV
	dlejU61ZIxsHex6UsnAJ8JguMfXy/hkf1M/ALRt+6pGe0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wCXTMNJTxZq_66AAQ--.59386S2;
	Wed, 27 May 2026 09:56:25 +0800 (CST)
Message-ID: <6A164F51.7010203@126.com>
Date: Wed, 27 May 2026 09:56:33 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Danilo Krummrich <dakr@kernel.org>,
 Hongling Zeng <zenghongling@kylinos.cn>
Subject: Re: [PATCH] nouveau/gsp: fix NULL pointer dereference in r535
 nvenc/ofs
 alloc
References: <20260526014721.13299-1-zenghongling@kylinos.cn>
 <DISMY2BS8E1D.Q85V8DKCPM1C@kernel.org>
In-Reply-To: <DISMY2BS8E1D.Q85V8DKCPM1C@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXTMNJTxZq_66AAQ--.59386S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr4Utw47KF1xWr1rCFy5XFb_yoW8Aw15pa
	y7ur1Yyr1qyrWxKasrW3WrZw1ru34fWFyrur1rWa1DZF90yFyxZrW2qr47Za4jka1rGa10
	qrWfAa40vr1UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjksgUUUUU=
X-Originating-IP: [112.64.161.44]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBoAoG1moWT0qxrgAA3c
X-MailFrom: zhongling0719@126.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: KIO6OOVFCEL2XR54YK3DG2UEJYTQLIOZ
X-Message-ID-Hash: KIO6OOVFCEL2XR54YK3DG2UEJYTQLIOZ
X-Mailman-Approved-At: Wed, 27 May 2026 15:32:44 +0000
CC: maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 airlied@redhat.com, bskeggs@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KIO6OOVFCEL2XR54YK3DG2UEJYTQLIOZ/>
Archived-At: <https://lore.freedesktop.org/6A164F51.7010203@126.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

   Hi Danilo,

Thank you for the feedback. You're right.

  After tracing through the call chain:
nvkm_gsp_rm_alloc_get()
     └─> r535_gsp_rpc_rm_alloc_get()
         └─> r535_gsp_rpc_get()
             └─> r535_gsp_cmdq_get()
                 └─> kvzalloc()

  r535_gsp_cmdq_get() returns ERR_PTR(-ENOMEM)
   on allocation failure, not NULL. So NULL is never actually returned.

   I found a similar issue in sunrpc where IS_ERR_OR_NULL() is actively 
harmful -
   PTR_ERR(NULL) would return 0 (EOF), masking real errors. This 
confirms the pattern
   you identified.

   Should I submit a patch to clean up the IS_ERR_OR_NULL() checks in:
   - nvkm_gsp_rm_alloc_get() / nvkm_gsp_rm_alloc()
   - nvkm_gsp_rpc_rd()
   - All the callers

   Or would you prefer to handle this differently?

   Regards,
   Hongling


在 2026年05月26日 21:16, Danilo Krummrich 写道:
> On Tue May 26, 2026 at 3:47 AM CEST, Hongling Zeng wrote:
>> nvkm_gsp_rm_alloc_get() can return NULL as well as error pointers.
>> The current code only checks for error pointers with IS_ERR(), which
>> would lead to a NULL pointer dereference if NULL is returned.
>>
>> Fix by using IS_ERR_OR_NULL() instead of IS_ERR(), matching the
>> pattern used in nvkm_gsp_rm_alloc().
> There was a similar patch [1] a while ago for another callsite. I replied:
>
> 	Are we sure that this can ever return NULL in the first place? I know
> 	that nvkm_gsp_rm_alloc_get() internally checks for IS_ERR_OR_NULL(), but
> 	I couldn't find anything within the callchain that would actually return
> 	NULL.
> 	
> 	That said, I think IS_ERR_OR_NULL() checks are misleading.
>
> Is there a real case where NULL can be returned? If not, let's remove the
> IS_ERR_OR_NULL() throughout the whole chain instead.
>
> [1] https://lore.kernel.org/lkml/20260418071412.86022-1-sunliming@linux.dev/

