From: Tyler Durden <tylerdu-8Y23ZgqdBYRBDLzU/O5InQ@public.gmane.org>
Subject: Display not refreshing when not moving mouse
Date: Mon, 19 Nov 2012 22:58:27 +0100
Message-ID: <50AAAB83.10301@bounced.me>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Dear nouveau developers and users!

After many years of dealing with the blob in my kernel, I decided it was time to move to an open source solution. With one of my machines, equipped with 9500GT it went almost flawlessly. I had to patch kernel to get GLXVBlank option working (only because I used the latest and greatest 3.7-rc6), but that is all, and I'm very happy with the result. Nouveau on that particular machine runs really great!

But, after many hours of fighting I must ask for help with another machine, which has 9600GT in it. I'm stuck on a very strange problem, where display doesn't refresh (everything stops) until I move the mouse. Terminal with vmstat 1 in it stops refreshing, video stops, glxgears stops, everything. If I drag mouse around frantically, screen refreshes normally.

The machines are quite similar, debian + compiz + xfce, so I went further, searching for some lowlevel or even hw cause for such behaviour. I found that on the problematic one the video card shares interrupts with the PCIe storage device, namely sata_sil24 and I also saw this in dmesg: "sata_sil24: Applying completion IRQ loss on PCI-X errata fix". So, I though, maybe enabling MSI interrupts would solve the problem. Went back to 3.6 kernel where nouveau driver has support for MSI interrupts, enabled it, but it didn't help (same behaviour). I also thought about moving the other card in a different PCIe slot, but it can't be done (both require x16 slot, and I have only two). This is where I lost hope. I must also note that the blob works correctly on the same setup, both with IO-APIC and MSI
  interrupts. So, I'm not even sure I'm on the right path debugging all this. Maybe it's a dead end, and the problem is elsewhere?

Beside kernel, which I compile from Linus' git tree, I have standard Debian packages from sid distribution:

ii  libdrm-nouveau1a:amd64             2.4.33-3
ii  xserver-xorg-video-nouveau         1:1.0.1-4
ii  libgl1-mesa-dri:amd64              8.0.5-1
ii  xserver-xorg-core                  2:1.12.4-3

Any help on this issue would be greatly appreciated. I can provide any additional data needed, or help test experimental patches.
-- 
Tyler
