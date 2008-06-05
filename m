From: "Christopher Halse Rogers" <chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau on GeForce 7950GTX (NV49)
Date: Thu, 5 Jun 2008 12:11:50 +1000
Message-ID: <38afb7ef0806041911y17e8e9f5md821da7f3a9ba054@mail.gmail.com>
References: <20080605014421.GA21067@kallisti.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20080605014421.GA21067-SVDB5bKDY2NzbRFIqnYvSA@public.gmane.org>
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
To: Ross Vandegrift <ross-SVDB5bKDY2NzbRFIqnYvSA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 6/5/08, Ross Vandegrift <ross-SVDB5bKDY2NzbRFIqnYvSA@public.gmane.org> wrote:
> Hi everyone,
>
>  I just finished installing the current git of the nouveau driver for
>  my NV49 based 7950GTX.  I attempted this because I've been continually
>  frustrated by the constantly degrading 2D performance of X under the
>  nvidia and nv drivers.  Webpages that do any kind of compositing in
>  Mozilla will burn CPU all day long.
>
>  I'm happy to say that I'm writing because I didn't have any problems.
>  Installation per the wiki was easy and sensible against the current
>  git of Linus's 2.6 kernel branch and the current mesa drm.  Xv is the
>  only other thing I might possibly care about, and it's working well
>  too.
>
>  The performance is great compared to the alternatives!  Thanks!
>
>
>  In the wiki, I noticed that the Debian installation instructions are
>  considered out of date.  Why is this?  Everything in them is accurate
>  for contemporary Debian, modulo one minor detail.

Partially because you can use the Ubuntu packages from my PPA (with a
rebuild) to get proper packages, and partially because nouveau
packages have just been uploaded to Debian experimental.
