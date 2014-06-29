From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Jetson TK1 support -- OpenGL?
Date: Sun, 29 Jun 2014 13:32:41 +0900
Message-ID: <CAAVeFuLrOPPWAqyhShzrbM9r5RLXqANnEWfdF+cJF3vNcrYRSg@mail.gmail.com>
References: <CAN0CFw0pwq=_A_ZT60KpMSniJm=aq0yOvy8qOKROU217+62fPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAN0CFw0pwq=_A_ZT60KpMSniJm=aq0yOvy8qOKROU217+62fPQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Grant <emailgrant-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, Jun 29, 2014 at 6:01 AM, Grant <emailgrant-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I read that nouveau supports the Jetson TK1 board:
>
> http://www.newegg.com/Product/Product.aspx?Item=N82E16813190005
>
> Does it provide OpenGL support?

It does:

https://www.youtube.com/watch?v=7ZSGSVGsSwc

This is still a work-in-progress, but glmark2 and Weston are already
running. Note that as the support is rather new currently requires
recompiling a few things by yourself, including a custom kernel. But
the support should land into upstream quite soon.

NVIDIA's proprietary drivers also support OpenGL under X if you don't
mind not running a free software graphics stack.
