From: Paolo Milani <paolomilani-ur4TIblo6goN+BqQ9rBEUg@public.gmane.org>
Subject: GeForce FX 5200: no kms
Date: Sat, 13 Nov 2010 22:25:45 +0000 (GMT)
Message-ID: <149407.88857.qm@web28311.mail.ukl.yahoo.com>
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

Hi all!
According to feature matrix http://nouveau.freedesktop.org/wiki/FeatureMatrix kms on GeForce FX 5200 is supported, but on my system it's not working. I've tried with fedora 14 and k/ubuntu 10.10, but the screen is blank and the system is freezed (the monitor is connected as vga). If I set nomodeset option boot, the system boots ok. Any hope? many thanks.



lspci -nn
01:00.0 VGA compatible controller [0300]: nVidia Corporation NV34 [GeForce FX 5200] [10de:0322] (rev a1)


dmesg| grep drm
[    1.402751] [drm] Initialized drm 1.1.0 20060810
[    2.360634] [drm] nouveau 0000:01:00.0: Detected an NV30 generation card (0x034200b1)
[    2.361026] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0
