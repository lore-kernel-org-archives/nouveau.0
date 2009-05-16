From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: nv50: shader generation patches
Date: Sat, 16 May 2009 21:22:30 +0200
Message-ID: <4A0F1276.6060403@student.tuwien.ac.at>
References: <4A01664B.3080500@student.tuwien.ac.at>
	<aa85b9420905160012v4d05bfc4t90280ca1cf42fe67@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <aa85b9420905160012v4d05bfc4t90280ca1cf42fe67-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Kamil Kaminski <kamilkss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello Kamil,
Nope, nothing's got commited so far, and I'm thinking about creating an
account so I can do so, but I'd really feel better if someone reviewed
my stuff first.

Thanks for your interest, I'd be happy if you tested my patches and told
me if you get any improvements or regressions with them.
Since they're in git yet, just pluck them from the list (I've just sent
some updates) and apply them to mesa master.

You could start with the mesa demos, which should mostly work now. There
seems to be some evil bug though that causes the shaders be overwritten
in VRAM, or maybe they somehow don't even get uploaded there (although
by all means they should be). This causes some seemingly random graphics
corruptions that can change depending on whether you use a debugger or
when you turn some demo options (fog, textures) on and off in different
order.
I can get around that by uploading the shader code everytime it is used,
but that's not a solution.

As for more complex apps, they probably won't work because of the (often
mentioned) memory manager situation, and probably other bugs.
I so far tried neverball and neverputt, which lockup the GPU after a few
seconds (accidentally I found out they don't and work fine if one has
started X11 with the blob before, without rebooting); and glest, which
displays a pretty messed up menu and hangs when you start a
mission/skirmish.

Thanks again for your interest, Christoph.

Kamil Kaminski schrieb:
> Hi Chris,
> Did this (and other patches that you wrote) get merged yet? Did you create
> an account? I'm interested in your work and would like to test it.
> 
