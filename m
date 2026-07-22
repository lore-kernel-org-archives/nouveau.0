Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC75C44536
	for <nouveau@archiver.kernel.org>; Wed, 22 Jul 2026 21:44:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAC310EEC7;
	Wed, 22 Jul 2026 21:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iPfZ3BS/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 157F347314;
	Wed, 22 Jul 2026 21:29:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784755762;
 b=LYO6h1CLRB0gi9Y3PZr7pr+rjJiDvHFZ+By4sFcfUkCdM1uelDg80xC32YJQaTAbUe1zR
 bpyXTLQ3ZZv3c37u7YMBZMGOidXtBv7AFg0zQMR4MEWf9maa6kqUu7qkBVKDlhVhIcninv+
 LPTqGIOFOmpUlM/7ZLM9uE/iPXXuqK1s2SjxYL2SToPxIDqKqsnGXlgOfCPIgh33H14+yKu
 UNHLB/Xi2YZgM3Ygxp/ztRZGEStN2gJ+qrcsWKvOOjWM14drFq2otWCmkjU74sG16YUTIM5
 Tibd5cwA4Fy2A7zL4UEr+Xls07iEshlDoBzKjOTN8H0LOJ99PTsbt51M7c1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784755762; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3cb8/RR6ht/AFgcmZ+ZVlj45R/ECVd/hJBDF8v5cizE=;
 b=rdUkhXOmn9kFU1kkqlSbLOXQokNVM3lATPLLTLKfFxpv8RhgbYavtk9KWtWOMUDzYf79O
 6+O9tLX4xbTIucOwY19La6Nvc3wdsiPvlM0fxvyOEeQ4RMEdEO2nUtwjH4nZ//+MFhWcSgo
 lPdYe+em9Yw5CWRDfRB6jNWZ0b+tholVtahzXzKSrvg3ICvSrpWZLO8A6Jp5ipNUD9p1526
 94TGPWGlk5Kh2wEoE8nzSgkrKzYVe2n2S9SvA5ByHQdbfgNusIR2aUXJkDF9ezvnTaepXjV
 ufd0Zp1YQ45RGZ364s0BTTNLRiABdV8WI8fPc/ge/N8AMiEMWvZ4zcoY8fGg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CFC31472FF
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:29:20 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 44FE210EEA7
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:44:52 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-8487088510aso13122677b3a.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 22 Jul 2026 14:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756692; x=1785361492;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cb8/RR6ht/AFgcmZ+ZVlj45R/ECVd/hJBDF8v5cizE=;
        b=iPfZ3BS/z4MMAI2RndVIaTOmxEJzsJ9fnXQ/9EjCiBpUfSR5FG9GF83IHFcaJC5T7Y
         TgzCPRF+5Mn9+u4LIT8hJU+jAvdiCIPx7LTmmPSMc/WsXDWQCKoI9/Gz/NrRbS7hzSEs
         z7FJFyQnmdtVgtSjSwum/WVKrcsHhF34Q5ICMkjMC1sqI+gg53rGdJJh1qwP0lWFDbsS
         H0s3UKlNkoyB1GCP+9LLiDzwM2/6VjmjrF4JZLPBWOvRONHe7EmT78qOaeW/QibMk6D+
         8Xkofns1GxbLNaDYwMJH/P7bEj9BFrYJWfjxrZyxDP72C1iBRfskgm+PSY0PRiDiMr+0
         Wzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756692; x=1785361492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cb8/RR6ht/AFgcmZ+ZVlj45R/ECVd/hJBDF8v5cizE=;
        b=Ss7VcnMphcL7ffEfkAiIqeN89on76gh2ZPQZ4+MJbf7x565a1Z+r9xZ6UsETj4mUV8
         8NTNXPH7BIj3lA9fq/z66nMDWBOwDTFaIqgl0Zro8hc8cfVhuHJ4hVFmpugCb7okHea9
         1HfjRv+dpotZUIUTwlumho8083W1bkINXlgeUiDvm7Bf9IlTEH6rdPpr7dvOTry8PAhb
         VLoQjNeEMLiyEHQLdDso4ZErcF9vVtv2ozbhgj2fv+EADC7OlNQkghZTpp3j6CHDYHiV
         Ibh8ptzBiC3o1M2KkHM8Li+ya2G9O3W88cja+9fq9cwe8pe49wgpAAac0RQBL9ERoU7S
         UI4Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RooY3RH0TQiCaLlD1ZqyN04GpaYyLjYI9rRpzI88ipGEpCFhR5z9dEZUSHcg5NPqiZiZIWRV3Mm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWusNtUV27ZbodXlk2Y8lR1xcYLP0yw5uT8CqVKMrgZe5ApCVn
	MBkJ77KhNK6nkmiicMXYyj+smj02pguRLoa2tYgyT675b0BfUFoc+TQL
