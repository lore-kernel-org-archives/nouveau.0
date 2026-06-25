Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B61CDE000
	for <nouveau@archiver.kernel.org>; Thu, 25 Jun 2026 16:07:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C6A8A10F2E8;
	Thu, 25 Jun 2026 16:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="j8Th7U5G";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 961C146CDC;
	Thu, 25 Jun 2026 15:53:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782402793;
 b=jqD/mq1lilu+WQ5WyERK3mBG4shlUmwtEIVbzg6v0WYCpsFTcRM4kx+2S1MTPwVnY6cZ3
 5JP53h3j0ROgSqLN+YkD3Qm9u1X5ikBd/JzF7P6n92g0EWuFMCDsv6m0yB9zeTsBpUiMduM
 +dfA9dw3COfKMN+obHBN0pJRvbWzCTxxW+ceCfCoVQsURrYl+sUlcy53vOizOZqXp6X8UQT
 LIbXR04m23Nwwu30eaiY64l2qussYWHcevLRgavojr3ArJJhyaOfHjIw1A5tbBS9xgjhDLm
 rJOcnlR4q60d1VICU4Vr4EAMP0yxA4EDHpC9IAQvamnuIBmvxmi7pHv3hN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782402793; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/S3HZCUHyX2AXtRGYqlYc8dbrI2mTD1crHEXoEEND3E=;
 b=eOa2/HiVNtKYfQSTW96nlTgDhnSd7TsPKPEYp/5YYg5nfnWwaI3hc8WuTSthk0FQxcPiV
 qT8eNbG84ZXVSIT3T7HgfJdokY7o/103Io3B1ywHvgl+9GV0PBDwl5tVE2e6xeaB9YlRCOn
 8X7IzXEV96EBAOxuXE7Xzgn7Ewtfy6ckeZAW/PbA0IW9Ev/9+uL/Q9MMdY56rmSDNJvNk3U
 3wKosVmpGSnBayCa31v5SjjrQ+Ry+PP3DKb/AcWrW7WbKqMVb4u1CPqsc3iqtMYPF3E/cE7
 CHN8r9LAOSDorBLUb4asOPM2ABvfawqTXxyuTxrvSEg0CzERzBPyuDfWVJYQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=proton.me;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=proton.me
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=proton.me;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=proton.me
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2F55A46C74
	for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2026 15:53:10 +0000 (UTC)
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch
 [185.70.43.27])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AE3BB10E208
	for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2026 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=bqpltgfhlba6xhnk6vmhy5hd4m.protonmail; t=1782403544; x=1782662744;
	bh=/S3HZCUHyX2AXtRGYqlYc8dbrI2mTD1crHEXoEEND3E=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=j8Th7U5GFaUostPJG810sYcEYGsjh+osUh9HoJCBHAs114rPurViP6Rh/WZnJbJ6Q
	 8VUbHcIdq1N+j7aykfSF/+Fze0mjDIIQWIGJhluBFtCsU0wKbA5HLkriyRYX6blcF/
	 flRZNKXl++9o77h1WYghUM4oxjWgJQajjx1d/JEZGDacdxlYMTriZM0F3KJM+nbt6e
	 NEs7FiFRnRuKVFU7Mdn5/H8C3/dCJotFe2PLd28sNN6Mjx2kMPLaP8rWJkvQ/14BQb
	 FojecKHsx2Dfx2wm5cMwKOSHodkYSz9s8e2Kcedx/dO6meSqkFOsT/URS13BrAthjd
	 vvpu0Rs4M5LSA==
Date: Thu, 25 Jun 2026 16:05:37 +0000
To: nouveau@lists.freedesktop.org
From: Bonjour <bonjour540@proton.me>
Subject: A Fermi GPU Reclocking Nouveau Tester
Message-ID: 
 <FNaeTHx9335nlRTalUPjvhY1IUIp-LJhmzT__Z2Nc3Q9luTLekr6lxa7FBt5uU7chnNp_UZ9kDQBKzJycn0SK_j6MS9hlzAx7ntdpqXA7hw=@proton.me>
