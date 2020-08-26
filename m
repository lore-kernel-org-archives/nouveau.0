From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH v2 1/2] drm/nouveau/kms/nv50-: Program notifier offset before requesting disp caps
Date: Wed, 26 Aug 2020 13:53:44 +0000
Message-ID: <20200826135344.C461A22B40__47690.212067549$1598450041$gmane$org@mail.kernel.org>
References: <20200807213405.442877-1-lyude@redhat.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200807213405.442877-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>, Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP interlacing support").

The bot has tested the following trees: v5.8.2.

v5.8.2: Failed to apply! Possible dependencies:
    3c43c362b3a5 ("drm/nouveau/kms/nv50-: convert core caps_init() to new push macros")
    5e691222eac6 ("drm/nouveau/kms/nv50-: convert core init() to new push macros")
    d8b24526ef68 ("drm/nouveau/kms/nv50-: use NVIDIA's headers for core caps_init()")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
