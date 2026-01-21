Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EE1C44536
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 18:13:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C9C3810E854;
	Wed, 21 Jan 2026 18:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="va3Wo3uc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AF600401CE;
	Wed, 21 Jan 2026 18:04:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769018656;
 b=0emzlzy59L1UEItfEHoJQlKIp3v0iqoJiCjpiMqvXlzVIIOepPhFL0EKG/BFkq0XBtlzn
 4iL10Zu71AjKUMjy+daBGMcrjnIrtgbW8f8wahzgWMsDZ6seixTyTElgeF9uIX3AaMs15GH
 i0pmsuaTmG+M+tz94y0Dmid7xTXebTnyZCOdaPNXv7QRxrF5Ecz0xtEDnas1acyBM2yRjWY
 W8hp6WiJ1qkCK3lnXsBsH1O+MGhPShpxVDlaTy1+DH3ekosRJydlAeM2FUwuue2ANmPj3pV
 100almX9rf4jqy40bzHJpbmaBzoxT7qhnGiynbe6w9S2t4vipBBgqZjeRx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769018656; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=odBgMeGleRPkwApB129VpN2tHRH7cELn9wuHglowA3c=;
 b=x42OZPffCCrdiu1zB92qjYtJ9Go31wtRKpwPIJF8WkVFYdKYFZkMpJ1cN91HkIKCju6XD
 a/m5EEyqdvWzvC7CzoeIVQdH8YbRS4couNjmfNqljlmjik8POfefXHYTC3pomZUU3pX3COs
 RuXXbWYQyESqNpE15V6Xlxp2g0yC2Dj9vObIx0LQDlo1RbWCmGxk+kt42mDv30qc3EV2tcs
 ILAhArbQyHEd+7uiflT3Ld1AX2YXLHY7L0cR+Z+9jAg7B8/GZ14fmD/YZNHqb3SIL7yp7f2
 JH6gjRlTEMrkeO9WdQ8MFQibgr9DcczYDIfK7oWNR/W+QRTfchddvvUZdP2g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=joelfernandes.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=fail header.d=joelfernandes.org; arc=none (Message is not ARC signed);
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 94A89400BB
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 18:04:13 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB6D10E852
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 18:13:00 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-8c53198a65fso9616785a.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 21 Jan 2026 10:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1769019179; x=1769623979;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odBgMeGleRPkwApB129VpN2tHRH7cELn9wuHglowA3c=;
        b=va3Wo3uc4PCH9CBrnqiRI4nd8mCaa1V4xh6Eb1Ixahcv/Y1G/cJskLPUutHYMn+LjN
         D3U9jbUClVAkqVeqTw7xf8y3RS8NPpvKQnmSxRjuzy52kUBb42r6DAyZN8x+1p/gpMAI
         DCGKqE9S/PRZXdxT1TEd6Rrnr1sA6t7PDxkCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769019179; x=1769623979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odBgMeGleRPkwApB129VpN2tHRH7cELn9wuHglowA3c=;
        b=UPosRpIuX7XkN5Tigv7PLESfsPGb2ja+F06JvHbXKzPeRVwNfZlargSN0E5bXI2VrP
         SpOwbVRT5o0xguPrTGCBhuKvvN2v/M4zHX027UkBOLI1lL57TzKJWTG5xJ8pT7sv8+3T
         aKANex95Wfd9NCFGW52bT8YXZ09Dl+Ng7GExW2wZQQiVnzMw4LwWHKaz38qWWftni5Xq
         4k/18YBXyCw76F3nM0x8mBdqFyT88upzZUXzCD9/f581NOk/BE1Vj9+mkDktA/BbwRvs
         1ma9B6gJHaSNqo+mPE7qLlRk8j4qMqj9kmrq62lftCySjWS9CK6ojYOBet6kQs7BQSEi
         iizQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+aBr75/iJMOQtdK5dsmoVp9OgIlN9MAnwzNOhChFSWpzeQXT+eBGUd1MP+7UQNt7WfHDierNZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxA+YkBZ308/PfUXAIJeQ1WbF5isQdeQHZ/ErEi1jJS4viwiX3
	HaWDu5Ci+NPCFil7utDX7zrWsrp0NHBmVhGa+WhjlslbBulIBSptE9kBrhJM/XKIoM8=
