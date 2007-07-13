From: "Pekka Paalanen" <inventor-E01nCVcF24I@public.gmane.org>
Subject: Re: Does Nouveau break the nVidia drivers?
Date: Fri, 13 Jul 2007 14:00:51 +0300 (EEST)
Message-ID: <10164.84.249.198.26.1184324451.squirrel@webmail.mbnet.fi>
References: <30c82f5f0707120641v45a01c72yb3a828271d1d64f9@mail.gmail.com>
	<46965347.20005@sms.ed.ac.uk>
	<30c82f5f0707121009o55e1c4dfo6c5a4cc4d7db51da@mail.gmail.com>
	<469668BB.8030003@sms.ed.ac.uk>
	<30c82f5f0707121048o4453a2b6n57e752468ef7a2d2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <30c82f5f0707121048o4453a2b6n57e752468ef7a2d2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Louise Hoffman <louise.hoffman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> So I can't try send dumps to Nouveau without breaking livna nVidia
> drivers? =(

Dear Louise,

if you only want to send dumps, I'm afraid everyone has so far only
mislead you.

The dumps (renouveau[1] and kmmio[2]) are for the reverse engineering
effort. They need the proprietary driver up and running. After all, there is
little point in spying the Nouveau driver as it is open source. We want to
know what the proprietary driver does, so we can guess how the card works.

On the other hand, if you want to try the Nouveau driver, you need the
kernel bits (DRM) and Xorg driver bits (DDX), and preferably not the Mesa
bits (DRI) unless you want to try your luck with glxgears (I forget which
card you have, nv4x cards have a chance). All these bits you get from the
respective git repositories [3]. I do not know why people have recommended
building a new kernel, that is usually not needed. The DRM bits are built
out of kernel tree anyway, you just have to make sure the in-kernel drm.ko
module is not used (if it is not a module but is built-in, then you need a
new kernel).

Thanks.


[1] http://nouveau.freedesktop.org/wiki/REnouveau
[2] http://nouveau.freedesktop.org/wiki/MmioTrace
[3] http://nouveau.freedesktop.org/wiki/InstallNouveau

-- 
pq from his secondary email client
