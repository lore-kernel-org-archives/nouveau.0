From: Carlos Garces <carlos.garces-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Bad performace for NV18 driver
Date: Fri, 7 Jun 2013 23:56:46 +0200
Message-ID: <CAD-addk1m19g_onyyM1Lx4Rnji32sPDpAffHaJ=39=33aZGnHg@mail.gmail.com>
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

Hi!

I have some strange results on my test with nouveau drivers

I'm using a old GeForce4 MX 4000 (NV18) with 128 MB.

I have made 2 test.

-The default configuration, using nomodeset without nouveau_vieux_dri.so

$inxi -G
Graphics:  Card: NVIDIA NV18 [GeForce4 MX 4000]
           X.Org: 1.12.4 drivers: vesa,nouveau (unloaded: fbdev)
Resolution: 1024x768@0.0hz
           GLX Renderer: N/A GLX Version: N/A

-The "optimized" configuration, after removing nomodeset, installing
the 3d driver (nouveau_vieux_dri.so, package libgl1-mesa-dri) and
configure the xorg to use only nouveau

$inxi -G
Graphics:  Card: NVIDIA NV18 [GeForce4 MX 4000] X.Org: 1.12.4 driver:
nouveau Resolution: 800x600-XyBiMD9AD2I@public.gmane.org
           GLX Renderer: Mesa DRI nv18 x86/MMX+/3DNow!+/SSE GLX
Version: 1.2 Mesa 8.0.5

The resolution is 800x600 because was impossible for me set up  1024x768

There is the full xorg log
http://pastebin.com/2ZbMwyRK

The results are strange for me. I expect better performance on
"optimized" configuration but some test using Cairo are very bad (0,54
vs  5,38).

The test are available at
http://openbenchmarking.org/result/1306076-UT-2DGPUTEST63

Any idea to improve the performace of NV18?
Any know issue with nouveau_vieux_dri.so and NV18?
