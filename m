From: Jasper Bryant-Greene <jasper-XrxwZhJB1KNIJsTUW+i+0g@public.gmane.org>
Subject: NV86 (Quadro NVS 140M) errors in dmesg
Date: Sat, 02 Aug 2008 10:20:52 +1200
Message-ID: <1217629252.3619.5.camel@luna.unix.geek.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

In case it's any use for debugging, I get these error messages in dmesg
on my NV86 (Quadro NVS 140M) card:

[   21.729435] [drm] Initialized drm 1.1.0 20060810
[   21.749414] nouveau 0000:01:00.0: power state changed by ACPI to D0
[   21.749425] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) ->
IRQ 16
[   21.749432] nouveau 0000:01:00.0: setting latency timer to 64
[   21.749528] [drm] Detected an NV50 generation card (0x086900a2)
[   21.749530] [drm] Initialized nouveau 0.0.11
drm-2.3.0-1351-g4585787bd1a1d782b on minor 0
[   22.586502] [drm:nouveau_graph_trapped_channel] *ERROR* AIII,
invalid/inactive channel id 128
[   22.586509] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
[   22.586513] [drm] PGRAPH_ERROR - Ch -1/0 Class 0x0000 Mthd 0x0000
Data 0x00000000:0x00000000
[   22.586521] [drm] Allocating FIFO number 1
[   22.593281] [drm] nouveau_fifo_alloc: initialised FIFO 1
[   22.593918] [drm] Allocating FIFO number 2
[   22.600736] [drm] nouveau_fifo_alloc: initialised FIFO 2

I'm happy to do any further debugging if the above are real errors.

Also, Xvideo does not work properly, with mplayer printing a large
number of these:

X11 error: BadMatch (invalid parameter attributes)

... and the screen remaining at a corrupted view of the desktop while
audio plays.

Otherwise, 2D performance is great. Haven't attempted any 3D as I don't
really have any use for 3D rendering.

-jasper
