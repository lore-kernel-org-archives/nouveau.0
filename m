Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563A2CA5FB1
	for <nouveau@archiver.kernel.org>; Wed, 30 Sep 2026 07:41:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 253C510F216;
	Wed, 30 Sep 2026 07:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iNmoLrtn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2E2A848835;
	Wed, 30 Sep 2026 07:23:10 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790752990;
 b=PZlh6Qcs83E/Qt7aWKQ0A8rDGzz8SSsPrF0sGfKGJy4sPRmANEU786c2tpS25+Cc8UMqv
 tOUaxTd4XqHAtCidc8YPvztyT5CtcdCBo/Ff63U2qMTv/WATXJyCbnksGjwnIxg3vSpRUXn
 WvJrvez371DGVverbA9C+Kbr6pOiTCBo0FoKwuKmbzU6v4ZWXKBQm+UA5UQ3iTktHL5wyNJ
 4jcCCqgqsX1X2NYougmErRTXMvwe4KnSDSi/7l0C0tzH4qJYZRcsfp6f7QvcyEc3sucjmv4
 2mBI4vQbifwHVWpZYExgbQqFXmKA1ekR1w2f92D3rW4ySyLBRHIXuf6cdAlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790752990; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PYKkp31apSAEISw/jGrWe6JA/G726GoDfmS6cx9afck=;
 b=knJ8UJ+/5fgu1DABlozbNwLXwg2XUoloI0UGx+rUpRxCevk3eB3Ogq7dOFRtvGcDCxM9B
 FannNOA1eSqEBaAMxlzWxx2FV7ICUK9kIz2KC7Tl+RaANhw80k5kRNMY6LhsZS0gO1zH6D8
 nwHBZ+v1wUvLO7NmvELKGsnNLnD1HBogywOLyIxauWWzdkETcg9K4zTQcLbSb0BRu3mjOO1
 Ua4OjR70vQ792D4+bfDUZ+aCJfR+wlxDKEEZuzNV84FXXGq7je0KbczCANqyHzC4NgNYZZt
 A5mXJiwqsWct07q8iRLTpUQiLPtdVQ/MU5QwxHK1vnju3tI9EtwFHudnMD6Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C43784764D
	for <nouveau@lists.freedesktop.org>; Wed, 30 Sep 2026 07:23:06 +0000 (UTC)
Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com
 [74.125.230.234])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 348CD10F213
	for <nouveau@lists.freedesktop.org>; Wed, 30 Sep 2026 07:41:12 +0000 (UTC)
