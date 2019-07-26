From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Don't retry infinitely when receiving
 no data on i2c over AUX
Date: Fri, 26 Jul 2019 15:08:55 -0400
Message-ID: <f86af078c7024c2285641386e2b6f1d255d9dbca.camel@redhat.com>
References: <20190725194005.16572-3-lyude@redhat.com>
         <20190726141715.A6C48218D3@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190726141715.A6C48218D3@mail.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Fri, 2019-07-26 at 14:17 +0000, Sasha Levin wrote:
> Hi,
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
> 
> The bot has tested the following trees: v5.2.2, v5.1.19, v4.19.60,
> v4.14.134, v4.9.186, v4.4.186.
> 
> v5.2.2: Build OK!
> v5.1.19: Build OK!
> v4.19.60: Build OK!
> v4.14.134: Build OK!
> v4.9.186: Failed to apply! Possible dependencies:
>     1af5c410cc0c ("drm/nouveau/i2c: modify aux interface to return length
> actually transferred")

skip v4.9
> 
> v4.4.186: Failed to apply! Possible dependencies:
>     1af5c410cc0c ("drm/nouveau/i2c: modify aux interface to return length
> actually transferred")
>     2ed95a4c65a3 ("drm/nouveau: recognise GM200 chipset")
>     7568b1067181 ("drm/nouveau/nvif: split out display interface
> definitions")
>     7d2813c437a0 ("drm/nouveau/ltc/gm204: split implementation from gm107")
>     db1eb528462f ("drm/nouveau: s/gm204/gm200/ in a number of places")
>     e3d26d086092 ("drm/nouveau/ibus/gm204: split implementation from gk104")
> 
> 
and skip v4.4

> NOTE: The patch will not be queued to stable trees until it is upstream.
> 
> How should we proceed with this patch?
> 
> --
> Thanks,
> Sasha
-- 
Cheers,
	Lyude Paul
