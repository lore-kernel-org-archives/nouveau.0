Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BDE606A31C
	for <nouveau@archiver.kernel.org>; Mon, 16 Nov 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4AF64nu
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8868310EEEF;
	Mon, 16 Nov 2026 10:21:14 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0381049451;
	Mon, 16 Nov 2026 10:01:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794823284;
 b=aD/Fw0mS4mrDRF9OgB6k9Kjw7KQOvFyqQlCM+k818Ord+XJ7EFPSaDCRZtBBy5fJTPWF6
 TYzJZekusoO80LppU81zqfT5pSQgrA5MM1TJ9hvJVEp8TKa2NfDdVqWj36iAXKrWFyMDGrf
 OeQoPU5LaSOfKwaDavoEZDmL4Cr9m0XDWnhIgyizynesap772sTx/eIXefibcDhpsiXhIVq
 TlNZNK4vulfKNaUjNTPdJU6E/t7eAYoEZaUCPrD979PnCftQyNRhakidtyQFYKiDTND/syb
 3lzfL6lbRaTO3vmLc1l0db+L14EVpr3CU1QTAr9m/+NPbqUq076CJtjjnu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794823284; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eCrA9mVjaBK8MAY40JPU1DywzMNRUcfqehnrbY/XXEA=;
 b=VZTU0HSI9VL+H43u7Vwyt0GcVfaeqLzGj5H7tfOx3cx2ztzEvlDQ+DHuaE2wu1CfeEtda
 OAN94rV8NAku1jCkskLTZwHLe/bYMkX7VyrhjqLfQPEXOJTM+UzHNHtMyD1QiWRDlk6ErgQ
 PlY3ujs7MoEqcolZ+LXXjhFgTEfiY0LnoRilncI9C5A2TDT9SQ2zrjCR5PQynlICQf9fG8p
 IAcSiudUXknbFpwc6jByCv65LC+ksVXMQb3jlRINAY5CbLXnmlrY0k930B2/sVyYgWoXTyV
 v/jF7vegm/fAfU1MuRwdHpCclRkKFEcxk+DlEvuXByeWbt3KXr4rffblwj9Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3ADBB49418
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 10:01:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6A64510EED8;
	Mon, 16 Nov 2026 10:21:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 607C462887;
	Mon, 16 Nov 2026 10:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BA51F000C6;
	Mon, 16 Nov 2026 10:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824465;
	bh=eCrA9mVjaBK8MAY40JPU1DywzMNRUcfqehnrbY/XXEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A4AF64nuBLP4D/WB5XYrARCuvN2Uya+3U/WL8n/jma9gny6IDC2hNd/K8trp//kOW
	 03vAkDVhr12heLXIsz1vZ3Lizif1tDNSK+WI9rfYCraTnB+tG780UlFvGKGfeYW4Yj
	 /IGW6YDtveTz1JbN3vYsZvH06G36SZgQ90exTJ8WtMz1sp4PXUGZOa7wDC7+oNODEN
	 esEoQ++w65AfXmz1JPtKklbmO8G8ttx+3dNK4t7h98eTe2QMB5YoB+XXQnlZYrcWRj
	 ZrIAkdIqvc1bQVWn9O14VYmxY1+VqEs5E6zOpHJTbvhSY+cUGEVijNGts5/I2lDndf
	 xBytnwQqkpBDA==
From: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: (subset) [PATCH RESEND 00/83] drm: Switch drivers to
 drm_mode_config_create_initial_state
Date: Mon, 16 Nov 2026 11:20:59 +0100
Message-ID: <179482445067.74579.7064780976000809844.b4-ty@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KJMP42Z7HVLW24BX2D5QNKUSWG3IIEW4
X-Message-ID-Hash: KJMP42Z7HVLW24BX2D5QNKUSWG3IIEW4
X-MailFrom: mripard@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, Janne Grunau <j@jannau.net>,
 Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Aun-Ali Zaidi <admin@kodeit.net>, Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Alison Wang <alison.wang@nxp.com>, Stefan Agner <stefan@agner.ch>,
 Ruben Wauters <rubenru09@aol.com>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Yongbang Shi <shiyongbang@huawei.com>, John Stultz <jstultz@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>, linux-hyperv@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Liu Ying <victor.liu@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Huacai Chen <chenhuacai@kernel.org>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jianmin Lv <lvjianmin@loongson.cn>,
 Mingcong Bai <jeffbai@aosc.io>, Qianhai Wu <wuqianhai@loongson.cn>,
 Xi Ruoyao <xry111@xry111.site>, Linus Walleij <linusw@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Marek Vasut <marex@denx.de>, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Gerd Hoffmann <kraxel@redhat.com>, spice-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 David Lechner <david@lechnology.com>, Iker Pedrosa <ikerpedrosam@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org,
 Jyri Sarha <jyri.sarha@iki.fi>, Alexey Brodkin <abrodkin@synopsys.com>,
 Hans de Goede <hansg@kernel.org>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Alex Lanzano <lanzano.alex@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chia-I Wu <olvaffe@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Michal Simek <michal.simek@amd.com>, Aditya Garg <aditya.garg@linux.dev>,
 Andy Yan <andyshrk@163.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KJMP42Z7HVLW24BX2D5QNKUSWG3IIEW4/>
Archived-At: 
 <https://lore.freedesktop.org/179482445067.74579.7064780976000809844.b4-ty@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026 16:29:09 +0100, Maxime Ripard wrote:
> drm_mode_config_reset() has a dual role: it creates the initial KMS
> state at probe time, and resets hardware and software state during
> suspend/resume cycles. However, the two roles need different
> behaviors, notably for objects like drm_private_obj that must persist
> across suspend/resume and are excluded from drm_mode_config_reset()
> by design.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next)

[45/83] drm/sti: Switch to drm_mode_config_create_initial_state
        commit: a8670a2ab1a81dc3fc30093e47c23b83244ca4d0

Thanks!
Maxime
