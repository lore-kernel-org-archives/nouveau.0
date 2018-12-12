From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix memory leak in nv50_mstm_del()
Date: Wed, 12 Dec 2018 12:40:29 -0500
Message-ID: <8bab5e2d6153cf9e1b234389f90bff78309d2054.camel@redhat.com>
References: <20181211235622.22859-1-lyude@redhat.com>
         <20181212054647.B966520811@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181212054647.B966520811@mail.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

v4.19.8, it's ok to skip v4.14 for this

On Wed, 2018-12-12 at 05:46 +0000, Sasha Levin wrote:
> Hi,
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a "Fixes:" tag,
> fixing commit: f479c0ba4a17 drm/nouveau/kms/nv50: initial support for DP 1.2
> multi-stream.
> 
> The bot has tested the following trees: v4.19.8, v4.14.87, 
> 
> v4.19.8: Build OK!
> v4.14.87: Failed to apply! Possible dependencies:
>     Unable to calculate
> 
> 
> How should we proceed with this patch?
> 
> --
> Thanks,
> Sasha
-- 
Cheers,
	Lyude Paul
