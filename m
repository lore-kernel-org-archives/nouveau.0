Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EDF606A31C
	for <nouveau@archiver.kernel.org>; Tue, 10 Nov 2026 21:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4H+xSTx
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C3F2910E951;
	Tue, 10 Nov 2026 21:25:36 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8329449202;
	Tue, 10 Nov 2026 21:05:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794344759;
 b=mUfExTHMtTr9y8DKd7ATLgj+eQTNKJ/NlrYZqKigdkZ78P9Si5vUTSmKUpy15nKwz9Yev
 18I5tZYmOfDwZ31Nm9jeaVbefNst/CWfejhw8DvcNShWcJe5HZQ/UazQ8PHuMfdSCIeUH+N
 7Ss66PiXjN71ohS9KR20H2s9VJq5x6U/5N4HA22QSsjfk7HPDXxXylYbEJ+5kR8p8h1FVLn
 UyK90t4KyPV9V8moCDHd9WAkSHo6i186UNiBu9CdaouYyIjeQMRlQsrjVaugZS3VhABXCiD
 dybfvfpBrpj3OjF5kDQ22Avxj5heda0UIM0hFEr7iPW5wATYbfv/rZ7FCMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794344759; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GPeUEpbxZgN6b6poMbqb4po1OzKA7uw1ryiUgB0GJGA=;
 b=nLHX4ipqvIvJxZUdlMPTePEom7j0gh1HqECDNOj42Qn1w8Luj3BWrV69MHOXwNhzpZKT+
 V28DOBmu7SYuIMNGDS63+zv4i/akD1BMRahMVhTCdJbCGpucQ1eYHhmvNaTjbz6mebms5QJ
 EdBnkqaVwY34XVrXEl0sip4y58s8XHIAD/R1KHplztR5Lz7wIKLMptL2GBs9Jjv9BUizIK5
 fHHJIhes0jKCDtVkE0HrqgSDX3nTJ4uaNvqkXUrg9nnYHHVYmA0bPIZPjKHWUfQpVVjwWZi
 ujNomQDz+OVoNsp175uo9S407WK7C2zbGnSi3a/3X//YLUJhvk/Wswt0rxGw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D31B9491E7
	for <nouveau@lists.freedesktop.org>; Tue, 10 Nov 2026 21:05:56 +0000 (UTC)
Received: from mail-oi2-f3.google.com (mail-oi2-f3.google.com
 [74.125.231.195])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F3D4610E002
	for <nouveau@lists.freedesktop.org>; Tue, 10 Nov 2026 21:25:28 +0000 (UTC)
Received: by mail-oi2-f3.google.com with SMTP id
 5614622812f47-4af85d1cb34so265895b6e.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 10 Nov 2026 13:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794345928; x=1794950728;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPeUEpbxZgN6b6poMbqb4po1OzKA7uw1ryiUgB0GJGA=;
        b=w4H+xSTxK7si/LkUOQWpb6s62zExCQZW2sQH1HPkcBBd0CJXXcJ45jy5i1dzhBdOmY
         dhLDZsdzYDDFNMfmxdhVjEt5LxVCISYI6/kfIUvnWBVMpOvQ+22eyOqqFe5shB5Uu7Fr
         23z44UB+wMuD5EZ0tDl7WBRYOADybu+4AXPFiIA47lG3uP7cYBbVzzJtQN0tzIGyatNs
         L2WuRnOezHBWdIfv2V8p8DB6rrB8nGGLo4VBzSUP+IN7iWmNKijDWjnrot/ElWSPJXCK
         UOkSl7Qtd0V81uQUN0D5wg0boIT2/wJpldLZ3WwjZZZzwcf19aKi7RrUTh7/ktn+VTk3
         xmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345928; x=1794950728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPeUEpbxZgN6b6poMbqb4po1OzKA7uw1ryiUgB0GJGA=;
        b=IaD20dVsRWrVoL8Wxg24BnbmA0pZIVvl9rdciLG4eIXLjUCT1D3FqM9sBMZ4ZAH/+0
         aN472IlKU3FbtYHWA/UAeyoU+N0vjz1dHB5ANRDZwhLEHmL6Y2ghYqU8XhnzOEid4pUR
         5Vn15omj34Sj5j81vs12psqBtfEaPEDLjYugzXDq4Dwn7KxYOrzHEfGlQD+I8HbJUI1v
         LZcFIDvi9vVi/utMKPtSowt+o4yCttgeEEQCzCMP3cDJR+VeSq4Gma/nOjMMD6iP579q
         R/EjkrXuUxQqMyGhi/Oz/PXqWn8hOLlf6UtUFk+uW4NDfiGrmiI7+ZPwEZbLi7RngtvD
         JMdQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEartq3tpp54Oq8mQtx4JRYbF8XeOegLBFncMq4psphwDudeyl7X3WQP9dVzuO/8Z0Fl3u2XKex@lists.freedesktop.org
