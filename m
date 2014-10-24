From: poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: display force off - kernel 3.18
Date: Fri, 24 Oct 2014 22:55:21 +0200
Message-ID: <544ABCB9.10207@gmail.com>
References: <5444A802.9030504@gmail.com> <544562E9.1030000@gmail.com>
 <5445A78B.8050501@gmail.com> <5445AA57.3020801@gmail.com>
 <54463183.3010808@gmail.com> <54469691.10105@gmail.com>
 <5447C9F4.4030303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5447C9F4.4030303-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Adam Williamson <awilliam-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mailing-List fedora-kernel <kernel-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org>
List-Id: nouveau.vger.kernel.org


linux-next, commit 2d65a9f broke nouveau(display is powered off): 
- boot from soft-off(S5)
- thaw from hibernate(S4)
- resume from suspend(S3)

Chipset: G98 (NV98)
Family : NV50

https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=2d65a9f

commit 2d65a9f48fcdf7866aab6457bc707ca233e0c791
Merge: da92da3 dfda0df
Author: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Date:   Tue Oct 14 09:39:08 2014 +0200

    Merge branch 'drm-next' of git://people.freedesktop.org/~airlied/linux
    
    Pull drm updates from Dave Airlie:
     "This is the main git pull for the drm,
    
      I pretty much froze major pulls at -rc5/6 time, and haven't had much
      fallout, so will probably continue doing that.
    
      Lots of changes all over, big internal header cleanup to make it clear
      drm features are legacy things and what are things that modern KMS
      drivers should be using.  Also big move to use the new generic fences
      in all the TTM drivers.
    
      core:
            atomic prep work,
            vblank rework changes, allows immediate vblank disables
            major header reworking and cleanups to better delinate legacy
            interfaces from what KMS drivers should be using.
            cursor planes locking fixes
    
      ttm:
            move to generic fences (affects all TTM drivers)
            ppc64 caching fixes
    
      radeon:
            userptr support,
            uvd for old asics,
            reset rework for fence changes
            better buffer placement changes,
            dpm feature enablement
            hdmi audio support fixes
    
      intel:
            Cherryview work,
            180 degree rotation,
            skylake prep work,
            execlist command submission
            full ppgtt prep work
            cursor improvements
            edid caching,
            vdd handling improvements
    
      nouveau:
            fence reworking
            kepler memory clock work
            gt21x clock work
            fan control improvements
            hdmi infoframe fixes
            DP audio
    
      ast:
            ppc64 fixes
            caching fix
    
      rcar:
            rcar-du DT support
    
      ipuv3:
            prep work for capture support
    
      msm:
            LVDS support for mdp4, new panel, gpu refactoring
    
      exynos:
            exynos3250 SoC support, drop bad mmap interface,
            mipi dsi changes, and component match support"
    
    * 'drm-next' of git://people.freedesktop.org/~airlied/linux: (640 commits)
      drm/mst: rework payload table allocation to conform better.
      drm/ast: Fix HW cursor image
      drm/radeon/kv: add uvd/vce info to dpm debugfs output
      drm/radeon/ci: add uvd/vce info to dpm debugfs output
      drm/radeon: export reservation_object from dmabuf to ttm
      drm/radeon: cope with foreign fences inside the reservation object
      drm/radeon: cope with foreign fences inside display
      drm/core: use helper to check driver features
      drm/radeon/cik: write gfx ucode version to ucode addr reg
      drm/radeon/si: print full CS when we hit a packet 0
      drm/radeon: remove unecessary includes
      drm/radeon/combios: declare legacy_connector_convert as static
      drm/radeon/atombios: declare connector convert tables as static
      drm/radeon: drop btc_get_max_clock_from_voltage_dependency_table
      drm/radeon/dpm: drop clk/voltage dependency filters for BTC
      drm/radeon/dpm: drop clk/voltage dependency filters for CI
      drm/radeon/dpm: drop clk/voltage dependency filters for SI
      drm/radeon/dpm: drop clk/voltage dependency filters for NI
      drm/radeon: disable audio when we disable hdmi (v2)
      drm/radeon: split audio enable between eg and r600 (v2)
      ...


Up to and with prior commit da92da3 nouveau(S3/4/5) works OK.


poma
