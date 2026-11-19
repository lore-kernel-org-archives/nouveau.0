Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE9060A261E
	for <nouveau@archiver.kernel.org>; Thu, 19 Nov 2026 01:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IIJznSRG
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BBCB111211C;
	Thu, 19 Nov 2026 01:38:53 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C405D49576;
	Thu, 19 Nov 2026 01:38:50 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795052330;
 b=W3h+g+QpOrLQGwdNS8zrevsUNkMXjZGk5WUzaEgj/dBB/iqVnttj+5sQLH4pRrM8xxX8w
 NExhyk3llHZWD0jEL4Z4ri1WZJ4UArlLxUg268Ob906eJRMzNuJTXiSMP5Jw4g2I4ODQ3NY
 UGaSIdK84xiOapl2YiIJMqLt6UK5/ocgTj+d4SvDcqgPYxBtj/zs3OwM00OtVNjMyVl5Hyj
 pQ2b9Hk3fNPcN5DCQkLdyXxNMuLBzYzWlLVR6VMBH4xY0suPtuTJBLxqd/iPgsR9Mx4jpF8
 NTHOq8tAViY+XlHN8M0Tzk0tLmXZDdOeVhAkqM9aGpHJ9ASTvf8q+7OsjqWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795052330; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rI5J4e+jl313IOqx95XsuIYz/FkfwZY75b5jsYC5FCU=;
 b=GTkAoIwr/0VjBFqLzDrHSBRKcCy8hvW5uRscS/rfoHWH4JqPQXA+7VjxXnnt3nqICosnJ
 E53YwpIwwsmJCiKhDSUbrJjEcGz5+f0bcnOlcxtrKUrqFK7sGGehToRzoYc+PUJEXyycm6F
 rQUMI7w3NPY1VSOlNH3atY8tu0QcwZ2KMfV94UBR0qudIjLyt2O4bKxHpSj0s0Q6CQH1Qfw
 h6ANMYlaYmwW6kg9CEsAZA/aMohQAdoTGMsGlaVLqsUl+lMuNjSVS1hL+TuEDAJRnfDNAGS
 ywjgBPv6F+Gatd6CWbwRhoI5sDY2MafJsIOWppcLG74NKOmLtb/v36Ok8vKg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=kernel.org policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A801F47E7C
	for <nouveau@lists.freedesktop.org>; Thu, 19 Nov 2026 01:38:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD8311210B;
	Thu, 19 Nov 2026 01:38:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8186A473A5;
	Thu, 19 Nov 2026 01:38:42 +0000 (UTC)
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795052322;
	b=uQWa/BllSq97FP8CHCc9R9cKczBXLtK+wcQCutMAG4vz8HFZKqYb7lj12vEZ8v1zJlEB
	 KRTME5f7P9ICLwQeejeCxLlR282dyftaU67/oYBgV7SpInpcFBjYYmdAz1hlwsLmkjwT1
	 vyvmNvlsmybra1fctq6OQHX31ELG17HiCTuDI5plAF5yBtwHH1uhc8IIQiTqqt1R/djB2
	 ovI42WphDGUEX/h+rr1CFuOwa6GtJsqp4A7lGfBmhZeiQptdYN4dtPL7WpcMMoi2Jojg3
	 Uh5w5zwwNov77/ak+3kZ+UXkz3VWmanUVScWOZQ3P+2kIVr76BjqZVww03pQqMvuQWA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795052322;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rI5J4e+jl313IOqx95XsuIYz/FkfwZY75b5jsYC5FCU=;
	b=g/B4/AnUCML36vND8ypp1YHp7E3yxosME46IJxqo1uZb7PKfjLJOinLuUdMS3gXhVXwD
	 90/5fGOAnVFuy1itdkViF/nH/hdduljOEq3VkaVNSgXOZ/lZVUIm6hEidaMjhXTPnAZ6/
	 41WD/La/IA9dStlRyQ7DD8TRTXd7B57txAFV6O1tUT+9jyRAQywSxBZbqAvf014c/rm11
	 hfX4wfyrJcZcunrDSakepIGrGhfgJJDr7YmRTLxE3Yiw4wd8vpP9lDquUXvA16SCoEaaI
	 9qWzSuZO9VSm01yqoR+9WXAsB86BMBhWCvNJJPFIN5OvyDDZI4z9vRpvtACrieor84Q==
