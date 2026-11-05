Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2476082BDC
	for <nouveau@archiver.kernel.org>; Thu,  5 Nov 2026 16:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=onaG9FOW
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5D68010E348;
	Thu,  5 Nov 2026 16:32:54 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8086B490CA;
	Thu,  5 Nov 2026 16:13:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793895208;
 b=W787y91AIWHOhsj21E3dqSxReCGB3t7+7LgVFg/Gn74L7FoQlN82E/7YQGdYp8/sIHvg8
 YxOMk5sxHbsnoctaROsW+390l2JO4AwuWUpXKA7ZrZOgrUOPCbxsqfKrE92+jMmr3AFa2E7
 OX68c4h4TQjTvAXx/Xu56wekYXMVSgdTcjJRtf2xgJxO1ZJ+Tkim1QStxokBEUzMnLopIk/
 pf83T4U5xfhqxVfwDYMfcnBj3dnZl36q74xY4h2Xu7mudJWaO8kBINcL/Wua5XqrKlF2wEf
 LFmILNhz9r+SFNjybvhhwgwYQ94adkHY5U1H0gZphIfIGd272097EO9TcqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793895208; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=d4uIAeI9pE7bf79BRULVqsTB5We4Hv2szuGRJya4Up0=;
 b=SvaBpSAEn+ET5cgq+teynFCbD5Sio74vKqrutPvXaLBH5VUYRjY92zhGkZ+8luPonis2B
 waknDwFoZxfz6GSdyFKgWjNL3b6ydOq942+UyZnLPR4XQ9tqzJh1fEWvVb79gIc5cCCiCKI
 jETT/IfOseCnUzi7ShQRgWOund36RXrPe93r5pbsCUl9Y9p0kN2CLRhZP0h8y7D/TWWGrou
 L3k17QZjvTsmYo7PQhtgdGwFf6D/VXeD3o24Pj4p8IWjNjkdaFwtwxcZP6tn2xY6hA/MHxe
 cy+VYDK3mH3c+Y1kWaD6KIAS/qnYOhe/Nd/6f+rpM9SD1QKkrqhIraxASCCQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2BB75490C3
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 16:13:25 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B91FB10E259
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 16:32:45 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so19597835e9.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Nov 2026 08:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896364; x=1794501164;
 darn=lists.freedesktop.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d4uIAeI9pE7bf79BRULVqsTB5We4Hv2szuGRJya4Up0=;
        b=onaG9FOWDCi9/OKN30rPfaGRZ4homjdTxr0Ypgg/zUzKhkLjDNVWwKfYkpHhvLzZ21
         vecmg46bUYX3O2f1gQlirjKSWy91lmZjZsjJ5Gu9Ujx7f+RWg0eFn6ZfBKJKm7vcb6So
         USQ0/HSEfuN6txu5JUvU9lQ1FpNWFeCyo9CWqWuLBJlyBlH/k/61PH4Tab7H1LeyX86X
         xVSHYbyjfxl21dkmZ2Q3WXNrICxPEQrQThfFalQHpHatjp1CQN5+ouG+gkDye5GQPDzN
         mfrg9q87zSxRSeV3PUNIWZBYd22u8GEe9jVLSqx9HEeCz8gkT7zmL2DgUzlyOYi6FDFg
         Btiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896364; x=1794501164;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4uIAeI9pE7bf79BRULVqsTB5We4Hv2szuGRJya4Up0=;
        b=u+wDROFvgC9v/hol1XmJ4uZc/2JZW4RP+2TPY3LYJxG/EM7PAk9E7+B2kKk4N/eO/7
         OysO2dr25NvDRdCAJi2wRhm125+q3aEwH9cFQahsgi5IGisuG8pLm3g2q4oqGQvfKBJP
         0VJkBAShySy9cUdkuKfUJYgGOfn9xcRiF2HcLNmdrz+UI8QHf42agDho9j/SQpjkvY1V
         o8yaCGMZv2giHtb6q/7EfTpjzih02CO2xG2qZJuWNwFRhv6P/RT/tc/gboNbMONBZS9v
         UDYmi5k2vVdMiR0D1yLKJjrfYu3OlzUn220bcXgKpBUM+uz7I3rNHMp+y/hlpR4V2Gsk
         Llew==
