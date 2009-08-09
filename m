From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: I have a multihead setup
Date: Sun, 9 Aug 2009 10:35:43 +0300
Message-ID: <20090809103543.660d332b@iki.fi>
References: <848700.6071.qm@web57805.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <848700.6071.qm-tqMOZ4BNeBCB9c0Qi4KiSs0jms80CZx+QQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Victor Olvera <dudeofx-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 8 Aug 2009 18:51:18 -0700 (PDT)
Victor Olvera <dudeofx-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:

> I was reading thru the project page and I found that you were looking
> for people with multihead setup.
> 
> my setup is
> 1 AGP TNT2
> 1 PCI TNT2
> 1 PCI old ATI-all-in-wonder
> 
> and I am running Mandriva 2008.1 because its the only linux distro that
> will use my setup...

Multi-card would be the correct term, multihead (on a single card)
is already supported.

First you could test that each card works on its own, without any of
the other two installed. Then try combinations of one nvidia and
one ati card. Then the two nvidia cards installed, which might
already trigger problems even if you tried to use only one of them.
And then using the both of them, and finally all three.

I'm not sure how much of multi-card support is unimplemented, but
it's not just "test and report bugs", AFAIK it will involve
implementing things. So it will be an interesting project.

I think Dave Airlie (airlied, Australian timezone) could tell
you about the generic infrastructure, what might still be
missing in the graphics stack. Ben Skeggs (darktama, also Australia)
masters the Nouveau DRM and other stuff. Then there are other
people on the irc channel, mostly on European timezone, who
may also be able to help and answer questions.

It's possible that you find some problems with a TNT2 alone,
so solving those might be a nice entry point into the development.

The most beneficial would be to make them work with KMS.
Non-KMS (as in user mode setting, UMS) does still exist, but
the development is slowly moving away from it.

You should stick to the #nouveau irc channel 24/7 if you can :-)


Cheers.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
