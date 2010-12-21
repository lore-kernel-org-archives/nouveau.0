From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: DMA pusher encountered while using XVideo
Date: Tue, 21 Dec 2010 20:32:55 +0100
Message-ID: <AANLkTikCjkvJ8yMAM1uttn9RrYP_pA7pETcXPQWLQaOe@mail.gmail.com>
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

I realise that the the values PGRAPH complains about are indeed wrong,
the question is how did they end up corrupted like this? I'm assuming
since this is a SIFC transfer and method 0x860 is SIFC_DATA that the
PFIFO errors are a symptom of an earlier problem, the same thing that
caused the PGRAPH errors. This is a fairly recent nouveau kernel, a
few commits behind the latest one.

Any ideas how to pursue this problem?


[16832.259025] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2 Get
0x00200502ec Put 0x0020054400 IbGet 0x0000089f IbPut 0x000008a0 State
0x80004860 Push 0x00406040
[16832.271320] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR INVALID_VALUE
[16832.271331] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR
[16832.271345] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2
(0x00007a0000) subc 2 class 0x502d mthd 0x084c data 0xff307dda
[16832.271357] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR INVALID_VALUE
[16832.271366] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR
[16832.271377] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2
(0x00007a0000) subc 2 class 0x502d mthd 0x0854 data 0xff2e7cd8
[16832.271389] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR INVALID_VALUE
[16832.271396] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR
[16832.271407] [drm] nouveau 0000:01:00.0: PGRAPH - ch 2
(0x00007a0000) subc 2 class 0x502d mthd 0x085c data 0xff2d7ad4
[16860.259096] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2 Get
0x00200608ac Put 0x0020064290 IbGet 0x00000ac1 IbPut 0x00000ac2 State
0x80004861 Push 0x00406040
[16962.217582] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2 Get
0x00200503e8 Put 0x0020054474 IbGet 0x000000bd IbPut 0x000000be State
0x80002054 Push 0x00406040
[17165.555724] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2 Get
0x0020040000 Put 0x0020043cb0 IbGet 0x00000d3d IbPut 0x00000d3e State
0x80002054 Push 0x00406040
[17187.315735] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2 Get
0x00200503e8 Put 0x0020054474 IbGet 0x00000405 IbPut 0x00000407 State
0x80002054 Push 0x00406040
[17232.210475] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2 Get
0x00200508ac Put 0x0020054290 IbGet 0x00000439 IbPut 0x0000043a State
0x80004861 Push 0x00504031
[17232.213417] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2 Get
0x0020054290 Put 0x0020054290 IbGet 0x00000439 IbPut 0x0000043a State
0x80000000 Push 0x00406040

-- 
Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
