From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Mesa-dev] [PATCH] nouveau: Add lots of comments to
 the buffer transfer logic
Date: Mon, 2 Dec 2013 21:34:21 -0500
Message-ID: <CAKb7UviPpR9h58kn-FikufLn0zZbQtVe27MFSqgHQMMFP5qy1g@mail.gmail.com>
References: <1385961714-20564-1-git-send-email-imirkin@alum.mit.edu>
	<CAH3ygc2gi5Sye1Hp8-0evquVRShVfUcvQ_YK2AX=BNEyqjLMDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAH3ygc2gi5Sye1Hp8-0evquVRShVfUcvQ_YK2AX=BNEyqjLMDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Chris Forbes <chrisf-GC9Nvf0HxqylVyrhU4qvOw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Dec 2, 2013 at 9:31 PM, Chris Forbes <chrisf-GC9Nvf0HxqylVyrhU4qvOw@public.gmane.org> wrote:
> + *
> + * Also marks vbo/cb dirty if the buffer's binding
>
> Looks like this stops mid-sentence.

Hah, yeah. I kinda trailed off there, didn't I. Not sure how to finish
that sentence though -- it's if pipe_resource->bind &
PIPE_BIND_INDEX/VERTEX/CONSTANT. Perhaps "if the buffer is bound to
____"? Is there some good term I can use there? Maybe "Also marks
vbo/cb dirty if the buffer is bound to them"?

  -ilia
