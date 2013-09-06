From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: meaning?
Date: Fri, 6 Sep 2013 10:57:36 -0400
Message-ID: <CAKb7Uvi1gNc1p8BXOTz4GB8fiqrm+SvazObao1JCgUkY0Nx6cw@mail.gmail.com>
References: <52294A47.1010605@lockie.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <52294A47.1010605-ozXLQgHQwDP3fQ9qLvQP4Q@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: James <bjlockie-ozXLQgHQwDP3fQ9qLvQP4Q@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

It means that an invalid command made it into the fifo. However I'm
not sure why that's happening -- at the very least, 0x00406040 seems
like a perfectly legitimate command.

On Thu, Sep 5, 2013 at 11:21 PM, James <bjlockie-ozXLQgHQwDP3fQ9qLvQP4Q@public.gmane.org> wrote:
>
> What does this mean:
> [  626.850292] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[2059]] get 0x0020008e60 put 0x0020008e80 ib_get 0x00000093 ib_put 0x000000a3 state 0x80004861 (err: INVALID_CMD) push 0x00406040
> [  659.132581] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[2059]] get 0x00200238cc put 0x002002408c ib_get 0x0000035e ib_put 0x00000361 state 0x80004861 (err: INVALID_CMD) push 0x00500031
> [  659.132606] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [X[2059]] get 0x002000fb40 put 0x002000fb60 ib_get 0x0000035f ib_put 0x00000361 state 0x80000000 (err: INVALID_CMD) push 0x00406040
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
