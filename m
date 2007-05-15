From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: NV43 (6600 Go) Report
Date: Tue, 15 May 2007 21:17:17 +0300
Message-ID: <20070515211717.3a386fc8@daedalus.pq.iki.fi>
References: <438b0cc70705150323q2356c42flb70d4f0675bbc478@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <438b0cc70705150323q2356c42flb70d4f0675bbc478-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Tue, 15 May 2007 11:23:50 +0100
"Pascal Schoenhardt" <stoanhart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> the nouveau driver (GIT version from the 12'th of May)
> 
> Driver compiled just fine, and everything worked on the first try. The
> "Start X and run for cover" was not required! glxgears runs at approx.
> 350 fps; this is according to the console output, however the
> animation looks very jumpy... According to the wiki, this is the only
> 3D application that runs, however I am also able to use every one of
> the GL screensavers included in Gnome (2.20, I believe - running
> Feisty). They run like slideshows, but they render perfectly! Nice
> work. The only other GL app I've tried is Google Earth, which resulted
> in X crashing, but I know that advanced apps aren't meant to work yet
> anyways.

Yes, Mesa software rendering is nice, isn't it? ;-)
I suppose you did not install Mesa from git, did you?
Might be worth to check glxinfo, if you really got DRI called properly.
That glxgears behaviour sounds like software rendering to me.

> Now for the problems: My laptop is an Asus Z71v, which has a 1680x1050
> LCD panel. While I am running Feisty Fawn, which has x.org 7.2 by
> default, I have upgraded this to 7.3 from Burtoni's repo's, which were
> create with the intent of testing display hotplugging.
...
> Now, here is the real issue: My laptop has a VGA port and an svideo
> port. To start working on smooth multi-head support for gnome, I
> obviously need use of at least the VGA port. As it stands, nouveau
> does not detect any of these outputs. As I understand it, xrandr
...
> Plugging in a monitor in the VGA port does nothing at all. I did
> notice that there are some other heads in the GIT repository for
> xrandr1.2. Do I maybe need to get a special version of nouveau? Has
> the randr stuff been merged into the main driver yet? If I need a
> special version, I would be forever grateful if someone could just
> post the exact git command I need to run to get what I need. :)

I am not sure what the current state of Nouveau randr-1.2 is, but the
following is my impression.
randr-1.2 stuff is not in the master branch, but in the randr-1.2
branch only. This requires xorg-server 1.3, like master branch now does.
I have the same kind of nv28 card as Airlied who works on the
Nouveau randr-1.2. The last I tried I got, with one analog and one DFP,
something different on both heads, but not really usable (at least DFP
screen was geometrically screwed, and colors too). Some how it managed
to make my mouse all weird, too, swapping and inversing x and y
coordinates or something. AFAIK, trouble with basic mode setting for
multiple heads. Since then, I see one or two batches of commits from
Airlied to randr-1.2 branch, so things may have changed.

I still do not believe randr-1.2 features are yet at a usable state.

-- 
Pekka "PQ" Paalanen
http://www.iki.fi/pq/
