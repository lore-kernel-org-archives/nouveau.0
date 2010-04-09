From: "Shinpei KATO" <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Subject: Re: SERIALIZE command
Date: Sat, 10 Apr 2010 03:31:32 +0900
Message-ID: <000401cad812$e33e6ad0$a9bb4070$@is.s.u-tokyo.ac.jp>
References: <000c01cad7f4$e7d0e6e0$b772b4a0$@is.s.u-tokyo.ac.jp>
	<201004091511.04752.koriakin@0x04.net>
	<000e01cad7fc$f7ff8910$e7fe9b30$@is.s.u-tokyo.ac.jp>
	<201004091605.34175.koriakin@0x04.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201004091605.34175.koriakin-mP9o5jsk0RY@public.gmane.org>
Content-Language: ja
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?utf-8?Q?'Marcin_Ko=C5=9Bcielnicki'?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a follow-up.

> The command is known to work on all NV50 objects. Pre-NV50, only a few objects
> support it, and I'm not fully certain if the address is 0x108 or 0x110...
> it's
> 0x110 at least on the NV40 3d object.

I tried inserting the 0x110 commands with NvSubM2MF (subc=0), MvSubSw (subc=1), NvSub2D (subc=2), NvSubGdiRect (subc=3), NvSubImageBlit (subc=4).
As a result, I got the PFIFO_CACHE_ERROR interrupts, with respect to those with NvSubSw and NvSubImageBlit.
I am really not certain what PFIFO_CACHE_ERROR indicates, but seems they do not work correctly?
Well, those with NvSubM2MF, NvSub2D and NvSubGdiRect are still very helpful though.

Thanks,
- Shinpei
