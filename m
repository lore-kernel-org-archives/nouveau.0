From: Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Kernel module fails to initialize on AMD751 based
	system with NV34
Date: Mon, 24 May 2010 21:49:52 +0200
Message-ID: <AANLkTikAoSDZvmlqRmw2zbqGd8NNWXYGczKvs_GLZYG6@mail.gmail.com>
References: <AANLkTilecapB4FA9X-aufTLQql_-tkjv786dkH8L2H9N@mail.gmail.com>
	<AANLkTim9Eh1tnMgYM_NyGkjQI9cq0wyvUbZkd1IeaVo-@mail.gmail.com>
	<AANLkTilNGyLcP8Dr95RJJx1T5lWBXbRmB1ZtnbRBJBA6@mail.gmail.com>
	<AANLkTinDO1dTAEm8cFA9rQ5ba2tkubCtrDgGgHymjt4M@mail.gmail.com>
	<AANLkTilhznHd9eMZPAQTRTndH8lzY37WyizviXebe3Mk@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTilhznHd9eMZPAQTRTndH8lzY37WyizviXebe3Mk-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

> Both cards show BusMaster- when it should be BusMaster+. Also both
> cards have 2 BARs instead of 3. Check your BIOS settings to see if
> there's a switch to enable bus mastering. This is an AGP card right?
> If it was a PCI card I'd say plug it into another slot since some
> slots on some mobos can't do bus mastering, but if it's AGP the only
> thing left is a BIOS switch. Just guessing at this point.

Yes the board is AGP so no chance of plugging it into another slot ;)
I'll see if I can find some options in the BIOS, thanks for the hint.

Just out of curiosity, do you have any idea how the proprietary driver
is able to work arround that problems?
I tried 173.??? today because vesa/nv are horrible, and although its
not really fast in 2D it works.

Thanks for all your patience and help so far!

Thanks, Clemens
