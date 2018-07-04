From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 1/2] drm/nouveau: Fix runtime PM leak in drm_open()
Date: Wed, 4 Jul 2018 04:41:03 +0200
Message-ID: <20180704024103.GA23762@wunner.de>
References: <20180703220602.16664-1-lyude@redhat.com>
 <20180703220602.16664-2-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180703220602.16664-2-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

[cc -= stable]

On Tue, Jul 03, 2018 at 06:05:59PM -0400, Lyude Paul wrote:
> Noticed this as I was skimming through, if we fail to allocate memory
> for cli we'll end up returning without dropping the runtime PM ref we
> got. Additionally, we'll even return the wrong return code! (ret most
> likely will == 0 here, we want -ENOMEM).
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Lukas Wunner <lukas@wunner.de>
