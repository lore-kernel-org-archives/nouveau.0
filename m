Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ABBC88E50
	for <nouveau@archiver.kernel.org>; Sat, 12 Sep 2026 03:01:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B326F10F737;
	Sat, 12 Sep 2026 03:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dUHzBfwv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 62A014704E;
	Sat, 12 Sep 2026 02:43:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789181018;
 b=uucIHMA52RLSzBeV31I5W5BMhIaVpHWMc1/er4cBbRSTYkvl7hCF708jTEj19AzGYmat6
 tfrKlZgf+ZveTsAsENZZyP0YUbIGDvu1S+d3LL2NJ/vWsVxetMK+bUrbvNPTx8bLDvQyKn3
 UK4P8GhWWLO2KJXqo/T2s2QtP/AnT7xYmNvQ9d2fYGrWMf9k/KByLTrQXTfDjY7VQEDi8e7
 gz1bdg1PKvqn6WUFlWmNfdaLTg5FTVUQF5jlgk7tQHJUMYzENdNFpzuWd+fzEhUQOBqYv/6
 MTVDiz8o1tTfXzi0tmTWFqBP9KCzsGyZqgyYeH7PJ7O0yCo8esip7tF5+WHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789181018; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PtaQqVSlZuFX18DeVPVqwMKwClza0Yn6Bnu05r8m2bg=;
 b=SBUFP+xadodmdxnROJ1X6y4n5Q//b7wJZN3we9S3hYhaRct1Q/M2gzddQXY9Hjx1iTkV8
 hPxt8DAKoko37/iGUSequtK4W0jf4zIgiA+b00D2UE/9t2jP23fMuBpkloO7n7DGEHSsjos
 n6UH9PBSNihwpnGBmvY+d52A5Sl23YHjTS1tquZbYKfsQkxHX9rfU01SBiwYWacskr42h+0
 aBWm3JgkaXDhEO0PcnUjKJ7GXhK4E66Rh+e7MThUOFfk6tnjoMXVSoWVXzzvadV5oTmGy4X
 OCPKvrtj8UzZq+OIIca3CF/E7EFHUFKj87a8AxPbnL7gEYxIjbxY4DiQCSOA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8BFD1402F3
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:06 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7A310E028
	for <nouveau@lists.freedesktop.org>; Mon,  7 Sep 2026 15:07:48 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c20e70a0962so450407566b.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 07 Sep 2026 08:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788793667; x=1789398467;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PtaQqVSlZuFX18DeVPVqwMKwClza0Yn6Bnu05r8m2bg=;
        b=dUHzBfwvsVKZS9UH9LDI/ruYtFG0o38AYX/jfj/0khOii+ILFnQH+kKAAojEMyGZma
         8iXImFnxv16NtXAWO0lAjhqvmBzOU45jsozXHO/ld0e2Yd/nYau1llD9Puk/1ziAdTKu
         5sT+tl0RQoAxdWX7xdJsTT8u/0cS+f0wOOR+qYiMw9iEoumUYdRolNY1otcYN09r6eic
         INOoihd6SQ2hYQqjcTixDAiWBjqy5Y3AGQQ8fq6fv7vvKCv6eTozs2DvH3HhdMOxHKkj
         Vt8/BzHo/164O1LHed1yF7HeP+9jdlbs2giGzXnhPJLrIaw5GAN/tQLOnAiTPnmuZ2kO
         vnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793667; x=1789398467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PtaQqVSlZuFX18DeVPVqwMKwClza0Yn6Bnu05r8m2bg=;
        b=rxCOt7bgMHKeup2YVd1kvdVoQRhs5gzi4ecrdVYBmXISe43omHgkX5gN5ky7FpXvnu
         9oOI9qxAthg9GfjZUHpg1JAv2UlAV8GI0/7lzUwR++XSehoMA0xtG7bOlEMQE9+MXzlU
         RByfAA3QQjyHh17e2E7GJ8pBOBQrsVfheWg51vLww9eVYtsXm7vHss5WDKKpIiU/H0uC
         NUVnwJijv1Hsk5YEv1drx/+OUxijzvr5Rf7CN4dfq33quwCAB/FrP8vphzEtbNRbnTGR
         WdFK1q6756U2wHXFFdF+bbj3uWqN4WmEo/gdEkQNp3X5NrKBW9PqGnOcQ7yaVjNsvriB
         8Hqg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzJyL2kIMMJtH0kx3kihQIdyYeIJIIdbsFSc0SicCQP4UsdWZRu7DVzob8Pt8VcnBEbGwAF3b18@lists.freedesktop.org
