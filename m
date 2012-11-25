From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Reproducible "PGRAPH TLB flush timeout" hang on NV96
Date: Sun, 25 Nov 2012 23:50:50 +0100
Message-ID: <CAGZ4FETtxUpuFO+=rF8qFn22jXVNceN9NZSNzqWqrkooUg-QGQ@mail.gmail.com>
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

Hi everyone,

I was wondering what to do to dig into this problem further.The kernel
is several weeks old (nouveau tree), it's at commit
000463f13fba6b2f94a5bfcb0d615751ae9c34a0.

As you can see from the mesages below the problem is reproducable to
the point of getting exactly the same error.

Nov 25 17:57:51 madman kernel: [548360.773743] nouveau E[
PGRAPH][0000:01:00.0] PGRAPH TLB flush idle timeout fail: 0x019ffe03
0x00145009 0x0000102d 0x0034db43
Nov 25 19:34:09 madman kernel: [ 5623.952688] nouveau E[
PGRAPH][0000:01:00.0] PGRAPH TLB flush idle timeout fail: 0x019ffe03
0x00145009 0x0000102d 0x0034db43
Nov 25 22:54:47 madman kernel: [ 7854.679007] nouveau E[
PGRAPH][0000:01:00.0] PGRAPH TLB flush idle timeout fail: 0x019ffe03
0x00145009 0x0000102d 0x0034db43
Nov 25 23:04:33 madman kernel: [  540.388597] nouveau E[
PGRAPH][0000:01:00.0] PGRAPH TLB flush idle timeout fail: 0x019ffe03
0x00145009 0x0000102d 0x0034db43

I also updated the kernel to latest because it has the improved parsing:

Nov 25 23:42:57 madman kernel: [  169.014553] nouveau E[
PGRAPH][0000:01:00.0] PGRAPH_STATUS  : 0x019ffe03 BUSY DISPATCH VFETCH
CCACHE_UNK4 STRMOUT_GSCHED_UNK5 UNK14XX UNK24XX_CSCHED UNK1CXX CLIPID
ZCULL ENG2D UNK34XX TPRAST TPROP MP ROP
Nov 25 23:42:57 madman kernel: [  169.014564] nouveau E[
PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0: 0x00145009 VFETCH CCACHE
Nov 25 23:42:57 madman kernel: [  169.014569] nouveau E[
PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1: 0x0000102d MP
Nov 25 23:42:57 madman kernel: [  169.014573] nouveau E[
PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2: 0x0034db43 ENG2D ROP

Do you have any ideas to find out what is causing this?

Sincerely,

Maarten.

-- 
Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
