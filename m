Return-Path: <SRS0=wQmX=KI=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD29C43461
	for <nouveau@archiver.kernel.org>; Thu, 13 May 2021 20:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08EF0610E6
	for <nouveau@archiver.kernel.org>; Thu, 13 May 2021 20:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08EF0610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E286EDD6;
	Thu, 13 May 2021 20:26:41 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313F66EB52;
 Wed, 12 May 2021 06:57:33 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fg5BZ1t2Lz16Q7L;
 Wed, 12 May 2021 14:54:46 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.72) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Wed, 12 May 2021
 14:57:24 +0800
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
References: <20210511082841.4181-1-thunder.leizhen@huawei.com>
 <20210511082841.4181-2-thunder.leizhen@huawei.com>
 <20210512063952.5kwdrq2yzbmgmn4x@Normandy.localdomain>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <0800f5b6-ff18-94eb-a4a0-113800a9b14d@huawei.com>
Date: Wed, 12 May 2021 14:57:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210512063952.5kwdrq2yzbmgmn4x@Normandy.localdomain>
Content-Language: en-US
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 13 May 2021 20:26:39 +0000
Subject: Re: [Nouveau] [PATCH v2 1/2] drm/nouveau: Fix ida leak
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

CgpPbiAyMDIxLzUvMTIgMTQ6MzksIFBpZXJyZSBNb3JlYXUgd3JvdGU6Cj4gV2h5IHJlbW92ZSB0
aGUgY29uc3QgbW9kaWZpZXIgb24gYG5iYD8KCkEgbm9uLXBvaW50ZXIgbG9jYWwgdmFyaWFibGUs
IEkgZG9uJ3QgdGhpbmsgaXQncyBuZWNlc3NhcnkgdG8KYWRkIGNvbnN0IG1vZGlmaWVyIHRvIG1h
a2UgdGhlIHN5bnRheCB0b28gY29tcGxpY2F0ZWQuCgo+IAo+IE9uIDIwMjEtMDUtMTEg4oCUIDE2
OjI4LCBaaGVuIExlaSB3cm90ZToKPj4gV2hlbiB0aGUgJ25iJyB2YWx1ZSBhbGxvY2F0ZWQgZnJv
bSAnYmxfaWRhJyBpcyBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8KPj4gMTAwLCBpdCB3aWxsIG5v
dCBiZSByZWxlYXNlZC4gSW4gZmFjdCwgd2UgY2FuIHNpbXBsaWZ5IG9wZXJhdGlvbnMgYnkKPj4g
bGltaXRpbmcgdGhlIHJhbmdlIG9mIGlkYXMgdGhhdCBjYW4gYmUgYXBwbGllZCBmb3IuCj4+Cj4+
IEJ5IHRoZSB3YXksIGRlbGV0ZSB0aGUgY29uc3QgbW9kaWZpZXIgb2YgdGhlIGxvY2FsIHZhcmlh
YmxlICduYicuCj4+Cj4+IEZpeGVzOiBkYjFhMGFlMjE0NjEgKCJkcm0vbm91dmVhdS9ibDogQXNz
aWduIGRpZmZlcmVudCBuYW1lcyB0byBpbnRlcmZhY2VzIikKPj4gU2lnbmVkLW9mZi1ieTogWmhl
biBMZWkgPHRodW5kZXIubGVpemhlbkBodWF3ZWkuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYmFja2xpZ2h0LmMgfCA1ICsrKy0tCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iYWNrbGlnaHQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYmFja2xpZ2h0LmMKPj4gaW5kZXggNzJmMzVhMmJhYmNiMjBl
Li5kMWM5OThlNjQ1ZmI0YjYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfYmFja2xpZ2h0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9iYWNrbGlnaHQuYwo+PiBAQCAtNTEsOCArNTEsOSBAQCBzdGF0aWMgYm9vbAo+PiAgbm91
dmVhdV9nZXRfYmFja2xpZ2h0X25hbWUoY2hhciBiYWNrbGlnaHRfbmFtZVtCTF9OQU1FX1NJWkVd
LAo+PiAgCQkJICAgc3RydWN0IG5vdXZlYXVfYmFja2xpZ2h0ICpibCkKPj4gIHsKPj4gLQljb25z
dCBpbnQgbmIgPSBpZGFfc2ltcGxlX2dldCgmYmxfaWRhLCAwLCAwLCBHRlBfS0VSTkVMKTsKPj4g
LQlpZiAobmIgPCAwIHx8IG5iID49IDEwMCkKPj4gKwlpbnQgbmIgPSBpZGFfc2ltcGxlX2dldCgm
YmxfaWRhLCAwLCAxMDAsIEdGUF9LRVJORUwpOwo+PiArCj4+ICsJaWYgKG5iIDwgMCkKPj4gIAkJ
cmV0dXJuIGZhbHNlOwo+PiAgCWlmIChuYiA+IDApCj4+ICAJCXNucHJpbnRmKGJhY2tsaWdodF9u
YW1lLCBCTF9OQU1FX1NJWkUsICJudl9iYWNrbGlnaHQlZCIsIG5iKTsKPj4gLS0gCj4+IDIuMjYu
MC4xMDYuZzlmYWRlZGQKPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gTm91dmVhdSBtYWlsaW5nIGxpc3QKPj4gTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1Cj4gCj4gLgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1Cg==
