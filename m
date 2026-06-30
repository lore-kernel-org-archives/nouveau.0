Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6971C44501
	for <nouveau@archiver.kernel.org>; Tue, 30 Jun 2026 10:24:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9FE10EC31;
	Tue, 30 Jun 2026 10:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icQ/wQmM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8187446DB0;
	Tue, 30 Jun 2026 10:09:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782814167;
 b=CmbvAPWQrQa4rc9IMp6JM5kud2f0zgI/UuOlTPeUlE1YJ3UmGa+zQqTw4SqCGNy2gUCo8
 iXdCGQtv4OS7f0HHQDTyY2GHpj5urkqwDHM4Szk83Jm2zGGQNRR8fjY2HEisjNvpzTIw2wr
 0XB8LQdLkrMFkKu8N6uoZhOlOkcdNcBQq/gjzreNTutsHJvMbFQGJVMinBDIm95YqFleFCA
 /b0MuEhB7lyQ3+onXW9dgnNgLrN8JYoMwJ4IXsFDWLik1Ni4kI6KKdepGyMuOZKHBHaebQL
 tx7kRdzi2eufBNJLwy4saxmN9it3xlmXYj+6RK03sI1VMsVzokxF50PxZ6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782814167; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yYZN8QcmTZB0XuTqOpasOlloDru9xfoOYzlyz+jRrVI=;
 b=i0WMUSgGDruNJOFtw3ttTZBdWEYm3RfQi9QDV4MHhBAAnV5wklYF6+1UGygODCBAoJnA5
 BRIUOUH8nkNO+i2jmRdKeobZoBHTX1xmDpc8llXQIDRNyUKE9Szh30F4JZdfVm9cFV9yCpQ
 VnMF55WQUmYQ8f+mM4iQIZ9Ym0V13WYu4+Vv79LzQCIDzrpBwK8FthHLVHG60OseIJSX7iN
 MDDquSCTgfnJADa81WiuV81ntLb78n+g/cQnSkaqVbtORE96LKrbvNTLoZGXI+7KiKvYNYM
 JsKlOxcbqXuJye89L27DAE1MSVKCsDlHcnTM9LvPfROqnSb923mvaCeatxMQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CC597400BB
	for <nouveau@lists.freedesktop.org>; Tue, 30 Jun 2026 10:09:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9C610EC21;
	Tue, 30 Jun 2026 10:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782815045; x=1814351045;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ktunQaDDS5EVOVO47fVPmptPD5p+avnAGjEgEXLkbp0=;
  b=icQ/wQmMyVZEeQ41y0s/RD11IysL84RlqYL/arY/vH1/dWVzn1+QLLrf
   ueBMWmMjezVhy+WaJXO+3iNQGGIcbJzXI6eieapAM1kBIjGjhhVCaXSQm
   TOdxhxZcTJ6IN/W0mgmM+fsTXj3LXTIHco9RasSd9cPj/qGSeyCO0W2Wz
   KbLi3LZ7d4xjSij4MOQWw89C0LFz2W4TDpD3vv6oGlWF6PGxSVzs/7RtK
   R4U6BszKlVT+/8x5p+jGiXmDLemCjiVPuYg/rmmaXKWDznfJUbi98POac
   d+XGxySUIzljPn21oJFt6BBAIK0pXw+4U1qaOJf6g5aG7EdN+AsAIzC0X
   w==;
X-CSE-ConnectionGUID: iWFeh17OSmqppQDgk2FCwA==
X-CSE-MsgGUID: gGh6se85QkG9MuO9q2JroA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83581378"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600";
   d="scan'208";a="83581378"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 03:24:04 -0700
X-CSE-ConnectionGUID: jgq2xSQuTZCC6QLcUYS3Dw==
X-CSE-MsgGUID: Tgh3e1tLRQ2N4h0xSzOsDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600";
   d="scan'208";a="245877673"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.148])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 03:23:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 08/13] mm: introduce vma_get_page_prot() and use it
In-Reply-To: 
 <3bb8bdc4788230c33102166d56cbc5abfad9d4cb.1782760670.git.ljs@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1782760670.git.ljs@kernel.org>
 <3bb8bdc4788230c33102166d56cbc5abfad9d4cb.1782760670.git.ljs@kernel.org>
Date: Tue, 30 Jun 2026 13:23:44 +0300
Message-ID: <d6d75626287ddd46d7da136cf013f7b21b1afc06@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: X46MQSJO5MV7OBX2V6JZKVMUQ7DUUWK6
X-Message-ID-Hash: X46MQSJO5MV7OBX2V6JZKVMUQ7DUUWK6
X-MailFrom: jani.nikula@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Helge Deller <deller@gmx.de>, Benjamin LaHaise <bcrl@kvack.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Kees Cook <kees@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-fbdev@vger.kernel.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X46MQSJO5MV7OBX2V6JZKVMUQ7DUUWK6/>
Archived-At: 
 <https://lore.freedesktop.org/d6d75626287ddd46d7da136cf013f7b21b1afc06@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 29 Jun 2026, Lorenzo Stoakes <ljs@kernel.org> wrote:
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c    | 12 ++++++------

For i915,

Acked-by: Jani Nikula <jani.nikula@intel.com>



-- 
Jani Nikula, Intel
