From: Luo Jinghua <sunmoon1997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: pre-nv50 KMS
Date: Sat, 23 May 2009 16:49:25 +0800
Message-ID: <beb59a440905230149m2edc3f6ak3c61a45820a66c5f@mail.gmail.com>
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

Hi, all

I'm trying to implement kms for pre-nv50 in last cuples of days. My
current work[1] is based on the code of nv50 kms & ddx. Basicly,  I
just blindly port the code to kernel land :). I think I'm getting very
close to working state, but it still doesn't work.

Current state:
1) vbios parser is synced with ddx
2) i2c works
3)  Something shows on internel LVDS panel and external DVI flat
panel, but the image is distorted. If I connect the monitor with my
latop via the VGA port and resolution is higher then 1028x1024, it
will say no signal. At lower resultion it shows distorted image. My
monitor native resolution is 1920x1080. You get some idea and know
what is going wrong. I did check the mode_state of ddx and kms, the
are almostly the same except the fb_start and cursor_offset are
different as expected.

[1] git://anongit.freedesktop.org/~jinghua/drm modesetting-gem branch
-- 
Luo Jinghua