ARC-Authentication-Results: i=1; smtp.kernel.org;
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest
 SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E73191F000D4;
	Thu, 19 Nov 2026 01:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795052322;
	bh=rI5J4e+jl313IOqx95XsuIYz/FkfwZY75b5jsYC5FCU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IIJznSRG57QxHTinULVngGuxUbbUX3z1rLelJp0CppWtJ5OTie6cgsOQ6zK1SZVSp
	 iDsU/HhrsxHEms1pukUeyPg2dqGG+5hIYQyF9rLmOP5Kdh2gDzVd5ipjJzMeqkhpSl
	 D3/H2K3WeJJAVhyM5I1Z2ETAzuHEN5xkRrDjIz2LgkzWtB7L1w4l8VO9ajU67ml54H
	 Sles3EYmJje8k/xnkKIobuB3F6flzA8B0gRMWZZ5HYMPZlQemLrQ8tM8pIc3/GSO+w
	 sy/xPtl9avjmq+nYJgyiA4b/c5NyoXvL23Y7EZ9FW2nOj6PhBZYbdN1mmBjLLI+tuL
	 s9eAGmfEKMIXw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6CD084B076;
	Thu, 19 Nov 2026 01:38:38 +0000 (UTC)
From: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>
Date: Thu, 19 Nov 2026 11:38:25 +1000
Subject: [PATCH 2/2] nova-core: only bind to GPUs when explicitly requested
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-nova-nouveau-gsp-v1-2-4cde2bc41132@redhat.com>
References: <20261119-nova-nouveau-gsp-v1-0-4cde2bc41132@redhat.com>
In-Reply-To: <20261119-nova-nouveau-gsp-v1-0-4cde2bc41132@redhat.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3985; i=airlied@redhat.com;
 h=from:subject:message-id;
 bh=tAQawDxAoDVy9T/tpzUKnFBJoDTpZdV4IbSYyVDHzFY=;
 b=owEBbQKS/ZANAwAKAQx081l5xIa+AcsmYgBq/lMd57L02W7/SQMsckEBJGwtlCCow0jKVoT6U
 TngXOQGeoyJAjMEAAEKAB0WIQQQptkdobBb0p9t66wMdPNZecSGvgUCav5THQAKCRAMdPNZecSG
 vtEmD/0U7lQMvVK0HDSs/jb2+nehujS7xZTZW9fM31DRbtTHzhS+As2mtLVuIqMEuGX1GmP9gsV
 qE5odE5j3WI6PZLpGW5+FWuIzoYBGXekjMdmU2vrj4CagK8U7xNV8ormFwCckX/DAL2m/U6hV+h
 89H8M43wKVwSz6iX/Ki77bYR0OOSwI/cX85rpYarS1BW2Khl9P9/cPYiGEHvnI19ZTRISmk/TYO
 RP1bw2oK316FJdY3e7JRHrQMn6wOkH4X5gAfTqo+A6USQdvLcEud9pu3UOBvBDmnk0J7egCXK1A
 xIRucj1u9sRlssDXC1MCjTTrp4WugMx8+ePD1pxBLstIWFzr4nZbO2UENMqbPopnJ1gG+xIfw3r
 SC4Tgp74vPFutYscTS31/T4en30WLZi6zFt9vrGfc4DHvhrz3ntKpT3oEX4m5yoxfNM4r/WmexW
 zmtlcJo1IBNPCxoQDMu+2o/9c3NTt/AlxBOYTrqLh/1Qn71gxcm7GbRRBR1iZwXgsnynmiebLA7
 RH1kpQMIEKwoljBuNDkvoXaiBOqLNZvoJLZwt/eK4FZswmSh8xX5FusM4M+Feo3O2CvIKGdXO0X
 12a+HJrdkqXVauWhBZ2O5rE+7QlzqhHgew0DEUZsSJNJAP41Ewxe9MMop/rQxFyflo2PZfhqJKN
 wzt4cy7H5DMqtDw==
X-Developer-Key: i=airlied@redhat.com; a=openpgp;
 fpr=10A6D91DA1B05BD29F6DEBAC0C74F35979C486BE
X-Endpoint-Received: by B4 Relay for airlied@redhat.com/default with
 auth_id=1321
