From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/2] drm/nouveau/kms/nv50-: Program
 notifier offset before requesting disp caps
Date: Mon, 07 Sep 2020 15:03:40 +0000
Message-ID: <20200907150340.E9D2B21532@mail.kernel.org>
References: <20200904202813.1260202-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200904202813.1260202-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP interlacing support").

The bot has tested the following trees: v5.8.7.

v5.8.7: Failed to apply! Possible dependencies:
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
