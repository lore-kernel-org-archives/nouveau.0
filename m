From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: Memory use and a few other things
Date: Wed, 2 Apr 2008 20:40:22 +0200
Message-ID: <6a89f9d50804021140w7992fbd1o79ec115e053c9411@mail.gmail.com>
References: <194f62550804020738u6c03bfb4g3d655bc232d21684@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <194f62550804020738u6c03bfb4g3d655bc232d21684-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
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

On 4/2/08, Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
>  First of all thanks a lot for working on this free nvidia driver.
>
>  1.) I am using Fedora9-Beta, and on my NV17/64mb (or NV18?) powered
>  Laptop the nouveau driver uses about 300mb RAM. Is there any way I can
>  decrease that?
>

This is AGP memory. It's (usually 256MB of) memory mapped into X.Org,
and it's not actually used (only a small part of it for scratch
usage). All drivers making use of AGP do that.

>  2.) Font rendering is very slow. running "x11perf --aa10text" I only
>  get 40k glyphs/s.
>  Is there any way I can improve text performance?
>

Work on core EXA.

>  3.) I would like to downgrade to linux-2.6.16.60 - because a driver I
>  need was broken starting arround 2.6.19. Will it still make sence to
>  use nouveuau, or does it need DRI to work properly?
>

See Pekka's Answer.

Stephane