X-Gm-Gg: AZuq6aIndIl2TzRW0t4IDT7YZc64RRwvd1wskt7QQMLadk9E9jCsry/eCL1FAN805zG
	Le1Vo7EKXqlCTJMQdPHEYoEjttAjYNakjrk8whR+t7z6Z+YA5L8onorRu47j5WhXeVsMYv13m8j
	0PEjXHPLRF0QZfekKACz2z3OfB1GzOtN14hHw8cwDlP4LL3Rr/17zeDa8PdN3WdM8g4nJAl5VpN
	qXMMdTcag6fUuBW9ujyaSIc3aMEouAXeJeOHGaXQ8K2CXtWBwo8llrw/TicM45Th/rCEbf8cA80
	NlYkYiqqfcMHqWiKm8O1IwVH7mh9rCv/TmPjebFqxLPm8TM4Zcc5ah4wA3TonUzqAtTPnmNNRGT
	vFGBZQ019Gr3qUYhRaP6QOw3niDG95LEGjWIuAoFZg1UIiBhQYgKTLM6vaQkz+lVic//h828ACU
	K+RsPOIGPpz/dkSuaFZ+BecELSLw==
X-Received: by 2002:a05:620a:2d90:b0:8c6:a790:cd09 with SMTP id
 af79cd13be357-8c6a790cd9cmr1883910285a.40.1769019178697;
        Wed, 21 Jan 2026 10:12:58 -0800 (PST)
Received: from [192.168.0.99] ([71.219.3.177])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab288sm1356284885a.6.2026.01.21.10.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 10:12:58 -0800 (PST)
Message-ID: <237f94cc-dde6-4d91-b942-4854e62eeebb@joelfernandes.org>
Date: Wed, 21 Jan 2026 13:12:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 01/26] rust: clist: Add support to interface with C
 linked lists
To: Zhi Wang <zhiw@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-2-joelagnelf@nvidia.com>
 <20260121092730.3628d290.zhiw@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joel@joelfernandes.org>
In-Reply-To: <20260121092730.3628d290.zhiw@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3PO5G334RPLBESAXT5LFZLZHIF2NTY2X
X-Message-ID-Hash: 3PO5G334RPLBESAXT5LFZLZHIF2NTY2X
X-MailFrom: joel@joelfernandes.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3PO5G334RPLBESAXT5LFZLZHIF2NTY2X/>
Archived-At: 
 <https://lore.freedesktop.org/237f94cc-dde6-4d91-b942-4854e62eeebb@joelfernandes.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 1/21/2026 2:27 AM, Zhi Wang wrote:
> 
>> +/// Initialize a `list_head` object to point to itself.
>> +///
>> +/// # Safety
>> +///
>> +/// `list` must be a valid pointer to a `list_head` object.
>> +#[inline]
>> +pub unsafe fn init_list_head(list: *mut bindings::list_head) {
>> +    // SAFETY: Caller guarantees `list` is a valid pointer to a
>> `list_head`.
>> +    unsafe {
>> +        (*list).next = list;
>> +        (*list).prev = list;
>> +    }
>> +}
>> +
>
> Might be better to have a C helper? since INIT_LIST_HEAD() has WRITE_ONCE()
> for memory ordering. This one seems not equal to it.

WRITE_ONCE() is not really about CPU memory ordering though, it is about
compiler optimizations. On the C side, I think it is needed in case of
list_for_each_entry_rcu(), to avoid the case of invented stores or store fusing,
but here we are not doing RCU-based iteration.

Anyway, if we want to future proof that, I am Ok with adding the helper back
(which I actually initially had but feedback from past review was to just inline
it into rust).

But I am not sure if we have this issue for the Rust compiler, like we do for C.
Rust does not allow raw pointers to be concurrently read/written using plain
accesses, so should be already protected due to the borrow checker and compiler
itself right?

Adding some interested folks as well to CC for the topic of _ONCE, +Boqun +Paul.

--
Joel Fernandes

