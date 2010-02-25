From: Tavian Barnes <tavianator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Why report LVDS as disconnected when lid is closed?
Date: Wed, 24 Feb 2010 23:44:54 -0500
Message-ID: <add883141002242044y7041b677lcec24d70ef57308b@mail.gmail.com>
References: <add883141002241551v66e19bdfp754e7f9e62f45e67@mail.gmail.com>
	<1267056115.2695.6.camel@nisroch> <1267072782.2848.1.camel@araqiel>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1267072782.2848.1.camel@araqiel>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

On 24 February 2010 23:39, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, 2010-02-25 at 10:01 +1000, Ben Skeggs wrote:
>> On Wed, 2010-02-24 at 18:51 -0500, Tavian Barnes wrote:
>> > What's the motivation behind commit 60821e0 (drm/nouveau: report LVDS
>> > as disconnected if lid closed)? =A0The only noticeable effect I can see
>> > from it is that if I turn on my laptop and then close the lid, X fails
>> > to start as it can't find any screens. =A0In fact, if I close the lid
>> > before nouveau initialises, I don't even get a framebuffer console.
>> >
>> > I know I can just use the ignorelid module param, but what's the
>> > benefit without it?
>> The benefit is people on laptops with docking stations can close the
>> lid, and have two external outputs light up. =A0Otherwise, LVDS (which
>> isn't visible because the lid is closed) will likely be programmed and
>> only one external display.
> Ok, there's been a slight change made in latest nouveau git that should
> allow the best of both worlds.
>
> Ben.

I just saw it, thanks.  That seems like a good behaviour to me.

-- =

Tavian Barnes
