Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B353606A321
	for <nouveau@archiver.kernel.org>; Tue, 24 Nov 2026 02:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=DK76nhps
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 025AB10F33E;
	Tue, 24 Nov 2026 02:13:32 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 603174056B;
	Tue, 24 Nov 2026 02:13:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795486396;
 b=RMr8EmfFnFnmMQnXOQG6eZiKRUpxMl9FSZCaGyubEbAXggomslz/qzRE9Q4cSrSQpmOPR
 iLX/NzTy+KTsb9bZCgdYAIkG5e+4pdQrKN04Wt5KN9FbrFKJvF0Wjyy3lFAD243sKePNa6x
 mZJiLNHGMEavlAtCqxGzIr0PjtCx6aqbvC5MMwk4Irzo1klYY2dgAdvmP+oKz4+OItkjAEm
 Jeh6QOiQt+R+mGe1TxzQvklP5jZWAMO//dI3gh7uCDPot/4gIQ5VdjfmxEPlwCllbk4HJPA
 WZsQDM5N9evGEDDcaeP/KmD/HrycQ/HesQfu+nhyF4jx/n9F32rAV1Yd3UTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795486396; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KKDT54b0xcQdJ9yPb4Ph0wx+GoPSANfpiWA1zNhdt9E=;
 b=eGYyKeqFLWalt5fFiCt75ANh+BLpyybvk9lZdX2bLIiIERIA6FK/q4vc5+GqwuqYl208q
 aGwEpkb/atGeN+Hw8Ito6+utHm3D5TEOE39iJBWX1LHnwsdR8xqh3K2e1bdrU7+919UHmgp
 oEK84atotc5kG8pdJHDxYz3SAMo2njLQc2a6o2a86mlOnhzwmP2Ita/+4SHh8CDtH/xrozt
 8UEoi/sLKQWvaujUmyePm7WZWUSZNMr+PwmLY5+uTmhp75ElGYP90RWxzc0WQTbfE4s+cU2
 YiDHBbP93EFwM/0HRq4qNQcRW/z860aDrQNwELI6XnY62uUYmEpGF1Ma/vrg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=cirad.fr;
 arc=none;
 dmarc=pass header.from=cirad.fr policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=cirad.fr;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=cirad.fr policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2034E402FE
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 16:40:30 +0000 (UTC)
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D9BB710EF2B
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 16:40:24 +0000 (UTC)
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 88A2F20DC661;
	Mon, 23 Nov 2026 17:40:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 6726A20E2A34;
	Mon, 23 Nov 2026 17:40:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 6726A20E2A34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795452023;
	bh=KKDT54b0xcQdJ9yPb4Ph0wx+GoPSANfpiWA1zNhdt9E=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=DK76nhpsTogobHKa/DG8vyLQGMcLkCc9ACLvvVAloOosI3HdozTheASFE9U/mvFwi
	 0imvohwhh63o4CX/mSpXMlcEy6AmqLvGI5sA4nh41Utdn2x0SAcpF3d3oy8DNYgMpW
	 Loh22+ykwmE3Fw9cZgfWBpeVWBxl+8cqTLkCuEGa7Ao89mnbzrlTGhD+sozzPgc5Ek
	 I+F1kEBtUc003ITdNiDz9kOY+QwD6zEA6nDoeMWM1TIp0j/CTi/zUVwrN/B8Eb52+D
	 loHZPQjrlvfTvUbIuZTBAOBkulHu7jpIrAf7mxS0IPdv6LlANKakZMT/ucaw1EKlUR
	 /biuAkeZ1GElw==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id wvS70TVIzUMP; Mon, 23 Nov 2026 17:40:23 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net
 [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 2FC1820DC661;
	Mon, 23 Nov 2026 17:40:23 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: xnderv@yandex.com
Subject: Re: [RFC] Fermi (GF11x) reclocking: a model of the NVIDIA driver's
 clock management, a lab nouveau module,
 and a call for NVIDIA 390 traces from GDDR5 cards
Date: Mon, 23 Nov 2026 17:40:05 +0100
Message-ID: <20261123164006.637887-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028185052.54427-1-xnderv@yandex.com>
References: <20261028185052.54427-1-xnderv@yandex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: frederic.mahe@cirad.fr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
Message-ID-Hash: A6CHPIL5F6SSAWTFGVVCJUS6JA25Y7MM
X-Message-ID-Hash: A6CHPIL5F6SSAWTFGVVCJUS6JA25Y7MM
X-Mailman-Approved-At: Tue, 24 Nov 2026 02:13:11 +0000
CC: nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/A6CHPIL5F6SSAWTFGVVCJUS6JA25Y7MM/>
Archived-At: 
 <https://lore.freedesktop.org/20261123164006.637887-1-frederic.mahe@cirad.fr/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alex,

You asked Ilia for an NVIDIA 390 trace of a Quadro 600 because its top
performance level asks for 1280 MHz on hubk01 while hubk06 is at
1012 MHz. I have a Quadro 600 with the same table and recorded one with
your run-trace.sh.

Card: Quadro 600, GF108, 10de:0df8, HP subsystem 103c:0835, 1 GiB DDR3
(so no GDDR5, sorry), VBIOS 70.08.88.00.07 (a different version from
Ilia's 70.08.7C.00.01, same perf table: level 3 =3D hub06 1012 MHz, hub01
1280 MHz no-PLL, shader 1280 MHz, memclk 800 MHz).

Recording: Ubuntu 20.04, kernel 5.4.0-216-generic, nvidia-driver-390
390.157, your trace/run-trace.sh and regdump4.py at commit da6fa2cd, both
passes complete, "no lost events", no Xid, 14.4 M lines (17 MB xz).
nvidia-settings in both passes: level 1 =3D 405 MHz graphics / 324 MHz
memory, level 2 =3D 641 / 793 MHz, switching in every phase as the
scenario intends. So the driver does run the top level (641 MHz graphics,
i.e. about 1282 MHz shader); the trace should show how it gets there.

Three differences from your procedure, in case they matter:
- no monitor answered on DP during the run, so X ran headless
  (xorg.conf with Option "AllowEmptyInitialConfiguration");
- the first attempt stopped after the control pass: nvidia_uvm had been
  loaded on demand and kept nvidia in use, and unload_nv() does not
  remove it. I blocked nvidia_uvm (install nvidia_uvm /bin/true) and
  re-ran from a fresh boot; adding nvidia_uvm to the modprobe -r line
  would avoid that on other systems. (In that first control pass the
  card stayed at level 2 the whole time; in the second run it switched
  normally.)
- the watchdog's power-off was disabled (TRACE_SYSRQ=3D/dev/null) because
  the machine is remote; it never triggered.

The archive also has the VBIOS image, lspci -vv, and the Xorg logs. Happy
to record other variants (E17 values, etc.) on this card if useful.

Testing done with the help of Claude (AI assistant).

Fr=C3=A9d=C3=A9ric
