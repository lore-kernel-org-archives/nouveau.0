From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Subject: [bisected] Re: regression: nouveau fifo: fault 01 ==>
 channel 1: killed ==> dead desktop
Date: Thu, 17 Dec 2020 14:30:29 +0100
Message-ID: <136aa09d13fab723e0460b73608ed3950699f2b6.camel@gmx.de>
References: <fe612bbbeedd0ee0d03d04c7341ea62406b957c7.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <fe612bbbeedd0ee0d03d04c7341ea62406b957c7.camel-Mmb7MZpHnFY@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, 2020-12-16 at 14:31 +0100, Mike Galbraith wrote:
> When the below new to 5.11 cycle badness happens, it's time to reboot.
>
> ...
> [   27.467260] NFSD: Using UMH upcall client tracking operations.
> [   27.467273] NFSD: starting 90-second grace period (net f00000a0)
> [   27.965138] Bridge firewalling registered
> [   39.096604] fuse: init (API version 7.32)
> [  961.579832] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at 0000000000=
69f000 engine 15 [CE0] client 01 [HUB/CE0] reason 02 [PTE] on channel 1 [00=
ff73d000 DRM]
> [  961.579840] nouveau 0000:01:00.0: fifo: channel 1: killed
> [  961.579844] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recov=
ery
> [  961.579850] nouveau 0000:01:00.0: fifo: runlist 4: scheduled for recov=
ery
> [  961.579853] nouveau 0000:01:00.0: fifo: engine 4: scheduled for recove=
ry
>
> Box is aging generic i4790 desktop box with...
> 01:00.0 VGA compatible controller: NVIDIA Corporation GM204 [GeForce GTX =
980] (rev a1)

Bisection was straight forward.  A post bisect test revert was equally
straight forward, and seems to confirm the fingered commit.

0c8c0659d7475b6304b67374caf15b56cf0be4f9 is the first bad commit
commit 0c8c0659d7475b6304b67374caf15b56cf0be4f9
Author: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Thu Oct 29 13:59:20 2020 +1000

    drm/nouveau/ttm: use multihop

    This removes the code to move resources directly between
    SYSTEM and VRAM in favour of using the core ttm mulithop code.

    Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Acked-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
    Reviewed-by: Christian K=F6nig <christian.koenig-5C7GfCeVMHo@public.gmane.org>
    Link: https://patchwork.freedesktop.org/patch/msgid/20201109005432.8619=
36-4-airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

 drivers/gpu/drm/nouveau/nouveau_bo.c | 112 ++++---------------------------=
----
 1 file changed, 13 insertions(+), 99 deletions(-)

git bisect start 'drivers/gpu'
# good: [2c85ebc57b3e1817b6ce1a6b703928e113a90442] Linux 5.10
git bisect good 2c85ebc57b3e1817b6ce1a6b703928e113a90442
# bad: [accefff5b547a9a1d959c7e76ad539bf2480e78b] Merge tag 'arm-soc-omap-g=
enpd-5.11' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad accefff5b547a9a1d959c7e76ad539bf2480e78b
# bad: [d635a69dd4981cc51f90293f5f64268620ed1565] Merge tag 'net-next-5.11'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
git bisect bad d635a69dd4981cc51f90293f5f64268620ed1565
# bad: [0ca2ce81eb8ee30f3ba8ac7967fef9cfbb44dbdb] Merge tag 'arm64-upstream=
' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
git bisect bad 0ca2ce81eb8ee30f3ba8ac7967fef9cfbb44dbdb
# good: [f8aab60422c371425365d386dfd51e0c6c5b1041] drm/amdgpu: Initialise d=
rm_gem_object_funcs for imported BOs
git bisect good f8aab60422c371425365d386dfd51e0c6c5b1041
# bad: [fab0fca1da5cdc48be051715cd9787df04fdce3a] Merge tag 'media/v5.11-1'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect bad fab0fca1da5cdc48be051715cd9787df04fdce3a
# bad: [bcc68bd8161261ceeb1a4ab02b5265758944f90d] Merge tag 'auxdisplay-for=
-linus-v5.11' of git://github.com/ojeda/linux
git bisect bad bcc68bd8161261ceeb1a4ab02b5265758944f90d
# bad: [22f8c80566c4a29a0d8b5ebf24aa1fd1679b39e5] Merge tag 'drm-misc-next-=
2020-11-18' of ssh://git.freedesktop.org/git/drm/drm-misc into drm-next
git bisect bad 22f8c80566c4a29a0d8b5ebf24aa1fd1679b39e5
# bad: [a1ac250a82a5e97db71f14101ff7468291a6aaef] fbcon: Avoid using FNTCHA=
RCNT() and hard-coded built-in font charcount
git bisect bad a1ac250a82a5e97db71f14101ff7468291a6aaef
# good: [a39855076c859b7f6c58ed4da8f195a2a6cd3c7b] drm/cma-helper: Make def=
ault object functions the default
git bisect good a39855076c859b7f6c58ed4da8f195a2a6cd3c7b
# bad: [5f1f10998e7f0ba98a8efc27009cd9a11cff6616] drm/atmel-hlcdc/atmel_hlc=
dc_plane: Staticise local function 'atmel_hlcdc_plane_setup_scaler()'
git bisect bad 5f1f10998e7f0ba98a8efc27009cd9a11cff6616
# good: [55c8bcaeccaa5c6d9e7a432ebd0a1717f488a3f4] drm: mxsfb: Implement .f=
ormat_mod_supported
git bisect good 55c8bcaeccaa5c6d9e7a432ebd0a1717f488a3f4
# bad: [0c8c0659d7475b6304b67374caf15b56cf0be4f9] drm/nouveau/ttm: use mult=
ihop
git bisect bad 0c8c0659d7475b6304b67374caf15b56cf0be4f9
# good: [23d6ab1d4c503660632e7b18cbb571d62d9bf792] drm: remove pgprot_decry=
pted() before calls to io_remap_pfn_range()
git bisect good 23d6ab1d4c503660632e7b18cbb571d62d9bf792
# good: [ebdf565169af006ee3be8c40eecbfc77d28a3b84] drm/ttm: add multihop in=
frastrucutre (v3)
git bisect good ebdf565169af006ee3be8c40eecbfc77d28a3b84
# good: [f5a89a5cae812a39993be32e74c8ed7856b1e2b2] drm/amdgpu/ttm: use mult=
ihop
git bisect good f5a89a5cae812a39993be32e74c8ed7856b1e2b2
# first bad commit: [0c8c0659d7475b6304b67374caf15b56cf0be4f9] drm/nouveau/=
ttm: use multihop