X-Original-From: Dave Airlie <airlied@redhat.com>
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FA2V5W3BDK53LXU6DOITMUVJVTURRTC3
X-Message-ID-Hash: FA2V5W3BDK53LXU6DOITMUVJVTURRTC3
X-MailFrom: devnull+airlied.redhat.com@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 nova-gpu@lists.linux.dev, Dave Airlie <airlied@redhat.com>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: airlied@redhat.com
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FA2V5W3BDK53LXU6DOITMUVJVTURRTC3/>
Archived-At: 
 <https://lore.freedesktop.org/20261119-nova-nouveau-gsp-v1-2-4cde2bc41132@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Dave Airlie <airlied@redhat.com>

nova-core currently binds to every NVIDIA GPU it supports
(GSP-capable, Turing and later GPUs), competing with nouveau for the
same devices.

Add the NOVA_CORE_BIND_GSP Kconfig option (default n) and a bind_gsp
module parameter, defaulting to the Kconfig value and able to override
it in both directions. Unless one of them requests binding, probe()
rejects the GPU with -ENODEV and leaves the device to other drivers,
such as nouveau. The PCI driver still registers, so module autoloading
via modalias keeps working when binding is disabled.

As nova-core is work in progress, the default is to not bind at all.
Developers can enable binding with CONFIG_NOVA_CORE_BIND_GSP=y, or
nova-core.bind_gsp=1 on the kernel command line, combined with
nouveau.bind_gsp=0 (or CONFIG_DRM_NOUVEAU_BIND_GSP=n) so that nouveau
yields the GSP-capable GPUs.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/nova-core/Kconfig      | 21 +++++++++++++++++++++
 drivers/gpu/nova-core/driver.rs    | 13 +++++++++++++
 drivers/gpu/nova-core/nova_core.rs |  4 ++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 2e11e46c99c7..058742d50692 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -30,3 +30,24 @@ config NOVA_CORE_SELFTESTS
 	  logs its failure and lets the probe continue.
 
 	  If unsure, say N.
+
+config NOVA_CORE_BIND_GSP
+	bool "Make nova-core the default driver for GSP-capable GPUs"
+	depends on NOVA_CORE
+	default n
+	help
+	  Make nova-core bind to all NVIDIA GPUs it supports by default.
+
+	  By default nova-core does not bind to any GPU and leaves NVIDIA
+	  GPUs to other drivers, such as nouveau. Say Y here, or boot with
+	  nova-core.bind_gsp=1, to make nova-core claim NVIDIA GPUs
+	  instead.
+
+	  nova-core is work in progress and may not be functional, so this
+	  is intended for nova developers and testers only. When enabled,
+	  nouveau must not bind to the same (GSP-capable) GPUs, i.e.
+	  CONFIG_DRM_NOUVEAU_BIND_GSP=N or nouveau.bind_gsp=0 is required.
+	  Otherwise both drivers compete for the same devices and
+	  whichever is loaded first wins.
+
+	  If unsure, say N.
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index d6bc972d47c7..66208a244cab 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -105,6 +105,19 @@ fn probe<'bound>(
         dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
 
         try_pin_init!(NovaCore {
+            // Only bind when explicitly requested through the corresponding
+            // Kconfig option or module parameter. By default, leave NVIDIA
+            // GPUs to other drivers, such as nouveau.
+            _: {
+                if !crate::module_parameters::bind_gsp.value() {
+                    dev_info!(
+                        pdev,
+                        "Not binding to GPU; make nova-core the default NVIDIA driver with CONFIG_NOVA_CORE_BIND_GSP=y or nova-core.bind_gsp=1\n"
+                    );
+                    Err(ENODEV)?;
+                }
+            },
+
             _: {
                 pdev.enable_device_mem()?;
                 pdev.set_master();
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 84f777844592..d18dacad98b6 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -97,6 +97,10 @@ fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
             default: false,
             description: "Keep the GSP-RM log buffers in debugfs after their GPU is unbound",
         },
+        bind_gsp: bool {
+            default: cfg!(CONFIG_NOVA_CORE_BIND_GSP),
+            description: "Bind to GSP-capable GPUs, making nova-core the default NVIDIA driver",
+        },
     },
 }
 

-- 
2.56.1


