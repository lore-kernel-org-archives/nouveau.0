From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17357] NV4B 10DE:0393 funny stripes in video flash
 when using nouveau
Date: Fri, 12 Sep 2008 02:08:52 -0700 (PDT)
Message-ID: <20080912090852.83A6B130009@annarchy.freedesktop.org>
References: <bug-17357-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-17357-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=17357





--- Comment #8 from Mark Carey <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-09-12 02:08:50 PST ---
Danny, 

nouveau driver version has now cnaged, ROAF pushed an update.

I stopped vmware from starting on boot.

xvinfo reports I have 

  Adaptor #0: "NV40 texture adapter"
    number of ports: 32
    port base: 128

  Adaptor #1: "NV40 high quality adapter"
    number of ports: 32
    port base: 160

  Adaptor #2: "NV Video Blitter"
    number of ports: 16
    port base: 192

mplayer Home-made-olympics.wmv -vo xv:port={128, 160, 192}

All result in the same artifacts in the video.

dmesg reports

[   64.891532] Bluetooth: RFCOMM TTY layer initialized
[   64.891534] Bluetooth: RFCOMM ver 1.8
[   66.026122] [drm] Initialized drm 1.1.0 20060810
[   66.142744] ACPI: PCI Interrupt 0000:01:00.0[A] -> GSI 16 (level, low) ->
IRQ 16
[   66.142755] PCI: Setting latency timer of device 0000:01:00.0 to 64
[   66.142829] [drm] Detected an NV40 generation card (0x04b300a2)
[   66.142833] [drm] Initialized nouveau 0.0.11
drm-2.3.0-1592-gcd7d71f19cf2a1652 on minor 0
[   66.611961] [drm] Allocating FIFO number 0
[   66.613996] [drm] nouveau_fifo_alloc: initialised FIFO 0
[   66.614398] [drm] Allocating FIFO number 1
[   66.616272] [drm] nouveau_fifo_alloc: initialised FIFO 1
[   67.169154] eth0: no IPv6 routers present
[ 1017.330778] [drm] no space left after collision
[ 1017.330784] [drm:nouveau_ramht_insert] *ERROR* RAMHT space exhausted. ch=1
[ 1017.330789] [drm:nouveau_notifier_alloc] *ERROR* Error referencing notifier
ctxdma: -12

/var/log/messages notes

Sep 12 20:45:19 hereford kernel: [   64.891532] Bluetooth: RFCOMM TTY layer
initialized
Sep 12 20:45:19 hereford kernel: [   64.891534] Bluetooth: RFCOMM ver 1.8
Sep 12 20:45:20 hereford kernel: [   66.026122] [drm] Initialized drm 1.1.0
20060810
Sep 12 20:45:20 hereford kernel: [   66.142744] ACPI: PCI Interrupt
0000:01:00.0[A] -> GSI 16 (level, low) -> IRQ 16
Sep 12 20:45:20 hereford kernel: [   66.142829] [drm] Detected an NV40
generation card (0x04b300a2)
Sep 12 20:45:20 hereford kernel: [   66.142833] [drm] Initialized nouveau
0.0.11 drm-2.3.0-1592-gcd7d71f19cf2a1652 on minor 0
Sep 12 20:45:20 hereford kernel: [   66.611961] [drm] Allocating FIFO number 0
Sep 12 20:45:20 hereford kernel: [   66.613996] [drm] nouveau_fifo_alloc:
initialised FIFO 0
Sep 12 20:45:20 hereford kernel: [   66.614398] [drm] Allocating FIFO number 1
Sep 12 20:45:20 hereford kernel: [   66.616272] [drm] nouveau_fifo_alloc:
initialised FIFO 1
Sep 12 21:01:12 hereford kernel: [ 1017.330778] [drm] no space left after
collision

Even with the collision entry and the RAMHT space exhausted video continues to
play, will attach updated dmesg, /var/log/Xorg.0.log and /var/log/messages 


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
