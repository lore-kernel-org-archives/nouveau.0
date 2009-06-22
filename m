From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: SLI support for 8800 GTX?
Date: Mon, 22 Jun 2009 23:35:46 +0300
Message-ID: <20090622233546.1af414e8@daedalus.pq.iki.fi>
References: <c5221b990906221315q4ecaa681s71342e5f4f63b17e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <c5221b990906221315q4ecaa681s71342e5f4f63b17e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jake Peavy <djstunks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 22 Jun 2009 16:15:45 -0400
Jake Peavy <djstunks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi all,
> 
> Can someone comment on SLI support in nouveau?  I'm trying to run KMS (with
> Plymouth) and nouveau on dual 8800GTXs and not having much (any) luck, I
> think the message I get is "GPU deadlock".

To get SLI support, we would need to have a developer with SLI hardware.
I do not think there is a developer even with any two cards, since the bug
https://bugs.freedesktop.org/show_bug.cgi?id=16897
is still open. Someone with interest in multicard or SLI support should
join the project and write the code.

The current status is "not implemented" and as you found out, multicard
really does not work at all. SLI is another story after multicard
support.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