X-Gm-Message-State: APuU4Z82kGrasE5kE9ZGVYKLwEU71YJbhZlVa5t/us+15VNMZXOMgzbP
	O4oNDnL3hjLieOgujIsEp4Aek1/6Eo523rh30cpfyn0R+xqpLnNNXfYtjLdrFEOCtwAQFQ==
X-Gm-Gg: AYBFou3LSTU39FhLU3RLdlZ6GaKTe12fhVGjICSNL9RQELDfdExF7010Me6vqidrQLV
	VNEs7gNiEq8z5X9ekKc84hOtk5d7tfGjWolPldca1aGkj3nDqC03aNRf3QGMpklfdLf4rEbXAxS
	Nhp3PtMMW7XsTdXFr17Q21FEBkrf/JLHbuei75dlM+7pD1pYkARVK9/Yb991kcqLlTDOaiXfNuu
	c266XvzFc+dCc6CDRTedOQzqSJr6YoOUHVjqfi7PclPY8pDKmfm32f+IE3wM6IS+4CajhMTyiOv
	aARPi427S8BtO8ePGMy64K6l7Crz4Z86iauqdUz1lhtsJsHI7SzEccBDBR4ZZxkcguPduQo6pUB
	sB/eBE6LHzl2Itg1GDm0g6n3En+p8gVjwND9i2qerz5vLk4OPFxb0zsy2rySS+4SWuEuM9EOG6Y
	PhwqmFGNWXHrDmQao5EC5UJwMs1pJyYlzKaKpRPOO3J36rhPYfYnpbMVG8dNKlXuCNizr+zQdcx
	c3Ld3n0ztC+OSY3miobCGOMnWxdhcwQ4XFgoTAcYu7jC9UpFMlL0EPQfFnEwD1JSE8EPi2YLsV4
	eKvAXFoINWYz9RlJG5MS3rVNip+qn6HFWyXz3AUDTjuWlcBw3pJO1GtW9uh+FW5se6M=
X-Received: by 2002:a05:6808:15a5:b0:4b3:3e1:499b with SMTP id
 5614622812f47-56b96294badmr126559b6e.6.1794345928215;
        Tue, 10 Nov 2026 13:25:28 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id
 5614622812f47-5690504c276sm3233400b6e.4.2026.11.10.13.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 13:25:26 -0800 (PST)
Message-ID: <01f512c1-84ea-4443-99c5-f6c30242d4bb@gmail.com>
Date: Tue, 10 Nov 2026 15:25:25 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] pci: Add broken-GPE quirk for some Lenovo Legions with
 Nvidia GPUs
To: Bjorn Helgaas <bhelgaas@google.com>
References: <20261110-broken-gpe-legion-v4-1-c672bb1c4d91@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261110-broken-gpe-legion-v4-1-c672bb1c4d91@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V23J2UYOSQBLFGQDNTSDJHL4PGH367YQ
X-Message-ID-Hash: V23J2UYOSQBLFGQDNTSDJHL4PGH367YQ
X-MailFrom: ryanbrue.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/V23J2UYOSQBLFGQDNTSDJHL4PGH367YQ/>
Archived-At: 
 <https://lore.freedesktop.org/01f512c1-84ea-4443-99c5-f6c30242d4bb@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

So sorry all, I accidentally double-sent with b4. Please disregard this 
duplicate.
