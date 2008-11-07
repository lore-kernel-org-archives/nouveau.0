From: "Maarten Maathuis" <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH for review] (hopefully) improve error message
	upon incorrect pgraph irq
Date: Fri, 7 Nov 2008 10:24:54 +0100
Message-ID: <6d4bc9fc0811070124q5812b10cj47bc8b4fbee70b45@mail.gmail.com>
References: <6d4bc9fc0811061543g7ca8eb67j85068b611f0daf56@mail.gmail.com>
	<1226017616.2954.20.camel@araqiel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1226017616.2954.20.camel@araqiel>
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
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Nov 7, 2008 at 1:26 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, 2008-11-07 at 00:43 +0100, Maarten Maathuis wrote:
>> My main question is, do the error messages accurately reflect the situation.
>> Anything else wrong with this patch?
>>
>> A (n)ack by darktama would be nice.
> An instance value of zero can very well be valid, a definite NACK on
> that part of the patch.  Also, the PGRAPH interrupt generated on nv5x
> while creating the first channel, that *is* a bug, things still work
> regardless but painting over it with a "not very harmful" message...
> Just, no.
>
> While I don't see it entirely necessary to split the error message up
> when we come across a non-sane channel id, if it bothers you that much
> go for it, but the current message gives all the needed info already..
>
> Ben.
>>
>> Maarten.
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

I'll have a deeper look into the strange irq's the blob gets at
startup. Maybe i can find the answer there.

Maarten.
