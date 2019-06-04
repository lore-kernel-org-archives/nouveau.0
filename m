From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 0/2] drm/nouveau/bios/init: Improve pre-PMU devinit
 opcode coverage
Date: Tue, 04 Jun 2019 14:07:05 -0400
Message-ID: <ad520b3710906bfcf51d2f823db5cc99fb12ee90.camel@redhat.com>
References: <20190602141315.6197-1-rhyskidd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190602141315.6197-1-rhyskidd@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhys Kidd <rhyskidd@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>, Ilia Mirkin <imirkin@alum.mit.edu>
List-Id: nouveau.vger.kernel.org

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Tested on a GK104 and GK110 (same ones as my vbios traces in our vbios repo)

On Mon, 2019-06-03 at 00:13 +1000, Rhys Kidd wrote:
> NVIDIA GPUs include a common scripting language (devinit) that can be
> interpreted by a number of "engines", e.g. within a kernel-mode software
> driver, the VGA BIOS or an on-board small microcontroller which provides
> certain security assertions (the 'PMU').
> 
> This system allows a GPU programming sequence to be shared by multiple
> entities that would not otherwise be able to execute common code.
> 
> This series adds support to nouveau for two opcodes seen on VBIOSes prior
> to the locked-down PMU taking over responsibility for executing devinit
> scripts.
> 
> Documentation for these two opcodes can be found at:
> 
>   https://github.com/envytools/envytools/pull/189
> 
> Rhys Kidd (2):
>   drm/nouveau/bios/init: handle INIT_RESET_BEGUN devinit opcode
>   drm/nouveau/bios/init: handle INIT_RESET_END devinit opcode
> 
>  .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   | 26 +++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
-- 
Cheers,
	Lyude Paul
