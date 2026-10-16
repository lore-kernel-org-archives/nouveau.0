Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D274CCA46C
	for <nouveau@archiver.kernel.org>; Fri, 16 Oct 2026 15:12:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E924A112891;
	Fri, 16 Oct 2026 15:12:50 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 49ABB48AE3;
	Fri, 16 Oct 2026 14:54:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792162449;
 b=NKqSDpxGYJsoFR2UvumGCfYuywQkRGH8lyDOQpTWwJJKyPHMs4XJwoK/SOXpRQHPb+E4w
 EgahuQxtgPRq4NSljZ3mlZJdiNTHOEQaMmKTrDX/jkqOvkjskCyyeQ7up1BrYjOEi7L2nJM
 CJ4TB+Ao8HcWv9u7/YagHjb5wcKm1gTWT6dWMs8CyZl1qg6qMSwVeA0yMnU9BFGgtjq2RnP
 BIc8LEMeMjZoGxiAoxeA3zPxPzsN3KgYmiD2d4Py8TGNGN8Dpzqnoe2JRdv//FyJB047Dgf
 QOtLNgWUN33p6uv7MHn+ZQANXTtuBkSU1ULMjIVriso5AC4ByDBa7PzV2WBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792162449; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zExOvzSfNAOGhWyHayoCJYIMW12XGItswYYl/21/DBA=;
 b=oWAljYx/PCuYE0CHDjsjtDiVQcFBMdysCZKbKgAnZfra5L7Iqrj7fYFIMw82+Y8FUkl0y
 vT7GVGHrKfVnnuTUpNiUgX0oD6BGEscltmZXicV692xNeHAQn0ADc3QE7Yl/rvkIK0p26N4
 fU5y9uNhnpO67V2SmcRru4WjUoGCXN9ezfUPLhGURhx/0BJhYYzz1SeAJhDnpg6IDdmcqwf
 3et7iYqcJUXrCT97+qemk6gLF31QSytYGT6pZuoKJ0EeRxySMf2C4Mou7q4OTu4pqzYH+Gy
 u60d7HcUPUATzAtKfm+afMaO0qltD3BzyZWsrdDH3L1aFpJIvhppggnEiUig==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D1986403F8
	for <nouveau@lists.freedesktop.org>; Fri, 16 Oct 2026 14:54:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1E51810E2DC;
	Fri, 16 Oct 2026 15:12:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F41B601FF;
	Fri, 16 Oct 2026 15:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F291F000C4;
	Fri, 16 Oct 2026 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792163561;
	bh=zExOvzSfNAOGhWyHayoCJYIMW12XGItswYYl/21/DBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HeXH2eNd0qTi1KJWMDpX2qurIIHfELGudDOFsBVj38SK5hgtwRmtRu++Y/B5kYqqd
	 A4blc5Fp2xS9ugu94PJEByj6vIlDtKLwiWnVuaMsxRz0Ir4yLDMdWRBi4NsEDJfgYI
	 dTCWHHQPHA4O4L72QOauM8WSJ4JjVCneqoIAwA1rVTR79Lh6W41DTt4LcokcrG/DS7
	 QghFRktl0qmqBt0Q2454sV5etB2cRZSEkJVEe4jVB1iPvoqhJu/FGnl3nmWT7TfuCi
	 kYiPGdYgWB0PP3fl0nc6yx6ZWW1MUxK7rfa2DXZnz9GRXCns4+n+2ph4Izy2R1nkwe
	 CPOLN30xIOzMQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: (subset) [PATCH 00/75] drm/connector: Convert all drivers to
 atomic_create_state and remove reset
Date: Fri, 16 Oct 2026 17:12:34 +0200
Message-ID: <179216354629.2387589.2597043397406887835.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: 
 <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
References: 
 <20261014-drm-no-more-connector-reset-v1-0-586c9c026823@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NL46KVB3H36UEOCCV2L4GPT7WS2E23FB
X-Message-ID-Hash: NL46KVB3H36UEOCCV2L4GPT7WS2E23FB
X-MailFrom: mripard@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, Aun-Ali Zaidi <admin@kodeit.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Francesco Dolcini <francesco@dolcini.it>, Ian Ray <ian.ray@gehealthcare.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Alison Wang <alison.wang@nxp.com>, Stefan Agner <stefan@agner.ch>,
 Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Yongbang Shi <shiyongbang@huawei.com>, Dexuan Cui <decui@microsoft.com>,
 Long Li <longli@microsoft.com>, Saurabh Sengar <ssengar@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
 Paul Kocialkowski <paulk@sys-base.io>, Huacai Chen <chenhuacai@kernel.org>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jianmin Lv <lvjianmin@loongson.cn>,
 Mingcong Bai <jeffbai@aosc.io>, Qianhai Wu <wuqianhai@loongson.cn>,
 Xi Ruoyao <xry111@xry111.site>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>, spice-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-renesas-soc@vger.kernel.org,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Iker Pedrosa <ikerpedrosam@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
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
 Alexey Brodkin <abrodkin@synopsys.com>, Hans de Goede <hansg@kernel.org>,
 LiangCheng Wang <zaq14760@gmail.com>, Alex Lanzano <lanzano.alex@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chia-I Wu <olvaffe@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Ruben Wauters <rubenru09@aol.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Zack Rusin <zack.rusin@broadcom.com>, Aditya Garg <aditya.garg@linux.dev>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NL46KVB3H36UEOCCV2L4GPT7WS2E23FB/>
Archived-At: 
 <https://lore.freedesktop.org/179216354629.2387589.2597043397406887835.b4-ty@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 14 Oct 2026 19:26:23 +0200, Maxime Ripard wrote:
> This is a follow-up to the plane and CRTC reset removal series, and
> part of a larger effort to remove the reset hook from all KMS objects.
> 
> The connector reset hook is overloaded: it is called both at probe
> time to create the initial software state and during suspend/resume to
> reset hardware and software state. These two roles have different
> requirements, and the reset hook is not fallible, making error
> handling difficult for the initial state allocation path.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next)

[02/75] drm/adp: Switch to drm_atomic_helper_connector_create_state
        commit: db1de27aca30ebaad04aea74ac21e4c4fb531a37

Thanks!
Maxime
