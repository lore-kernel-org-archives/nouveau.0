From: Martin Kaffanke <martin.kaffanke-RbZlAiThDcE@public.gmane.org>
Subject: Trouble on kernel
Date: Mon, 28 Oct 2013 08:45:29 +0100
Message-ID: <526E1619.9060402@gmx.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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

Hi there,

Sometimes my computer crashes since i use now ubuntu 13.10 with 
unity/compiz.

dmesg tells me:

[  686.209019] nouveau E[    PBUS][0000:00:0d.0] MMIO write of 
0x00000000 FAULT at 0x00b020

and later:

[ 1425.565441] nouveau E[  PGRAPH][0000:00:0d.0]  ERROR nsource: 
DATA_ERROR nstatus: BAD_ARGUMENT
[ 1425.565462] nouveau E[  PGRAPH][0000:00:0d.0] ch 3 [0x00056000 
compiz[1970]] subc 2 class 0x0039 mthd 0x0314 data 0x031dc000

So I don't really know where to start for debugging,
if you could help me that would be great.

Full dmesg output on http://ubuntuone.com/3AVhp6HT2jU26HdfguAbdV

thanks,
Martin
