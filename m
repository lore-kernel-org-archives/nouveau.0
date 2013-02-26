From: =?ISO-8859-1?Q?Viktor_Novotn=FD?= <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
Subject: Re: Nvidia Quadro 4 on CRT monitor: Frequency out of
	range...
Date: Tue, 26 Feb 2013 23:22:09 +0100
Message-ID: <512D3591.6020602@seznam.cz>
References: <kgg4v8$oeu$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <kgg4v8$oeu$1@ger.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Manuel Reimer <Manuel.Spam-Xv0xCBoRcaZkYx7DZD8BGw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Dne 25.2.2013 17:46, Manuel Reimer napsal(a):
> Hello,
>
> I'm currently failing to install Linux to an older PC. It has a Nvidia Quadro 4 graphics adapter built in and is connected to a 21" CRT monitor.
>
> Shortly after the kernel started to boot, my screen says "Frequency out of range".
>
> Is there any way to fix this?

Hello,
you didn't state version of your kernel nor chipset of your card, but if it was nv25, it might have been fixed by
1f2285d462 drm/nouveau/clk: fix crystal frequency retrieval on nv25.
If it hasn't, you might want to open a bug report (see http://nouveau.freedesktop.org/wiki/Bugs).

Viktor
