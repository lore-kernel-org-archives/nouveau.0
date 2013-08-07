From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Nouveau Digest, Vol 76, Issue 9
Date: Wed, 7 Aug 2013 00:04:39 -0400
Message-ID: <CAKb7UvhFyM82zNqtQ-5CZdSvZhe7F00MM8sHm28GyrRkhvK-WQ@mail.gmail.com>
References: <mailman.72.1375815671.15587.nouveau@lists.freedesktop.org>
	<CAChxqKtQSJC8kfNcdv3u2uJBWUCzpQAPKf+v7qXySftCZbNWyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAChxqKtQSJC8kfNcdv3u2uJBWUCzpQAPKf+v7qXySftCZbNWyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Prasad Mhatre <prasad8mhatre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Aug 6, 2013 at 11:58 PM, Prasad Mhatre <prasad8mhatre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
> I am Prasad ,a third year computer engineering student in pune,india.
> I have followed the steps given in the document of tracing
> but getting errors at second step.
>
> I am using ASUS  k55vd-sx314d
> specs:ci3-2350m
> 4gb ram, 500hdd,2 gb nvidia geforce 610m
> os:ubuntu 13.04
>
> I am new to linux ,I wanted to get involved in this nouveau project
> how to get into i
> can someone guide me from and how to start contributing to this project
>
>
>
>
>>>echo 64000 > /sys/kernel/debug/tracing/buffer_size_kb
>>>>//error :file doesn't exist

You probably don't have debugfs mounted on /sys/kernel/debug or you
don't have mmiotrace enabled in your kernel. Or you're not doing this
as root. Take a look at https://wiki.ubuntu.com/X/MMIOTracing which
has some good instructions.
