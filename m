From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 00/29] [Set 15] Finally rid W=1 warnings
 from GPU!
Date: Mon, 18 Jan 2021 10:49:07 +0100
Message-ID: <YAVZk3XKNf9W7guC@phenom.ffwll.local>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Eric Anholt <eric@anholt.net>, Jesse Barnes <jesse.barnes@intel.com>, Jan Safrata <jan.nikitenko@gmail.com>, Lee Jones <lee.jones@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, Gareth Hughes <gareth@valinux.com>, Pei Zhang <pei.zhang@intel.com>, Rob Clark <rob.clark@linaro.org>, Min He <min.he@intel.com>, Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>, Niu Bing <bing.niu@intel.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, jim liu <jim.liu@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, Roland Scheidegger <sroland@vmware.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, linaro-mm-sig
List-Id: nouveau.vger.kernel.org

On Fri, Jan 15, 2021 at 06:27:15PM +0000, Zack Rusin wrote:
> 
> > On Jan 15, 2021, at 13:15, Lee Jones <lee.jones@linaro.org> wrote:
> > 
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > Last set!  All clean after this for; Arm, Arm64, PPC, MIPS and x86.
> 
> Thanks! For all the vmwgfx bits:
> Reviewed-by: Zack Rusin <zackr@vmware.com>

Can you pls push them to drm-misc-next? I'm planning to go pull in all the
other patches later today that belong into drm-misc-next, but some patch
monkey help would be really great :-)

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
