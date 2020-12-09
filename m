From: meschi-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org
Subject: Re: Crash with desktop freeze on 5.10.0-rc7-next with a
 Quadro 4000
Date: Wed, 09 Dec 2020 16:29:29 +0100
Message-ID: <8c7a7c9a995a5668c08bd1c5a34b2cfd@posteo.de>
References: <3917df6273b86058a1f8d0d2c0d0020a@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <3917df6273b86058a1f8d0d2c0d0020a-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
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

> Hi,
> I'm having a desktop freeze with 5.10.0-rc7-next-20201209
> No such problems with 5.4 or 5.8. Running on ubuntu 20.04
> I will be happy helping to debug this. I'm running a Nvidia Quadro 
> 4000.
> 
> Here is my dmesg output:
> 
> [...]

systemctl stop gdm3 appends this to dmesg:

[  377.229203] systemd-journald[313]: Successfully sent stream file 
descriptor to service manager.
[  377.229371] systemd-journald[313]: Successfully sent stream file 
descriptor to service manager.
[  437.232027] systemd-journald[313]: Successfully sent stream file 
descriptor to service manager.
[  437.232157] systemd-journald[313]: Successfully sent stream file 
descriptor to service manager.
[  480.295670] systemd-journald[313]: Successfully sent stream file 
descriptor to service manager.
[  492.914757] INFO: task kworker/u128:3:233 blocked for more than 122 
seconds.
[  492.914765]       Not tainted 5.10.0-rc7-next-20201209+ #1
[  492.914767] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  492.914770] task:kworker/u128:3  state:D stack:    0 pid:  233 ppid:  
    2 flags:0x00004000
[  492.914854] Workqueue: events_unbound nv50_disp_atomic_commit_work 
[nouveau]
[  492.914856] Call Trace:
[  492.914866]  __schedule+0x496/0xb40
[  492.914909]  ? nvkm_ioctl+0xf0/0x190 [nouveau]
[  492.914913]  schedule+0x68/0xe0
[  492.914917]  schedule_timeout+0x200/0x290
[  492.914983]  ? nouveau_fence_no_signaling+0x1d/0x90 [nouveau]
[  492.915050]  ? nouveau_fence_enable_signaling+0x31/0x70 [nouveau]
[  492.915056]  dma_fence_default_wait+0x174/0x200
[  492.915059]  ? dma_fence_release+0x150/0x150
[  492.915062]  dma_fence_wait_timeout+0xf0/0x110
[  492.915081]  drm_atomic_helper_wait_for_fences+0x84/0xf0 
[drm_kms_helper]
[  492.915150]  nv50_disp_atomic_commit_tail+0x8f/0x7f0 [nouveau]
[  492.915220]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
[  492.915225]  process_one_work+0x217/0x3e0
[  492.915228]  worker_thread+0x4a/0x3d0
[  492.915231]  ? process_one_work+0x3e0/0x3e0
[  492.915235]  kthread+0x129/0x170
[  492.915237]  ? kthread_park+0x90/0x90
[  492.915242]  ret_from_fork+0x22/0x30
[  498.010078] systemd-journald[313]: Successfully sent stream file 
descriptor to service manager.
[  615.793277] INFO: task kworker/u128:3:233 blocked for more than 245 
seconds.
[  615.793284]       Not tainted 5.10.0-rc7-next-20201209+ #1
[  615.793286] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  615.793289] task:kworker/u128:3  state:D stack:    0 pid:  233 ppid:  
    2 flags:0x00004000
