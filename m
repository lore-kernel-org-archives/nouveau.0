From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Any Documentation Work Needed?
Date: Sun, 22 Jun 2008 15:10:09 +0300
Message-ID: <20080622151009.120471ea@daedalus.pq.iki.fi>
References: <485D3F0C.2090407@sbcglobal.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <485D3F0C.2090407-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Adam Cozzette <adam_cozzette-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 21 Jun 2008 10:49:00 -0700
Adam Cozzette <adam_cozzette-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org> wrote:

> Hello,
> 
> I don't have much experience but I'm looking for a way to contribute to 
> Nouveau. I'd be glad to work on documentation, edit IRC logs, make 
> cosmetic changes to code, etc. Just let me know if you have any work of 
> this sort and I'll give it a shot.

Very cool to offer!

My first suggestion would be to go over the wiki, especially FAQ. I bet
there are outdated information. Of course, you need to know what is the
truth, and the best place to ask is on the irc channel #nouveau at
freenode. I've been thinking of doing a review myself, but so far didn't
get to it.

The first thing coming to mind is randr 1.2 support, that is now enabled
by default, but I think most pages talking about randr 1.2 still assume
it's not.

Hmm, I do have another idea, too, but I think ahuillet would like to hang
me for saying it. I hope he doesn't get mad at me, I do greatly appreciate
what he did, because that was the hard part. Now someone else could improve
that.

Well, here goes: in the DDX, nv_video.c
would need a style cleanup. But don't go there yet, I'd like to hear what
the developers think about doing cosmetic changes. IMHO nv_video.c would
be a good candidate, because AFAIK no-one is working on that currently,
so the changes would not cause major pain. This would be a nice project
to get a grip of the development infrastructure, and setting up your
own git repository for easy review of changes before pushing them to the
master. I could review the changes, if they are incremental.

Now, these are just what came to my mind, and I'm not sure I should be
saying anything since it's been long since I really worked on anything.
Feel free to ignore me, or steal the ideas ;-)
Also, in July I'll be on vacation and available occasionally. Or not.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
