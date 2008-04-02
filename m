From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Memory use and a few other things
Date: Wed, 2 Apr 2008 21:17:19 +0300
Message-ID: <20080402211719.6c2c622c@daedalus.pq.iki.fi>
References: <194f62550804020738u6c03bfb4g3d655bc232d21684@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <194f62550804020738u6c03bfb4g3d655bc232d21684-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 2 Apr 2008 16:38:03 +0200
"Clemens Eisserer" <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hello,
> 
> First of all thanks a lot for working on this free nvidia driver.
> 
> 1.) I am using Fedora9-Beta, and on my NV17/64mb (or NV18?) powered
> Laptop the nouveau driver uses about 300mb RAM. Is there any way I can
> decrease that?

Why do you say it is nouveau taking the memory?
How do you measure memory consumption?
Does running 'find /' after fresh boot raise memory consumption radically?
Do you get any tangible effects of running out of memory, like triggering
the OOM killer in kernel or considerably consuming swap space?
Coult you post 'free -m' and 'slabtop' (press c to order by size)
output for cases with and without the excessive memory usage?
Which kernel do you experience this with?

I have heard of two memory usage anomalies, one is an accounting
bug/feature, the other might be a real leak since it increases swap
usage.

> 3.) I would like to downgrade to linux-2.6.16.60 - because a driver I
> need was broken starting arround 2.6.19. Will it still make sence to
> use nouveuau, or does it need DRI to work properly?

Nouveau does not need DRI (which usually refers to the user space 3D driver),
but it does need the DRM kernel modules. I do not know if they are supposed
to work on that old kernel, but you can try.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