X-Forwarded-Encrypted: i=1;
 AKwUvBywnIeQg5+IddweQvV5nv9AXMMzkwbEwteharJJlpNgKfAk1Yh5adx1XQQ1un8SHRAclHEOrRqr@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/gKGFSWwmoSpNOLjLm5fEtjym+A5DUxI5Ib3tRmOQOdL12AZIg
	9gfPw5u4mNqJvuNDxJYKxIunfvJAm0pMBb1Ph/Suit6PxxrhFWgMxRnG
X-Gm-Gg: AYBFou0oVKh/sCSsYRxbqU7+5LM0j6mph0Wlw/7gptg2+08ZUuVYzNxnRL/OzZJ+uoU
	DFkXAoFKe84Kh3MLEccys9R84THPAplEshJEUilfxQMDbxHCATeReDK0cvLi2GDbvpig5+qwqyS
	Gool83NfnjGiY370ptpmKEbdpm/TwTF2E4VkcvbGFX6x6y0asRRcUs7LgP6ofD4dAzN68WIzTx4
	1CIv7LcYHIukj2GkPlUKs0KFa0Nxgg1gTU1Bj6eNnEAthzFmaFbM0Axwak0O4Awy50GD8o9nYty
	4bmxubqvEHLK5wjML5ZReBvbxXnbtcIeMDL1paV8VGjgxIawRirQkQ5fnEbmnRG2Yn+1oAwt+UX
	82FkU4tJNfHEF0A3WZusrl4rdL5Ed/aExG06pwKtkb/wRaKH3JRSdO6y/8UMi6c/BUqZnYRNJ+2
	O1bRbOi0nA+KduJCg/FQvn365Ail41lKUmDBs3K2MRcYEV3vRKy/RuZqKoLnbeu3/S973rhL6Ga
	D2fJy0aUcxL8J593TMOExH8GWuRuFYLvij6rwwqKzX3jgmocGsW6U0Xur8gDQwiHLBy/qRIdHBt
	qNlhlrw2zMj6weDqwf+9atgav/8aZASXt7J7EDOPdIYRL8I5Fe9YCAsWKn6aQZ1Vn2eYyyZlivM
	oQP7JVQmi
X-Received: by 2002:a05:600c:3b87:b0:4a2:150f:1607 with SMTP id
 5b1f17b1804b1-4ac1709ad56mr464115355e9.13.1793896363894;
        Thu, 05 Nov 2026 08:32:43 -0800 (PST)
Received: from [192.168.1.86] (240.red-79-154-229.dynamicip.rima-tde.net.
 [79.154.229.240])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56fca22e1sm89764875e9.14.2026.11.05.08.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:32:43 -0800 (PST)
Message-ID: <0e3689d102abf41b1e788402cc9da354d5c2d969.camel@gmail.com>
Subject: Re: [PATCH 0/3] dma-buf: dma-fence: Remove dma_fence_init64()
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Philipp Stanner <phasta@kernel.org>
Date: Thu, 05 Nov 2026 17:32:42 +0100
In-Reply-To: <20261105113529.1989375-2-phasta@kernel.org>
References: <20261105113529.1989375-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID-Hash: YEFRO76U7ACGC4WLATUAODUVTYFBMEAH
X-Message-ID-Hash: YEFRO76U7ACGC4WLATUAODUVTYFBMEAH
X-MailFrom: timur.kristof@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 imagination@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.or
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YEFRO76U7ACGC4WLATUAODUVTYFBMEAH/>
Archived-At: 
 <https://lore.freedesktop.org/0e3689d102abf41b1e788402cc9da354d5c2d969.camel@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCAyMDI2LTExLTA1IGF0IDEyOjM1ICswMTAwLCBQaGlsaXBwIFN0YW5uZXIgd3JvdGU6