X-Gm-Gg: AR+sD13+P7gZOl0EmGN3bQpPNOVHeteO+lwEYpM4roDTSdFTcWEndjkVOBsdhUAIqev
	IWYIPGaDjHBxvPJxCccVOXyj2A3s173eadVu4W0cqPwU9bfWCh6WSWVkoor7wGIqmX+hA7O786f
	9ODXo9m2Cp4K4hKk/Pzk1f7Fa6usjJil7D/Ra2rvjD4PmGXG6hkLKEKEG/hez2LEIxgF6MKC8Od
	wgG5yq4pkuLJwrQ4PHBcRyfg/OPZ5UhJFaYZWScivMthwACs2AsHeYsMDmcp6DREF6Sfo/PQDhv
	uRkKsjhpEE9z8jGeBBG9dZuYnjYK+5QIaklxV/Zi3ljXgjOwn9xe9pYL6vFo/T9Lieg9szVDWqZ
	JFLuExJx8spbGzxRR5KVUzlNuvjDXIF/5+t50wc8TKgF3LBacGYBRlrFw5XuasF9JMdA9gEZKUR
	wB+M8R/fWE+LtqaIDftmHIGqlKQBkREtF3BPH4TfOR9Cil5/s+/fZJzZFyj7U=
X-Received: by 2002:a05:6a00:39a7:b0:848:7835:bbac with SMTP id
 d2e1a72fcca58-84e2c230baemr657561b3a.65.1784756691553;
        Wed, 22 Jul 2026 14:44:51 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:51 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 22 Jul 2026 14:44:25 -0700
Subject: [PATCH v10 3/8] selftests/mm: add HMM test for mmap lock-dropping
 faults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-hmm-v10-v1-3-606464dd601a@gmail.com>
References: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
In-Reply-To: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, skinsburskii@gmail.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=9280;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=AMv7G8JGzmbmB+WwCDHthj1N45IFPqE+bBj6HkmdaG8=;
 b=jxDT00qgIp0eckAnCieFk/yrH4UjraxIJmUAkidlQfO9sY38TOaO5atlFw18CN2G75txgsawI
 w9ZNh/wRC0pA9t3+i2E84MWvjLWEgZoL8WEkW8uvNLBA7ijJ2Vro8vy
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: ZU3TS5OB542RIYUGJIVW4J66HMLFE6DD
X-Message-ID-Hash: ZU3TS5OB542RIYUGJIVW4J66HMLFE6DD
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZU3TS5OB542RIYUGJIVW4J66HMLFE6DD/>
Archived-At: 
 <https://lore.freedesktop.org/20260722-hmm-v10-v1-3-606464dd601a@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add test_hmm coverage for the HMM lock-dropping fault path. The test module
gets a new HMM_DMIRROR_READ_UNLOCKED ioctl that calls
hmm_range_fault_unlocked_timeout() with a timeout of 0, exercising the
unbounded retry mode while allowing the mmap lock to be dropped during
fault handling.

Add a userfaultfd_read selftest that registers an anonymous mapping with
UFFDIO_REGISTER_MODE_MISSING, services the faults from a handler thread
with UFFDIO_COPY, and verifies that HMM can read back the data supplied by
the handler. This exercises the path where handle_mm_fault() drops
mmap_lock and hmm_range_fault_unlocked_timeout() restarts the walk
internally.

