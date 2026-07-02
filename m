Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A05EC43458
	for <nouveau@archiver.kernel.org>; Thu,  2 Jul 2026 12:11:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DCD9710F31B;
	Thu,  2 Jul 2026 12:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="o2h14zEv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7E73546E4B;
	Thu,  2 Jul 2026 11:56:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782993385;
 b=Uw3frKz6d++nTumUerZwyL34mairx6s9uNJ/xn8r/zq6iPl+7eakPU3FMYFY+kP4QkYya
 S8z9IpkGYnCuiCTHmW61fkdNTyqzgb8GJvD3Qr2Rsggeruw2QSSl6/oGeakT8Z5LCrnbnFg
 KJWkLx/wr7PmU3nvvZKRqOXaGG4eDUcv/vkcM18wYEhfgLkmdwUj4AG8H54opT4oy9YRfb5
 dDtcx3LvpKt1+O2FJ8Y1SqgCMHa6r2vZqYbA0TQvnh0EgHrwj5SidtMtaxGmhVP2Wgc+4QI
 UTsnFlRpfDsYQtuZzkRy/XIu0eiJlRrwGCdrbuCZXbNhT096G0nO+6qoTAow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782993385; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=szYxJDyUXLwpHCPYtdT5QZRTamk7ohIwjDiVPC1pzUs=;
 b=zzGulDKIpb6siFFsepSLz1ynWcLl+JD6BhCn52L8mZb5Tps1nZh+g31ke74rXLwaF6up5
 onF0hsMYCIvdWLCozogxJYE98EX7l8MBc0R0POly7IW8205+euSNTynRQnqbbEZF5EdzREM
 p1AbdospEGDb1+ODS74SIWJna4piRvqqeebHFY5TP6MM23YYZN3pVID+KGBbaawm7RAO2Z2
 nCkiWElItN1ch/C/cVqzPj8kMXNxomuCUOv2EyIkPchFX6Ttr8z1GXbiv5hG5n1fCImiiX0
 7jh4NoHD/MZu60GkYpYRFuoM4NCNZVvJI7JUmOLcEmpTIoJZPhcej+z+xbFg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E579D46DDC
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 11:56:22 +0000 (UTC)
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EB4F510E4A9
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 12:11:08 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782994254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=szYxJDyUXLwpHCPYtdT5QZRTamk7ohIwjDiVPC1pzUs=;
	b=o2h14zEvKcQ49vaQ50LBNnbgHGGpFBTA0OsIFCWdpiUc7gYaraiUcJHgmdFM4mBzY7pBJH
	3Nawgn9WkBzIHxRb3Nw1H0UdEQI7UMwMGIksMhfoUjYHvm6uqPS5csZAIdTgWkWJ0NxwiR
	+fbu3PSBP2IvpsY/0wNqYNag0+1ZZPU=
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Subject: Re: [PATCH 05/13] mm: prefer mm->def_vma_flags in mm logic
Date: Thu,  2 Jul 2026 20:10:22 +0800
Message-Id: <20260702121022.49113-1-lance.yang@linux.dev>
In-Reply-To: 
 <3b4ccdc38819b42ddc79ee5a795831208ac7986c.1782760670.git.ljs@kernel.org>
References: 
 <3b4ccdc38819b42ddc79ee5a795831208ac7986c.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: WISQFF6EWBYUAYT4JNEOEBIWSRJOQKYI
X-Message-ID-Hash: WISQFF6EWBYUAYT4JNEOEBIWSRJOQKYI
X-MailFrom: lance.yang@linux.dev
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: akpm@linux-foundation.org, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, l.stach@pengutronix.de, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 peter.griffin@linaro.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, robin.clark@oss.qualcomm.com, lumag@kernel.org,
 dakr@kernel.org, tomi.valkeinen@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, thierry.reding@kernel.org,
 mperttunen@nvidia.com, kraxel@redhat.com, dmitry.osipenko@collabora.com,
 zack.rusin@broadcom.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, oleksandr_andrushchenko@epam.com,
 deller@gmx.de, bcrl@kvack.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 muchun.song@linux.dev, osalvador@suse.de, david@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, liam@infradead.org, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, hughd@google.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
 kees@kernel.org, perex@perex.cz, tiwai@suse.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, linux-fbdev@vger.kernel.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WISQFF6EWBYUAYT4JNEOEBIWSRJOQKYI/>
Archived-At: 
 <https://lore.freedesktop.org/20260702121022.49113-1-lance.yang@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On Mon, Jun 29, 2026 at 08:25:28PM +0100, Lorenzo Stoakes wrote:
>Currently mm->def_flags (of type vm_flags_t) is union'd with
>mm->def_vma_flags (of type vma_flags_t).
>
>As part of the effort to convert vm_flags_t usage to vma_flags_t (in order
>to no longer be arbitrarily limited to a system word size for VMA flags),
>prefer mm->def_vma_flags to mm->def_flags throughout the mm logic.
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>---
> mm/debug.c |  2 +-
> mm/mlock.c | 13 +++++++------
> mm/mmap.c  | 11 ++++++-----
> mm/vma.c   |  4 ++--
> 4 files changed, 16 insertions(+), 14 deletions(-)
>
>diff --git a/mm/debug.c b/mm/debug.c
>index 497654b36f1a..f0a354a9496a 100644
>--- a/mm/debug.c
>+++ b/mm/debug.c
>@@ -226,7 +226,7 @@ void dump_mm(const struct mm_struct *mm)
> 		mm->numa_next_scan, mm->numa_scan_offset, mm->numa_scan_seq,
> #endif
> 		atomic_read(&mm->tlb_flush_pending),
>-		mm->def_flags, &mm->def_flags
>+		vma_flags_to_legacy(mm->def_vma_flags), &mm->def_vma_flags
> 	);

While at it, one thing for later: dump_mm() still assumes one-world VMA
flags. That works today since vma_flags_t is one word. Maybe worth a
BUILD_BUG_ON() here, before that stops being true?

Not a big deal though. Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

> }
> EXPORT_SYMBOL(dump_mm);
[...]