X-Gm-Message-State: AFuF++ngTBqMGWrb1pxY28weI698dZNEEyqWjDK/OH12fKNyQQ2H2mBC
	lJcnjgc62D5Zty2gW6I434H8NrYvi8VUDFeHSRUT3f9Y0tD6AYyI6Ted
X-Gm-Gg: AYBFou1+zcmXOGcX9MH+/8YeewqCXBXLixEDz4IRe19L3lhE+Jb17GoLNX+e/R4xWDf
	g/12efNZBS6kyJgnOUm7w0cD6Y4lR+zTpJZ/ecC7/TZgMw7UutDrUIEjErg6n8dCG5Iwv88G5oF
	AmbtdxJ4KVfc27cPk0Dl8897xSnw80TKuqq3ZyfAnQVBmRzVk9VtxiwPd09oYc1GMRjapYPWmHc
	SZmqSkb7QmzxA0pV49pa1KyNZKLYKT6E4AINE3meDZOV4fWj5enaaPqN8eTWSDvJRjEc+FpSgB7
	6tD1Cl/RKX0UNRnn08kXu1Ns0tVk4pAJch4EEvsf4tQXk1AvD6y/FsDxOCQ06clx6sA4MfBZiaw
	8X9oPAqr/1ee2SS9DJIzTsLwPKE6Us21BhIh3dlM3mN67cFdz8w7RelR/n4HN+fEpYLMzrwuj7T
	ShE9348qG8aMjOmJ6bfSNA76lFdUgn0U3xnAkh800JZ+OgcvCb/ag/QpuA119M4pgYrCRHUdw=
X-Received: by 2002:a17:907:94c7:b0:c15:e8c8:340 with SMTP id
 a640c23a62f3a-c260cb54a27mr1562947866b.23.1788793666838;
        Mon, 07 Sep 2026 08:07:46 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d5773c5sm478376566b.40.2026.09.07.08.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:07:45 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: sashal@kernel.org,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 5.10 0/2] tracing/mmiotrace: Add NULL check for
 mmio_trace_array in logging functions
Date: Mon,  7 Sep 2026 18:07:24 +0300
Message-ID: <20260907150726.168416-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 
 <20260903-daily-reply-0001-re-mmiotrace-null-check-5.10@kernel.org>
References: 
 <20260903-daily-reply-0001-re-mmiotrace-null-check-5.10@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexevgmart@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: J6SOIWVSUF25VMKIBTJQK6JJUMBQU7JO
X-Message-ID-Hash: J6SOIWVSUF25VMKIBTJQK6JJUMBQU7JO
X-Mailman-Approved-At: Sat, 12 Sep 2026 02:43:35 +0000
CC: alexevgmart@gmail.com, karolherbst@gmail.com,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 mhiramat@kernel.org, mingo@kernel.org, nouveau@lists.freedesktop.org,
 ppaalanen@gmail.com, rostedt@goodmis.org, tglx@linutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/J6SOIWVSUF25VMKIBTJQK6JJUMBQU7JO/>
Archived-At: 
 <https://lore.freedesktop.org/20260907150726.168416-1-alexevgmart@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Backport fix for CVE-2026-80689.

Masami Hiramatsu (Google) (1):
  tracing/mmiotrace: Add NULL check for mmio_trace_array in logging
    functions

Steven Rostedt (1):
  tracing/mmiotrace: Remove reference to unused per CPU data pointer

 kernel/trace/trace_mmiotrace.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

-- 
2.43.0

