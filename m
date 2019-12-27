From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Support for older GPU
Date: Fri, 27 Dec 2019 08:30:03 -0500
Message-ID: <CAKb7Uvjdt6ypoK3O-HNGYr=Xn9CcU7p5k-dqvu4OAFyUJkqYcg@mail.gmail.com>
References: <CAPm7QYwHte2HzRWGS--BLGvh8aT8EFnc=145KgChFOVuKR5DOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPm7QYwHte2HzRWGS--BLGvh8aT8EFnc=145KgChFOVuKR5DOg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jerry Sanders <dragonspark30-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Nouveau should work largely OK, although the Tesla series (to which
your card belongs) has some unfortunate random hang issues due to what
we suspect is an incorrect FIFO channel switch procedure.

Support should already exist in any linux distro, so as long as you
don't do anything to proactively disable that support, it should work
out of the box. You can try with a live cd or something if you don't
want to commit.

Cheers,

  -ilia

On Fri, Dec 27, 2019 at 3:13 AM Jerry Sanders <dragonspark30-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hello, Name's Jerry. I have GeForce 8500 GT on my computer and I found out that Nvidia does not support my GPU anymore for linux. I wanted to ask you several questions.
> 1. Will your team support  drivers for old GPUs  on new Linux distros?
> 2. How can I make a driver work on a kernel that is not meant to work on?
> 3. Can I somehow solve this problem without updating my card, which i can't do due to lack or cash.
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
