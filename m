From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: What is the motivation for choosing nVidia?
Date: Sun, 17 Jun 2007 11:18:26 +0300
Message-ID: <20070617111826.4ba077f0@daedalus.pq.iki.fi>
References: <30c82f5f0706152045h7a1e2acfx21a9447d1e288295@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <30c82f5f0706152045h7a1e2acfx21a9447d1e288295-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Louise Hoffman <louise.hoffman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 16 Jun 2007 05:45:59 +0200
"Louise Hoffman" <louise.hoffman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> The reason I post is, I am wondering what the motivation is for doing
> nVidia and not ATi?
> 
> I have read the "FAQ:Why are you doing this?", but it doesn't mention
> anything about ATi.
> 
> Is nVidia easier to write drivers for, or do you think AMD will
> release specs for their GPU's so it would be a waist for time, or are
> you continuing on ATi, when the nVidia is done, or are ATi GPU's not
> of interest?

I have not written a single line into the driver, but I do watch the
progress. I have heard that nvidia hardware is nicer to work with than
ati. Nvidia cards actually tell you when you send illegal commands to
them, instead of just crashing. And probably other things, too, that
are different in the architecture. Like having hardware contexts for
running multiple applications on the GPU concurrently and preventing
them from messing with each other.

I do not really know what is the ati side of these things, but this is
the image I got. Some (most?) Nouveau core developers have worked on
radeon drivers in the past.

Of course, all the things I mentioned are nice, but I do not know
how much they affect people's motivation. And due to nvidia architecture
being more advanced in some respect, Nouveau is also pushing the
development of the DRM and DRI systems on part.

Will the Nouveau driver ever be "Done"? I think not, new cards come out
all the time, and they have to be reverse-engineered. I do not believe
ati will be any different in this respect.

My personal motivation for helping Nouveau is that I happened to own an
nvidia card, and got pissed at the proprietary driver. I did consider
buying an ati card, but somehow never did that.

Besides, there should be more than one 3D accelerator card manufacturer
whose cards are supported by open drivers. ;-)
(So far Intel has made only integrated accelerators.)

-- 
Pekka "PQ" Paalanen
http://www.iki.fi/pq/
