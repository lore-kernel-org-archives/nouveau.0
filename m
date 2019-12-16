From: =?UTF-8?Q?Marcin_Zaj=c4=85czkowski?= <mszpak-5tc4TXWwyLM@public.gmane.org>
Subject: Tracking down severe regression in 5.3-rc4/5.4 for TU116
 - assistance needed
Date: Mon, 16 Dec 2019 17:35:57 +0100
Message-ID: <c34a6fe1-80dd-a4db-c605-0a13c69e803f@wp.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

I've encountered a severe regression in TU116 (probably also TU117)
introduced in 5.3-rc4 (valid also for recent 5.4.2) [1]. The system
usually hangs on the subsequent graphic mode related operation (calling
xrandr after login is enough) with the following error:

> kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []
...
> kernel: nouveau 0000:01:00.0: DRM: failed to idle channel 0 [DRM]
> kernel: nouveau 0000:01:00.0: i2c: aux 0007: begin idle timeout ffffffff
> kernel: nouveau 0000:01:00.0: tmr: stalled at ffffffffffffffff
> kernel: ------------[ cut here ]------------
> kernel: nouveau 0000:01:00.0: timeout
> kernel: WARNING: CPU: 10 PID: 384 at drivers/gpu/drm/nouveau/nvkm/subdev/bar/g84.c:35 g84_bar_flush+0xcf/> 0xe0 [nouveau]

(detailed log in a corresponding issue - [1])

With earlier kernels there was no hardware acceleration for NVidia GTX
1660 Ti, but at least I could use nouveau to disable it (to save
battery, trees and lower temperature) or even have an external output
(with Wayland). Now, the system is unusable with nouveau :(.

I spent some time trying to narrow the scope using on the existing
kernel builds for Fedora. I was able to determine that the problem was
introduced between 5.3.0-0.rc3.git1.1 (commit 33920f1ec5bf - works fine)
and 5.3.0-0.rc4.git0.1 (tag v5.3-rc4 - fails with errors).

It's just a few days (7-11 Aug) and "only" around 250 commits. I went
through them, but (based on the commits name) I haven't seen any nouveau
related changes and in general no very suspected drm related changes.

> git log 33920f1ec5bf..v5.3-rc4 --stat


Maybe some of more nouveau/drm-experienced developers could take a look
at that to determine which commit could break it (to make it easier to
find out what should be fixed to prevent that regression)?


[1] -
https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/issues/516

Thanks in advance
Marcin
