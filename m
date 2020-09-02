From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH v4] drm/nouveau/kms/nv50-: Program notifier offset before requesting disp caps
Date: Wed, 02 Sep 2020 13:38:45 +0000
Message-ID: <20200902133846.9C12A20767__41489.0782720008$1599061271$gmane$org@mail.kernel.org>
References: <20200901234240.197917-1-lyude@redhat.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200901234240.197917-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>, Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP interlacing support").

The bot has tested the following trees: v5.8.5.

v5.8.5: Failed to apply! Possible dependencies:
    0a96099691c8 ("drm/nouveau/kms/nv50-: implement proper push buffer control logic")
    0bc8ffe09771 ("drm/nouveau/kms/nv50-: Move hard-coded object handles into header")
    12885ecbfe62 ("drm/nouveau/kms/nvd9-: Add CRC support")
    203f6eaf4182 ("drm/nouveau/kms/nv50-: convert core update() to new push macros")
    2853ccf09255 ("drm/nouveau/kms/nv50-: wrap existing command submission in nvif_push interface")
    344c2e5a4796 ("drm/nouveau/kms/nv50-: use NVIDIA's headers for core or_ctrl()")
    3c43c362b3a5 ("drm/nouveau/kms/nv50-: convert core caps_init() to new push macros")
    5e691222eac6 ("drm/nouveau/kms/nv50-: convert core init() to new push macros")
    9ec5e8204053 ("drm/nouveau/kms/nv50-: convert core or_ctrl() to new push macros")
    b11d8ca151d0 ("drm/nouveau/kms/nv50-: use NVIDIA's headers for core init()")
    b505935e56b2 ("drm/nouveau/kms/nv50-: convert core wndw_owner() to new push macros")
    d8b24526ef68 ("drm/nouveau/kms/nv50-: use NVIDIA's headers for core caps_init()")
    e79c9a0ba5e7 ("drm/nouveau/nvif: give every mem object a human-readable identifier")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
