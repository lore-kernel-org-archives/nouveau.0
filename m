From: Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
Subject: Latest xf86-video-nouveau does not compile
Date: Sun, 3 Jan 2010 01:33:36 +0100
Message-ID: <201001030133.37138.johannesobermayr@gmx.de>
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

Hi,

latest 2D driver does not compile.

libdrm and Mesa are latest git...

Johannes


CC nv50_exa.lo
nv50_exa.c: In function 'NV50EXACheckRenderTarget':
nv50_exa.c:451: error: 'PICT_a2b10g10r10' undeclared (first use in this function)
nv50_exa.c:451: error: (Each undeclared identifier is reported only once
nv50_exa.c:451: error: for each function it appears in.)
nv50_exa.c:452: error: 'PICT_x2b10g10r10' undeclared (first use in this function)
nv50_exa.c:453: error: 'PICT_a2r10g10b10' undeclared (first use in this function)
nv50_exa.c:454: error: 'PICT_x2r10g10b10' undeclared (first use in this function)
nv50_exa.c: In function 'NV50EXARenderTarget':
nv50_exa.c:485: error: 'PICT_a2b10g10r10' undeclared (first use in this function)
nv50_exa.c:486: error: 'PICT_x2b10g10r10' undeclared (first use in this function)
nv50_exa.c:489: error: 'PICT_a2r10g10b10' undeclared (first use in this function)
nv50_exa.c:490: error: 'PICT_x2r10g10b10' undeclared (first use in this function)
nv50_exa.c: In function 'NV50EXACheckTexture':
nv50_exa.c:537: error: 'PICT_b8g8r8a8' undeclared (first use in this function)
nv50_exa.c:538: error: 'PICT_b8g8r8x8' undeclared (first use in this function)
nv50_exa.c:539: error: 'PICT_a2b10g10r10' undeclared (first use in this function)
nv50_exa.c:540: error: 'PICT_x2b10g10r10' undeclared (first use in this function)
nv50_exa.c:541: error: 'PICT_x2r10g10b10' undeclared (first use in this function)
nv50_exa.c:542: error: 'PICT_a2r10g10b10' undeclared (first use in this function)
nv50_exa.c: In function 'NV50EXATexture':
nv50_exa.c:637: error: 'PICT_b8g8r8x8' undeclared (first use in this function)
nv50_exa.c:640: error: 'PICT_b8g8r8a8' undeclared (first use in this function)
nv50_exa.c:643: error: 'PICT_a2b10g10r10' undeclared (first use in this function)
nv50_exa.c:646: error: 'PICT_x2b10g10r10' undeclared (first use in this function)
nv50_exa.c:649: error: 'PICT_x2r10g10b10' undeclared (first use in this function)
nv50_exa.c:652: error: 'PICT_a2r10g10b10' undeclared (first use in this function)
make[2]: *** [nv50_exa.lo] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory `/usr/src/packages/BUILD/xf86-video-nouveau/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/usr/src/packages/BUILD/xf86-video-nouveau'
make: *** [all] Error 2
error: Bad exit status from /var/tmp/rpm-tmp.8bVOVF (%build)
