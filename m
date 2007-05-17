From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: NV43 (6600 Go) Report
Date: Thu, 17 May 2007 12:40:25 +0300
Message-ID: <20070517124025.1b65ee9a@daedalus.pq.iki.fi>
References: <438b0cc70705150323q2356c42flb70d4f0675bbc478@mail.gmail.com>
	<20070515211717.3a386fc8@daedalus.pq.iki.fi>
	<438b0cc70705170215s60fa9ff9l74fda2724f783953@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <438b0cc70705170215s60fa9ff9l74fda2724f783953-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 17 May 2007 10:15:14 +0100
"Pascal Schoenhardt" <stoanhart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> OK, so I have compiled and installed the randr1.2 branch of nouveau.
> The problem I am having is the following: with just the laptop
> flatpanel display connected, x won't start; with an external device
> connected, x starts but all displays remain blank.

I don't know how to help you, but...

> Now, when I connect another screen, X actually starts. Reading the log
> files, nouveau is getting the EDID info from the external screen
> (1024x768@70 LCD), and determining the correct modeline (after quite a
> lot of probing). As for the internal panel, it seems not to provide
> any EDID info. However, nouveau does seem to want to choose 1680x1050,
> provided I have specified a virtual large enough to fit that and the
> external screen in the xorg.conf (2704x1050).
> 
> Once X is started, both monitors are black. However, I can hear the
> "please enter your loging credentials" tone you get with ubuntu, and I
> can blindly log in to a normal session.

Try hitting Ctrl+Alt+Numpad- multiple times, slowly. That gave me
"something" on screens.

> I am guessing that this is just because this branch of nouvea is even
> more experimental than the whole project is, so there probably isn't
> much to do but wait for it to improve.

I think this is very much true, because mode setting on nv28 is also
not totally correct yet. Airlied did get two analog heads going for
himself, but for me analog+DFP has always been broken. I should
probably try again now, there are some commits that might have an
effect.

-- 
Pekka "PQ" Paalanen
http://www.iki.fi/pq/