Assisted-by: GitHub-Copilot:claude-opus-4.6
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 lib/test_hmm.c                         | 107 ++++++++++++++++++++++-
 lib/test_hmm_uapi.h                    |   1 +
 tools/testing/selftests/mm/hmm-tests.c | 150 +++++++++++++++++++++++++++++++++
 3 files changed, 257 insertions(+), 1 deletion(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 45c0cb992218..6205fb313bd0 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -389,6 +389,67 @@ static int dmirror_range_fault(struct dmirror *dmirror,
 	return ret;
 }
 
+static int dmirror_range_fault_unlocked(struct dmirror *dmirror,
+					struct hmm_range *range,
+					unsigned long timeout)
+{
+	int ret;
+
+	while (true) {
+		ret = hmm_range_fault_unlocked_timeout(range, timeout);
+		if (ret)
+			goto out;
+
+		mutex_lock(&dmirror->mutex);
+		if (mmu_interval_read_retry(range->notifier,
+					    range->notifier_seq)) {
+			mutex_unlock(&dmirror->mutex);
+			continue;
+		}
+		break;
+	}
+
+	ret = dmirror_do_fault(dmirror, range);
+
+	mutex_unlock(&dmirror->mutex);
+out:
+	return ret;
+}
+
+static int dmirror_fault_unlocked(struct dmirror *dmirror,
+				  unsigned long start,
+				  unsigned long end, bool write,
+				  unsigned long timeout)
+{
+	struct mm_struct *mm = dmirror->notifier.mm;
+	unsigned long addr;
+	unsigned long pfns[32];
+	struct hmm_range range = {
+		.notifier = &dmirror->notifier,
+		.hmm_pfns = pfns,
+		.pfn_flags_mask = 0,
+		.default_flags =
+			HMM_PFN_REQ_FAULT | (write ? HMM_PFN_REQ_WRITE : 0),
+		.dev_private_owner = dmirror->mdevice,
+	};
+	int ret = 0;
+
+	if (!mmget_not_zero(mm))
+		return -EFAULT;
+
+	for (addr = start; addr < end; addr = range.end) {
+		range.start = addr;
+		range.end = min(addr + (ARRAY_SIZE(pfns) << PAGE_SHIFT), end);
+
+		ret = dmirror_range_fault_unlocked(dmirror, &range, timeout);
+		if (ret)
+			break;
+	}
+
+	mmput(mm);
+	return ret;
+}
+
 static int dmirror_fault(struct dmirror *dmirror, unsigned long start,
 			 unsigned long end, bool write)
 {
@@ -488,6 +549,48 @@ static int dmirror_read(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
 	return ret;
 }
 
+static int dmirror_read_unlocked(struct dmirror *dmirror,
+				 struct hmm_dmirror_cmd *cmd,
+				 unsigned long timeout)
+{
+	struct dmirror_bounce bounce;
+	unsigned long start, end;
+	unsigned long size = cmd->npages << PAGE_SHIFT;
+	int ret;
+
+	start = cmd->addr;
+	end = start + size;
+	if (end < start)
+		return -EINVAL;
+
+	ret = dmirror_bounce_init(&bounce, start, size);
+	if (ret)
+		return ret;
+
+	while (1) {
+		mutex_lock(&dmirror->mutex);
+		ret = dmirror_do_read(dmirror, start, end, &bounce);
+		mutex_unlock(&dmirror->mutex);
+		if (ret != -ENOENT)
+			break;
+
+		start = cmd->addr + (bounce.cpages << PAGE_SHIFT);
+		ret = dmirror_fault_unlocked(dmirror, start, end, false, timeout);
+		if (ret)
+			break;
+		cmd->faults++;
+	}
+
+	if (ret == 0) {
+		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
+				 bounce.size))
+			ret = -EFAULT;
+	}
+	cmd->cpages = bounce.cpages;
+	dmirror_bounce_fini(&bounce);
+	return ret;
+}
+
 static int dmirror_do_write(struct dmirror *dmirror, unsigned long start,
 			    unsigned long end, struct dmirror_bounce *bounce)
 {
@@ -1572,7 +1675,9 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		dmirror->flags = cmd.npages;
 		ret = 0;
 		break;
-
+	case HMM_DMIRROR_READ_UNLOCKED:
+		ret = dmirror_read_unlocked(dmirror, &cmd, 0);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index f94c6d457338..ea9b0ec404fb 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -38,6 +38,7 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_FLAGS		_IOWR('H', 0x08, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_READ_UNLOCKED	_IOWR('H', 0x09, struct hmm_dmirror_cmd)
 
 #define HMM_DMIRROR_FLAG_FAIL_ALLOC	(1ULL << 0)
 
diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 6fccbdab02ee..5acb728666f8 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -29,6 +29,10 @@
 #include <sys/mman.h>
 #include <sys/ioctl.h>
 #include <sys/time.h>
+#include <sys/syscall.h>
+#include <sys/eventfd.h>
+#include <linux/userfaultfd.h>
+#include <poll.h>
 
 /*
  * This is a private UAPI to the kernel test module so it isn't exported
@@ -2952,4 +2956,150 @@ TEST_F_TIMEOUT(hmm, benchmark_thp_migration, 120)
 					&thp_results, &regular_results);
 	}
 }
+/*
+ * Test that HMM can fault in pages backed by userfaultfd using the
+ * hmm_range_fault_unlocked_timeout() path with no timeout. This exercises
+ * the lock-drop retry logic in the HMM framework.
+ */
+struct uffd_thread_args {
+	int uffd;
+	int stop_fd;
+	void *page_buffer;
+	unsigned long page_size;
+};
+
+static void *uffd_handler_thread(void *arg)
+{
+	struct uffd_thread_args *args = arg;
+	struct uffd_msg msg;
+	struct uffdio_copy copy;
+	struct pollfd pollfd[2];
+	int ret;
+
+	pollfd[0].fd = args->uffd;
+	pollfd[0].events = POLLIN;
+	pollfd[1].fd = args->stop_fd;
+	pollfd[1].events = POLLIN;
+
+	while (1) {
+		ret = poll(pollfd, 2, -1);
+		if (ret <= 0)
+			break;
+		if (pollfd[1].revents)
+			break;
+		if (!(pollfd[0].revents & POLLIN))
+			break;
+
+		ret = read(args->uffd, &msg, sizeof(msg));
+		if (ret != sizeof(msg))
+			break;
+
+		if (msg.event != UFFD_EVENT_PAGEFAULT)
+			break;
+
+		/* Fill the page with a known pattern */
+		memset(args->page_buffer, 0xAB, args->page_size);
+
+		copy.dst = msg.arg.pagefault.address & ~(args->page_size - 1);
+		copy.src = (unsigned long)args->page_buffer;
+		copy.len = args->page_size;
+		copy.mode = 0;
+		copy.copy = 0;
+
+		ret = ioctl(args->uffd, UFFDIO_COPY, &copy);
+		if (ret < 0)
+			break;
+	}
+
+	return NULL;
+}
+
+TEST_F(hmm, userfaultfd_read)
+{
+	struct hmm_buffer *buffer;
+	struct uffd_thread_args uffd_args;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	unsigned char *ptr;
+	pthread_t thread;
+	int uffd;
+	int stop_fd;
+	int ret;
+	struct uffdio_api api;
+	struct uffdio_register reg;
+	uint64_t stop = 1;
+	ssize_t nwrite;
+
+	npages = 4;
+	size = npages << self->page_shift;
+
+	/* Create userfaultfd */
+	uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
+	if (uffd < 0)
+		SKIP(return, "userfaultfd not available");
+
+	api.api = UFFD_API;
+	api.features = 0;
+	ret = ioctl(uffd, UFFDIO_API, &api);
+	ASSERT_EQ(ret, 0);
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	/* Create anonymous mapping */
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   -1, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Register the region with userfaultfd */
+	reg.range.start = (unsigned long)buffer->ptr;
+	reg.range.len = size;
+	reg.mode = UFFDIO_REGISTER_MODE_MISSING;
+	ret = ioctl(uffd, UFFDIO_REGISTER, &reg);
+	ASSERT_EQ(ret, 0);
+
+	/* Set up the handler thread */
+	uffd_args.uffd = uffd;
+	stop_fd = eventfd(0, EFD_CLOEXEC);
+	ASSERT_GE(stop_fd, 0);
+	uffd_args.stop_fd = stop_fd;
+	uffd_args.page_buffer = malloc(self->page_size);
+	ASSERT_NE(uffd_args.page_buffer, NULL);
+	uffd_args.page_size = self->page_size;
+
+	ret = pthread_create(&thread, NULL, uffd_handler_thread, &uffd_args);
+	ASSERT_EQ(ret, 0);
+
+	/*
+	 * Use the unlocked read path which allows the mmap lock to be
+	 * dropped during the fault, enabling userfaultfd resolution.
+	 */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_READ_UNLOCKED,
+			      buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Verify the device read the data filled by the uffd handler */
+	ptr = buffer->mirror;
+	for (i = 0; i < size; ++i)
+		ASSERT_EQ(ptr[i], (unsigned char)0xAB);
+
+	nwrite = write(stop_fd, &stop, sizeof(stop));
+	ASSERT_EQ(nwrite, sizeof(stop));
+	pthread_join(thread, NULL);
+	close(stop_fd);
+	free(uffd_args.page_buffer);
+	close(uffd);
+	hmm_buffer_free(buffer);
+}
+
+
 TEST_HARNESS_MAIN

-- 
2.43.0

