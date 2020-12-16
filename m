From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Subject: regression: nouveau fifo: fault 01 ==> channel 1: killed
 ==> dead desktop
Date: Wed, 16 Dec 2020 14:31:25 +0100
Message-ID: <fe612bbbeedd0ee0d03d04c7341ea62406b957c7.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

When the below new to 5.11 cycle badness happens, it's time to reboot.

...
[   27.467260] NFSD: Using UMH upcall client tracking operations.
[   27.467273] NFSD: starting 90-second grace period (net f00000a0)
[   27.965138] Bridge firewalling registered
[   39.096604] fuse: init (API version 7.32)
[  961.579832] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at 000000000069f000 engine 15 [CE0] client 01 [HUB/CE0] reason 02 [PTE] on channel 1 [00ff73d000 DRM]
[  961.579840] nouveau 0000:01:00.0: fifo: channel 1: killed
[  961.579844] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
[  961.579850] nouveau 0000:01:00.0: fifo: runlist 4: scheduled for recovery
[  961.579853] nouveau 0000:01:00.0: fifo: engine 4: scheduled for recovery

Box is aging generic i4790 desktop box with...
01:00.0 VGA compatible controller: NVIDIA Corporation GM204 [GeForce GTX 980] (rev a1)

	-Mike