Feedback-ID: 115547010:user:proton
X-Pm-Message-ID: 60bd5e944651b06e833fe36f44779e612a3a085b
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1=_Ee7UZXg3dEEPxeVgXOqRCJQTsDvIMgkuLjAe5xBTTHk"
Message-ID-Hash: RXU45PEMKNTCSK3APGAXJYVW74MFGJ5K
X-Message-ID-Hash: RXU45PEMKNTCSK3APGAXJYVW74MFGJ5K
X-MailFrom: bonjour540@proton.me
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RXU45PEMKNTCSK3APGAXJYVW74MFGJ5K/>
Archived-At: 
 <https://lore.freedesktop.org/FNaeTHx9335nlRTalUPjvhY1IUIp-LJhmzT__Z2Nc3Q9luTLekr6lxa7FBt5uU7chnNp_UZ9kDQBKzJycn0SK_j6MS9hlzAx7ntdpqXA7hw=@proton.me/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--b1=_Ee7UZXg3dEEPxeVgXOqRCJQTsDvIMgkuLjAe5xBTTHk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

QmFzaWNhbGx5LCBJIGFtIGFza2luZyBpZiBhbnlib2R5IGlzIGludGVyZXN0ZWQgaW4gY29tcGxl
dGluZyB0aGUgY29kZSB0byBpbXBsZW1lbnQgbWFudWFsIHJlY2xvY2tpbmcgZm9yIGZlcm1pIEdQ
VXMuCgpBcyBmb3IgbWUsIEkgYW0gd2lsbGluZyB0byB0ZXN0IGJ5IHJ1bm5pbmcgdGhlIGNvZGUg
YW5kIHJlcG9ydGluZyBsb2dzIGFuZCBlcnJvcnMuCgpNeSBHUFU6IE52aWRpYSA0MTBNIChHRiAx
MTkpCgpNeSBkaXN0cm86IEFsdGhvdWdoIEkgYW0gcnVubmluZyBsaW51eCBtaW50IDIxLjMgd2l0
aCBrZXJuZWwgNS4xNSwgSSBhbSB3aWxsaW5nIHRvIG1vdmUgdG8gdGhlIGxhdGVzdCBmZWRvcmEg
cmVsZWFzZSBpZiB0aGF0IGlzIG5lZWRlZC4KCkkgd29u4oCZdCBiZSBhYmxlIHRvIGNvbXBpbGUg
a2VybmVscyBzaW5jZSB0aGF0IHdvdWxkIHRha2UgYSBsb3Qgb2YgdGltZSBvbiBteSBoYXJkd2Fy
ZS4KCkFzIGZvciB0aGUgY3VycmVudCBzaXR1YXRpb24gb2YgbWFudWFsIHJlY2xvY2tpbmcsIHRo
ZXNlIGNvbW1hbmRzIGFsb25nc2lkZSB0aGVpciBvdXRwdXRzIG9uIG15IGRldmljZSBwcmV0dHkg
bXVjaCBleHBsYWluIGV2ZXJ5dGhpbmc6Cgokc3VkbyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvZHJp
LzAvcHN0YXRlCgowNzogY29yZSAyNzAgTUh6IG1lbW9yeSA0MDUgTUh6CjBmOiBjb3JlIDU3MyBN
SHogbWVtb3J5IDgwMCBNSHoKQUM6IGNvcmUgMjcwIE1IeiBtZW1vcnkgNDA1IE1IegoKJCBlY2hv
IDBmIHwgc3VkbyB0ZWUgL3N5cy9rZXJuZWwvZGVidWcvZHJpLzAvcHN0YXRlCjBmCnRlZTogL3N5
cy9rZXJuZWwvZGVidWcvZHJpLzAvcHN0YXRlOiBGdW5jdGlvbiBub3QgaW1wbGVtZW50ZWQKCkV4
cGxhaW5hdGlvbjogVGhlIGZpcnN0IGNvbW1hbmQgbGlzdHMgdGhlIGF2YWlsYWJsZSBwb3dlciBz
dGF0ZXMgb2YgdGhlIGdwdS4gVGhlIHNlY29uZCBjb21tYW5kIHRyaWVzIHRvIGNoYW5nZSB0aGUg
c3RhdGUgYW5kIHJlY2xvY2sgdGhlIGdwdSwgYnV0IHRoZSBlcnJvciBzYXlzIHRoYXQgdGhpcyBm
dW5jdGlvbiBoYXNu4oCZdCBiZWVuIGltcGxlbWVudGVkIHlldC4=