Received: by mail-qk2-f42.google.com with SMTP id
 af79cd13be357-93bef17c191so436001185a.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 30 Sep 2026 00:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790754071; cv=none;
        d=google.com; s=arc-20260327;
        b=WCaEu8e5XiUTxbc5bV9GHSU4b44AHkgc+IUm0S+MlbD/HSlbNyeSTiYY5hHZtYnkw0
         bU4K9XKgLQNrU8p6KS3c+7jMA7wM5v51tuv5loV2KYRDlQTKyAVy7XTPlKBsVNQVk6BZ
         3dGW4Tr4MqPQu9BUJkm+CNb09zVoT0eh1Zb79l5D5BTPTv/unbjcZiuvdZpbp91HZhHA
         Mvq/42UASVCf67QtwnCCtlIrzC1R7ZiE+ANxWtvAPG2QguIBHNctl8BoFLtY7+AnV3Qp
         VTOOVAODcC7vPVwD0pcto8dqy2TNk3MYPoEeFhP0BLpLgvsix1z/ZS375LMjYMDGcDlL
         54FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PYKkp31apSAEISw/jGrWe6JA/G726GoDfmS6cx9afck=;
        fh=TZ8R5oEiQ3//CWFyIGtjjcOehoLUWEGZsKS/3A32VwM=;
        b=qU853pEv4hYwReKd9J+NwTJ9FWDAWSXHnzHU8zgjXP+hTEVDakLzWhymBQ9E+nHidc
         yiyIRl5YT9iaiFAkFIJO/SqXMeIRDvGml920PfuqfpgMqx15BfI5J3klV8ktUTonepsI
         Jw3X2aqK1O1LP2PCK6PtvyuGaoGZxPSav6w8oO1mFCBT89yf9nXwIBc+W+4kHG9iqwLg
         x3qcbf79Xc98WZP9o8YaX7mq9sbtnkgr58hSFjUIKZvfami2UWBwIorO7wvj1v78pslR
         1T2LnKB+H+HslF7Kpu5LLfirjNgW6B53IpeFOSIbZDt12Q7HlnQQmGWetkRWoRfXUokE
         /d7w==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754071; x=1791358871;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PYKkp31apSAEISw/jGrWe6JA/G726GoDfmS6cx9afck=;
        b=iNmoLrtntvU6I+PrDhaifwQm2BwuRupbnfetiwyEQfDA1fvtpnwQz55465viY+5dDe
         S+sN4/k9HnWtBRyz/Xb+wOPUJP0bWqQird48MtBG7yJoAiHN0UEG5qentWK2UgjFLce9
         jPnfauXO7LdMwwIxCTiQ77CRCOyS8JTXN3Pf+WEnHmLCcuokJjYch/H8P+MFqKk10M0A
         5WnN8bhlCvicvJRnrkQVEJKbm65jy7nMNGV0FCHdfsyZLbJBDqwLL81sM8NTJo51r9L/
         r8Pf3vYvUUJodCqPPkb5Uk4uFSpcJqGAnOsFP3ZIx8rRMQGfswFE97pYk09NW630s3Lt
         xs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754071; x=1791358871;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PYKkp31apSAEISw/jGrWe6JA/G726GoDfmS6cx9afck=;
        b=Dpfdg3cQ7yoAR8714qikS8ThGCl0rK366Gz//OP/5Q1n5tHeF5T9Lb09Iy7IFtdHGn
         7SWjkmQH6YflVAqWybfMda7/B4iTWELLYJblnObDyl7CsuPB8sUKNJq3E2Sl02hcJJYf
         KUV0tf/g12YckbYIDAoLahdR7TX7E4u47UhKor6xgO/a+yRplruOaHD/HbmJzYyQjHzE
         /9a3RMc43mE/EhTGaQPYMbNPPCojdf63U0YdtB6NGaQMUMGRVww/2qCXsUznKFDKpSAB
         rqES6i2Vf1QxBGk9KwUe2FGceQEwDCOi2Rs9etOIvZSfcvToGmCWDF7mptnBf84YqrPb
         T7Cg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzT3TgN3JfEINvHpG3muxCG2YpHqcDooOesfgocDOL381aLjkvRaYUhv44o7vLcqd2MY4jlIHmR@lists.freedesktop.org
X-Gm-Message-State: AFuF++kkTScWeRKGMiMwSbAKHcRDXELzEWD7EIftfRsHXZ3nkVI8E2ur
	srFZwuNQtIf5a4uLWbxgpSaRmZVaUeaz6YNyxWHkFpOb0GkhTmOphCXUus/xGkrbeUZpyUb6lAR
	q7NlBLDzE2Mtyc7nLuIgspmEJzVyqnZM=
X-Gm-Gg: AYBFou34bS2PVte5IJxBl23HkjrGBrAil4AUlGbHgNM4C4hLl+8QbKYvXugEQkXzZug
	CwoluG2NvrrbeUK8jom3xpU+bMLb/2ohWAdKSZUmDefB8THF5YzcMXF17Kx73R4V9TLXpxzGHMB
	eboWi8l9h47bxu99AkFBmf6Pr2hvoGqGJD0Pj4tTOrQOSl4XsxpBqmR7+j7egGY+synsodHIXyO
	9nB3JGNpNwX6GDDGqdonAbeRajYaawURvY5ZYyn2LKk/iDibExk3j182RpRK1gELNQ6bhIRHC6L
	6rZ2JCvnHRf5TapUGDrYfLTihqk80gGskF3x50iPqEiKP64dnXsi2lMwPpzQ9rl+z0NLk7TMT62
	yV6DCGTBpCsUUnwKejaH/H+1t20A9NLj8koWhTYmt
X-Received: by 2002:a05:620a:3706:b0:93a:9ef5:d370 with SMTP id
 af79cd13be357-93ca952e6dfmr86798585a.1.1790754071044; Wed, 30 Sep 2026
 00:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <0e54ab83-6f15-0109-5b75-b0b8c712229f@gmail.com>
In-Reply-To: <0e54ab83-6f15-0109-5b75-b0b8c712229f@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 30 Sep 2026 17:40:59 +1000
X-Gm-Features: AclHuK8z184X-RMgSlio7DO825EKbwmxn95y0x-Eldt5pVmT-z5kkIzA74gGU5A
Message-ID: 
 <CAPM=9tyqDJK3MftJZz8pMZif670ru-HAPuQhbq9sW+d4cn5Cvw@mail.gmail.com>