[  615.793372] Workqueue: events_unbound nv50_disp_atomic_commit_work 
[nouveau]
[  615.793375] Call Trace:
[  615.793384]  __schedule+0x496/0xb40
[  615.793428]  ? nvkm_ioctl+0xf0/0x190 [nouveau]
[  615.793432]  schedule+0x68/0xe0
[  615.793435]  schedule_timeout+0x200/0x290
[  615.793502]  ? nouveau_fence_no_signaling+0x1d/0x90 [nouveau]
[  615.793569]  ? nouveau_fence_enable_signaling+0x31/0x70 [nouveau]
[  615.793575]  dma_fence_default_wait+0x174/0x200
[  615.793578]  ? dma_fence_release+0x150/0x150
[  615.793581]  dma_fence_wait_timeout+0xf0/0x110
[  615.793600]  drm_atomic_helper_wait_for_fences+0x84/0xf0 
[drm_kms_helper]
[  615.793668]  nv50_disp_atomic_commit_tail+0x8f/0x7f0 [nouveau]
[  615.793738]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
[  615.793743]  process_one_work+0x217/0x3e0
[  615.793747]  worker_thread+0x4a/0x3d0
[  615.793750]  ? process_one_work+0x3e0/0x3e0
[  615.793753]  kthread+0x129/0x170
[  615.793756]  ? kthread_park+0x90/0x90
[  615.793760]  ret_from_fork+0x22/0x30
[  738.668999] INFO: task kworker/u128:3:233 blocked for more than 368 
seconds.
[  738.669005]       Not tainted 5.10.0-rc7-next-20201209+ #1
[  738.669008] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  738.669011] task:kworker/u128:3  state:D stack:    0 pid:  233 ppid:  
    2 flags:0x00004000
[  738.669094] Workqueue: events_unbound nv50_disp_atomic_commit_work 
[nouveau]
[  738.669097] Call Trace:
[  738.669106]  __schedule+0x496/0xb40
[  738.669150]  ? nvkm_ioctl+0xf0/0x190 [nouveau]
[  738.669154]  schedule+0x68/0xe0
[  738.669157]  schedule_timeout+0x200/0x290
[  738.669224]  ? nouveau_fence_no_signaling+0x1d/0x90 [nouveau]
[  738.669291]  ? nouveau_fence_enable_signaling+0x31/0x70 [nouveau]
[  738.669296]  dma_fence_default_wait+0x174/0x200
[  738.669299]  ? dma_fence_release+0x150/0x150
[  738.669303]  dma_fence_wait_timeout+0xf0/0x110
[  738.669322]  drm_atomic_helper_wait_for_fences+0x84/0xf0 
[drm_kms_helper]
[  738.669391]  nv50_disp_atomic_commit_tail+0x8f/0x7f0 [nouveau]
[  738.669461]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
[  738.669466]  process_one_work+0x217/0x3e0
[  738.669469]  worker_thread+0x4a/0x3d0
[  738.669472]  ? process_one_work+0x3e0/0x3e0
[  738.669476]  kthread+0x129/0x170
[  738.669478]  ? kthread_park+0x90/0x90
[  738.669483]  ret_from_fork+0x22/0x30
[  803.766300] rfkill: input handler enabled
[  829.251982] nouveau 0000:03:00.0: Xorg[1867]: failed to idle channel 
6 [Xorg[1867]]
[  830.025724] systemd-journald[313]: Successfully sent stream file 
descriptor to service manager.
[  830.033209] systemd-journald[313]: Successfully sent stream file 
descriptor to service manager.
[  830.034210] systemd-journald[313]: Successfully sent stream file 
descriptor to service manager.
[  830.116092] systemd-journald[313]: Successfully sent stream file 
descriptor to service manager.
[  844.251441] nouveau 0000:03:00.0: Xorg[1867]: failed to idle channel 
6 [Xorg[1867]]
[  844.251499] nouveau 0000:03:00.0: fifo: read fault at 0000013000 
engine 07 [PFIFO] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESENT] on 
channel 6 [007f7bb000 Xorg[1867]]
[  844.251501] nouveau 0000:03:00.0: fifo: fifo engine fault on channel 
6, recovering...
[  844.251973] nouveau 0000:03:00.0: Xorg[1867]: channel 6 killed!
[  844.494747] systemd-journald[313]: Successfully sent stream file 
descriptor to service manager.
[  844.694493] nouveau 0000:03:00.0: DRM: GPU lockup - switching to 
software fbcon