--b1=_Ee7UZXg3dEEPxeVgXOqRCJQTsDvIMgkuLjAe5xBTTHk
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PC9oZWFkPjxib2R5Pjxicj48YnI+QmFzaWNhbGx5LCBJIGFtIGFza2luZyBp
ZiBhbnlib2R5IGlzIGludGVyZXN0ZWQgaW4gY29tcGxldGluZyB0aGUgY29kZSB0byBpbXBsZW1l
bnQgbWFudWFsIHJlY2xvY2tpbmcgZm9yIGZlcm1pIEdQVXMuPGRpdj48YnI+PC9kaXY+PGRpdj5B
cyBmb3IgbWUsIEkgYW0gd2lsbGluZyB0byB0ZXN0IGJ5IHJ1bm5pbmcgdGhlIGNvZGUgYW5kIHJl
cG9ydGluZyBsb2dzIGFuZCBlcnJvcnMuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5NeSBHUFU6
IE52aWRpYSA0MTBNIChHRiAxMTkpPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5NeSBkaXN0cm86
IEFsdGhvdWdoIEkgYW0gcnVubmluZyBsaW51eCBtaW50IDIxLjMgd2l0aCBrZXJuZWwgNS4xNSwg
SSBhbSB3aWxsaW5nIHRvIG1vdmUgdG8gdGhlIGxhdGVzdCBmZWRvcmEgcmVsZWFzZSBpZiB0aGF0
IGlzIG5lZWRlZC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkkgd29u4oCZdCBiZSBhYmxlIHRv
IGNvbXBpbGUga2VybmVscyBzaW5jZSB0aGF0IHdvdWxkIHRha2UgYSBsb3Qgb2YgdGltZSBvbiBt
eSBoYXJkd2FyZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFzIGZvciB0aGUgY3VycmVudCBz
aXR1YXRpb24gb2YgbWFudWFsIHJlY2xvY2tpbmcsIHRoZXNlIGNvbW1hbmRzIGFsb25nc2lkZSB0
aGVpciBvdXRwdXRzIG9uIG15IGRldmljZSBwcmV0dHkgbXVjaCBleHBsYWluIGV2ZXJ5dGhpbmc6
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4kc3VkbyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvZHJp
LzAvcHN0YXRlPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4wNzogY29yZSAyNzAgTUh6IG1lbW9y
eSA0MDUgTUh6PC9kaXY+PGRpdj4wZjogY29yZSA1NzMgTUh6IG1lbW9yeSA4MDAgTUh6PC9kaXY+
PGRpdj5BQzogY29yZSAyNzAgTUh6IG1lbW9yeSA0MDUgTUh6PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj4kIGVjaG8gMGYgfCBzdWRvIHRlZSAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvMC9wc3RhdGU8
L2Rpdj48ZGl2PjBmPC9kaXY+PGRpdj50ZWU6IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL3BzdGF0
ZTogRnVuY3Rpb24gbm90IGltcGxlbWVudGVkPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5FeHBs
YWluYXRpb246IFRoZSBmaXJzdCBjb21tYW5kIGxpc3RzIHRoZSBhdmFpbGFibGUgcG93ZXIgc3Rh
dGVzIG9mIHRoZSBncHUuIFRoZSBzZWNvbmQgY29tbWFuZCB0cmllcyB0byBjaGFuZ2UgdGhlIHN0
YXRlIGFuZCByZWNsb2NrIHRoZSBncHUsIGJ1dCB0aGUgZXJyb3Igc2F5cyB0aGF0IHRoaXMgZnVu
Y3Rpb24gaGFzbuKAmXQgYmVlbiBpbXBsZW1lbnRlZCB5ZXQuPC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj48ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay11c2VyIj48L2Rpdj48
YnI+PC9kaXY+PC9ib2R5PjwvaHRtbD4=


--b1=_Ee7UZXg3dEEPxeVgXOqRCJQTsDvIMgkuLjAe5xBTTHk--

