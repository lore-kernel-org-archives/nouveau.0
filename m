From: Garnet MacPhee <garnet-vVazHDhchvNCCzmm7wA0Mw@public.gmane.org>
Subject: Re: Cannot compile nouveau.o in drm with kernel 2.6.26
Date: Sat, 19 Jul 2008 07:55:34 -0600
Message-ID: <4881F256.3030303@signalpeak.net>
References: <488133D7.7050808@signalpeak.net>
	<20080719103932.7a35029e@ct200006>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20080719103932.7a35029e@ct200006>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

OK, I found the problem.

Running 'make clean' after compiling 2.6.26 will remove /usr/src/linux-2.6.26/include/linux/bounds.h. This is a change in 
behavior from 2.6.25 and earlier kernels.

I have always run 'make clean' (NOT make mrproper) after compiling a kernel, more out of habit than anything else, I guess. It 
never caused a problem before.

I am now happily running nouveau on kernel 2.6.26. Sorry about making noise on the list, but hopefully this will save somebody 
some time and hassle. I don't know what the long term solution should be, whether 'make clean' should be changed back to its 
previous behavior, whether drivers should stop referencing bounds.h, or whether people just have to change their behavior and 
not run 'make clean' after compiling.
