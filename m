From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/nouveau/kms/gv100-: Re-set LUT after clearing for
 modesets
Date: Thu, 13 Feb 2020 16:19:21 -0500
Message-ID: <ca9cf8a812f4dabcfd74d66c1170c31e97f9c7b9.camel@redhat.com>
References: <20200212231150.171495-1-lyude@redhat.com>
         <20200213173705.3FD89206ED@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200213173705.3FD89206ED@mail.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Thu, 2020-02-13 at 17:37 +0000, Sasha Levin wrote:
> Hi,
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a "Fixes:" tag,
> fixing commit: facaed62b4cb ("drm/nouveau/kms/gv100: initial support").
> 
> The bot has tested the following trees: v5.5.3, v5.4.19, v4.19.103.
> 
> v5.5.3: Build OK!
> v5.4.19: Build OK!
> v4.19.103: Failed to apply! Possible dependencies:
>     88b703527ba7 ("drm/nouveau/kms/gf119-: add ctm property support")
>     cb55cd0c66a1 ("drm/nouveau/kms/nv50-: allow more flexibility with lut
> formats")
> 
> 
> NOTE: The patch will not be queued to stable trees until it is upstream.
> 
> How should we proceed with this patch?

Apply it to 5.5.3, 5.4.19. We can drop the rest

> 
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat
