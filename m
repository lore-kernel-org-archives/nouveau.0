From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 0/2] drm/nouveau: Use more standard logging styles
Date: Fri, 31 Aug 2018 19:07:15 -0400
Message-ID: <b0396fff969f5dca0c863992e42f4aba16939906.camel@redhat.com>
References: <cover.1535654026.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1535654026.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Nice catch!

On Thu, 2018-08-30 at 11:36 -0700, Joe Perches wrote:
> Reduces object size ~4kb
> 
> Joe Perches (2):
>   drm/nouveau: Add new logging function nv_cli_printk
>   drm/nouveau: Convert NV_PRINTK macros and uses to new nv_cli_<level>
> macros
> 
>  drivers/gpu/drm/nouveau/nouveau_abi16.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_chan.c  | 12 +++----
>  drivers/gpu/drm/nouveau/nouveau_drm.c   | 21 +++++++++++
>  drivers/gpu/drm/nouveau/nouveau_drv.h   | 44 ++++++++++++++---------
>  drivers/gpu/drm/nouveau/nouveau_gem.c   | 62 ++++++++++++++++------------
> -----
>  5 files changed, 87 insertions(+), 54 deletions(-)
> 
-- 
Cheers,
	Lyude Paul
