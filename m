From: Anca Emanuel <anca.emanuel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: INVALID_CMD and DATA_ERROR INVALID_VALUE
Date: Mon, 11 Feb 2013 10:49:28 +0200
Message-ID: <CAJL_dMuHb8fYdhLSELrC4kZpALn1eLb1TwLmi6nRusZcxufK4w@mail.gmail.com>
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

Hi.
I am running 3.8-rc6 (Ubuntu Raring). I have an GeForce 8800GT.

I found this in dmesg:

[  807.862867] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - Ch 2 Get
0x0020030b48 Put 0x0020032dec IbGet 0x00000089 IbPut 0x0000008a State
0x8000f240 (err: INVALID_CMD) Push 0x00704031
[ 1469.668718] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE
[ 1469.668725] nouveau E[  PGRAPH][0000:01:00.0]  DATA_ERROR
[ 1469.668731] nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x001fad9000]
subc 7 class 0x8297 mthd 0x1288 data 0x00044110
[ 1520.790060] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - Ch 2 Get
0x002003472c Put 0x0020036208 IbGet 0x000003bc IbPut 0x000003bd State
0x80004861 (err: INVALID_CMD) Push 0x00406040


This is normal ? (I think not)
