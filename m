From: per qu <per.qu-06ZeP6ie+xM@public.gmane.org>
Subject: Dumps for GeForce 8500 GT
Date: Tue, 4 Sep 2007 06:57:11 +0200
Message-ID: <61713f228aad584c32b99efecfebd406@87.10.210.198>
Reply-To: per qu <per.qu-06ZeP6ie+xM@public.gmane.org>
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

Hello,
I would like to send you the dump for that card, but unfortunately renouveau
crashes.
Please ask me if I could do something more.

Best regards.



This is what lspci reports about the card:
--------------------------------------------------------------------------------
# lspci -n | grep 10de
02:00.0 0300: 10de:0421 (rev a1)

# lspci -vs 02:00
02:00.0 VGA compatible controller: nVidia Corporation Unknown device 0421
(rev a1) (prog-if 00 [VGA])
        Flags: bus master, fast devsel, latency 0, IRQ 24
        Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Memory at f8000000 (64-bit, non-prefetchable) [size=32M]
        I/O ports at dc00 [size=128]
        [virtual] Expansion ROM at fbde0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [68] Message Signalled Interrupts: Mask- 64bit+
Queue=0/0 Enable-
        Capabilities: [78] Express Endpoint IRQ 0
--------------------------------------------------------------------------------

This is what renouveau prints on console:
--------------------------------------------------------------------------------
$ ./renouveau
9/75 test_draw_buffer                                 
No Stereo context. Skipping stereo tests
No double buffering. Skipping double buffer tests
No GL_EXT_vertex_weighting extension.                                  
No GL_NV_texgen_emboss extension.                                 
GL_NV_vertex_program3 crashes up until driver 100.14.06 on G80 - skipping.
Segmentation faultane_after_vertex
--------------------------------------------------------------------------------
 
 --
 Email.it, the professional e-mail, gratis per te: http://www.email.it/f
 
 Sponsor:
 Comunicazione NON verbale: impara il linguaggio del corpo e ottieni
successo nella vita e negli affari  
 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=6931&d=20070904