Subject: Re: nouveau nvkm crash in 7.3-rc5
To: Woody Suwalski <terraluna977@gmail.com>
Content-Type: multipart/mixed; boundary="00000000000049640e065cae6cf8"
Message-ID-Hash: NRG7BWSCIHBTY4DL2XK6MZLFWJN2X346
X-Message-ID-Hash: NRG7BWSCIHBTY4DL2XK6MZLFWJN2X346
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NRG7BWSCIHBTY4DL2XK6MZLFWJN2X346/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tyqDJK3MftJZz8pMZif670ru-HAPuQhbq9sW+d4cn5Cvw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--00000000000049640e065cae6cf8
Content-Type: text/plain; charset="UTF-8"

does this help?

I'm not sure why your GPU isn't using GSP instead of ACR but this should fix it.

Dave.

On Wed, 30 Sept 2026 at 07:53, Woody Suwalski <terraluna977@gmail.com> wrote:
>
> Hello, I have noticed a kernel crash in 7.3-rc5. I am quite sure it was
> not in 7.3-rc4. (nor 7.2.8)
>
> The side effect is that system would hang trying to do suspend to ram.
>
> Is it something you are already aware of? Any patches to try?
> Or do I need to set up bisecting for this issue?
>
> Thanks, Woody
>
> terraluna977@gmail.com

--00000000000049640e065cae6cf8
Content-Type: text/x-patch; charset="US-ASCII";
	name="0001-nouveau-check-gsp-rm-as-well-as-gsp-pointer-before-g.patch"
Content-Disposition: attachment;
	filename="0001-nouveau-check-gsp-rm-as-well-as-gsp-pointer-before-g.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_munsnif70>
X-Attachment-Id: f_munsnif70

RnJvbSBhZDZiYzIxNzgyOGE2ZDQ2NGVjYTQ1YzVlMzdhOWZiMzJjMWZjMzZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpEYXRl
OiBXZWQsIDMwIFNlcCAyMDI2IDE3OjM2OjE1ICsxMDAwClN1YmplY3Q6IFtQQVRDSF0gbm91dmVh
dTogY2hlY2sgZ3NwLT5ybSBhcyB3ZWxsIGFzIGdzcCBwb2ludGVyIGJlZm9yZSBnY3gKIHJlYWR5
CgpJbiB0dXJpbmcgc3lzdGVtcyB3aGVyZSBnc3AgZXhpc3RzLCBidXQgY2FuIGVuZCB1cCBub3Qg
YmVpbmcgdXNlZCwKd2UgbmVlZCB0byBhZGQgYSBzZWNvbmQgY2hlY2suCgpGaXhlczogY2I0Yzc2
MDM2NzhjICgiZHJtL25vdXZlYXUvZ3NwL3I1NzA6IEFkZCBzdXBwb3J0IGZvciBJTlRFUk5BTF9H
Q1hfRU5UUllfUFJFUkVRVUlTSVRFIikKUmVwb3J0ZWQtYnk6IFdvb2R5IFN1d2Fsc2tpIDx0ZXJy
YWx1bmE5NzdAZ21haWwuY29tPgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvdXNlci5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL3VzZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS91c2VyLmMKaW5kZXgg
Zjc4ZTZiOWI0MjkyLi5iODQxZDY2ZjhiYjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252a20vZW5naW5lL2RldmljZS91c2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL3VzZXIuYwpAQCAtMjAxLDcgKzIwMSw3IEBAIG52a21f
dWRldmljZV9nY3hfcmVhZHkoc3RydWN0IG52a21fdWRldmljZSAqdWRldiwgdm9pZCAqZGF0YSwg
dTMyIHNpemUpCiAJfSAqYXJncyA9IGRhdGE7CiAJaW50IHJldCA9IC1FTk9TWVM7CiAKLQlpZiAo
IWdzcCkgeworCWlmICghZ3NwIHx8ICFnc3AtPnJtKSB7CiAJCWFyZ3MtPnYwLnJlYWR5ID0gTlZf
REVWSUNFX0dDNl9SRUFEWSB8IE5WX0RFVklDRV9HQ09GRl9SRUFEWTsKIAkJcmV0dXJuIDA7CiAJ
fQotLSAKMi41NS4wCgo=
--00000000000049640e065cae6cf8--