Cj4gV2UgcmVjZW50bHkgaGFkIGEgZGlzY3Vzc2lvbiBhYm91dCByZXdvcmtpbmcgZG1hX2ZlbmNl
IGluaXQgdG8gY2xvc2UKPiBhCj4gcmFjZS13aW5kb3cgWzFdLgo+IAo+IFRoZSBjb21tdW5pdHkg
YWdyZWVtZW50IHNlZW1zIHRvIGhhdmUgYmVlbiB0aGF0IHdlIGNhbiBnZXQgcmlkIG9mCj4gZG1h
X2ZlbmNlX2luaXQ2NCgpLCBzbyBsZXQncyBkbyB0aGF0IGFscmVhZHkuIEluIHRoZSBtZWFudGlt
ZSB3ZSBjYW4KPiBjb250aW51ZSBvdXIgZGlzY3Vzc2lvbnMgcmVnYXJkaW5nIHRoZSByYWNlIGlu
IFsxXS4KPiAKPiBUaGlzIGFsc28gdG91Y2hlcyB0aGUgUnVzdCBkbWFfZmVuY2UsIHdoaWNoIGFj
dHVhbGx5IHNob3VsZCB1c2UgNjQtCj4gYml0Cj4gc2Vxbm9zICh3YXMgZm9yZ290dGVuIHNvIGZh
cikuIFJ1c3QgZmVuY2UgaGFzIG5vIHVzZXJzIGN1cnJlbnRseSwgc28KPiBuZWVkcyBubyBiYWNr
cG9ydGluZywgc28gSSB3b3VsZCBsaWtlIHRvIGFkZHJlc3MgdGhhdCBpbiBhIGRpc3RpbmN0Cj4g
cGF0Y2guCj4gCj4gVGVzdGVkIG9uIE5vdXZlYXUgd2l0aCBhbmQgd2l0aG91dCB0aGUgU0VRTk82
NCBmbGFnLiBOb3V2ZWF1IGFsc28KPiB1c2VzCj4gdGhlIFVTRVIgZmxhZywgc28gSSBob3BlIHdl
J3JlIGZpbmUuCj4gCj4gCj4gUC4KPiAKPiBbMV0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9k
cmktZGV2ZWwvMjAyNjEwMjkwOTU1NDIuMTUyNjc1MC0zLXBoYXN0YUBrZXJuZWwub3JnLwoKTWFr
ZXMgZ29vZCBzZW5zZSB0byBtZS4KRm9yIHRoZSBlbnRpcmUgc2VyaWVzOgoKUmV2aWV3ZWQtYnk6
IFRpbXVyIEtyaXN0w7NmIDx0aW11ci5rcmlzdG9mQGdtYWlsLmNvbT4KCihwcy4gSSBoYWQgdG8g
cmVtb3ZlIHNvbWUgcmVjaXBpZW50cyBmcm9tIHRoaXMgZW1haWwgYmVjYXVzZSB0aGUKb3JpZ2lu
YWwgaGFkIG1vcmUgdGhhbiAxMDAgcmVjaXBpZW50cyBhbmQgZ21haWwgd291bGRuJ3QgbGV0IG1l
IHJlcGx5CnRvIGFsbCBvZiB0aGVtLiBBcG9sb2dpZXMgZm9yIHRoYXQuKQoKPiAKPiAKPiBQaGls
aXBwIFN0YW5uZXIgKDMpOgo+IMKgIGRtYS1idWY6IGRtYS1mZW5jZTogQWRkIGZsYWdzIHBhcmFt
ZXRlciB0byBkbWFfZmVuY2VfaW5pdCgpCj4gwqAgZG1hLWJ1ZjogUG9ydCB1c2VycyBvZiBkbWFf
ZmVuY2VfaW5pdDY0KCkKPiDCoCBkbWEtYnVmOiBkbWEtZmVuY2U6IFJlbW92ZSBkbWFfZmVuY2Vf
aW5pdDY0KCkKPiAKPiDCoGRyaXZlcnMvYWNjZWwvYW1keGRuYS9hbWR4ZG5hX2N0eC5jwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvYWNjZWwvZXRob3N1L2V0aG9zdV9q
b2IuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9hY2NlbC9p
dnB1L2l2cHVfam9iLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+
IMKgZHJpdmVycy9hY2NlbC9yb2NrZXQvcm9ja2V0X2pvYi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAyICstCj4gwqBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2Ut
Y2hhaW4uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArLQo+IMKgZHJpdmVycy9kbWEt
YnVmL2RtYS1mZW5jZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNTgg
KysrKysrKysrLS0tLS0tLS0KPiAtLQo+IMKgZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS1j
aGFpbi5jwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2ZXJzL2RtYS1idWYvc3Qt
ZG1hLWZlbmNlLXVud3JhcC5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9k
bWEtYnVmL3N0LWRtYS1mZW5jZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAy
ICstCj4gwqBkcml2ZXJzL2RtYS1idWYvc3QtZG1hLXJlc3YuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2ZXJzL2RtYS1idWYvc3dfc3luYy5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgLi4uL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2ZlbmNlLmPCoCB8wqAgMiArLQo+IMKgLi4uL2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9ldmljdGlvbl9mZW5jZS5jwqDCoMKgIHzCoCA3ICsrLQo+IMKg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmPCoMKgwqDCoCB8wqAgMiAr
LQo+IMKgLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXNlcnFfZmVuY2UuY8KgwqAgfMKg
IDUgKy0KPiDCoC4uLi9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3RsYl9mZW5jZS5jwqAg
fMKgIDUgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Yy5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fd3Jp
dGViYWNrLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+
IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3R0bV9tb3ZlLmPCoCB8wqAgMiAr
LQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZXF1ZXN0LmPCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9zd19mZW5jZV93b3Jr
LmPCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92bWFfcmVz
b3VyY2UuY8KgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoC4uLi9ncHUvZHJtL2k5MTUvc2VsZnRlc3Rz
L2k5MTVfc3dfZmVuY2UuY8KgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL2ltYWdp
bmF0aW9uL3B2cl9jY2IuY8KgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1
L2RybS9pbWFnaW5hdGlvbi9wdnJfcXVldWUuY8KgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJp
dmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCAyICstCj4gwqBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9mZW5jZS5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9mZW5jZS5jwqDCoMKgwqDCoMKgIHzCoCA0ICstCj4gwqBkcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3Rfam9iLmPCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS9wYW50aG9yL3BhbnRob3Jfc2NoZWQuY8KgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfcmVsZWFzZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAy
ICstCj4gwqBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9mZW5jZS5jwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9mZW5jZS5j
wqDCoMKgwqDCoMKgIHzCoCA0ICstCj4gwqAuLi4vZ3B1L2RybS9zY2hlZHVsZXIvdGVzdHMvbW9j
a19zY2hlZHVsZXIuY8KgIHzCoCAyICstCj4gwqBkcml2ZXJzL2dwdS9kcm0vdHRtL3Rlc3RzL3R0
bV9ib190ZXN0LmPCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoC4uLi9ncHUvZHJtL3R0bS90ZXN0
cy90dG1fYm9fdmFsaWRhdGVfdGVzdC5jwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS92
M2QvdjNkX2ZlbmNlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBk
cml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9nZW0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAyICstCj4gwqBkcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2ZlbmNlLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9mZW5jZS5jwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2ZlbmNlLmPCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfaHdfZmVuY2UuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAy
ICstCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfb2EuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHJlZW1w
dF9mZW5jZS5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3RsYl9pbnZhbC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2
ZXJzL2dwdS9ob3N0MXgvZmVuY2UuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAyICstCj4gwqBkcml2ZXJzL2lpby9pbmR1c3RyaWFsaW8tYnVmZmVyLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlv
bi9mX2ZzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBpbmNsdWRlL2xpbnV4
L2RtYS1mZW5jZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE0
ICsrKy0tCj4gwqBydXN0L2tlcm5lbC9kbWFfYnVmL2RtYV9mZW5jZS5yc8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqA1MiBmaWxlcyBjaGFuZ2VkLCA5NSBpbnNlcnRpb25z
KCspLCA5NCBkZWxldGlvbnMoLSkKPiAKPiAKPiBiYXNlLWNvbW1pdDogODI1OGEzNzcwMmI5Yjlj
ZjI3ZjVjMGVhMDc2MjVlM2U2YmQ3NGY1YQo=

