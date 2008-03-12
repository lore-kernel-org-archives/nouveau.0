From: "KoalaBR" <koala_br-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Subject: Re: NV50: Some patches that need testing.
Date: 12 Mar 2008 21:18:25 +0100
Message-ID: <200803122118.25094.koala_br@users.sourceforge.net>
References: <6d4bc9fc0803111532j6fe3cc8m9eaf8ba6eeb1b86f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0803111532j6fe3cc8m9eaf8ba6eeb1b86f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Am Dienstag, 11. M=E4rz 2008 23:32:10 schrieben Sie:
> Someone with a known good setup needs to test these patches.
>
> Koala_BR is the obvious candidate, but i'm sending them to the
> mailinglist anyway.
>
> These are not extremely drastic, but i still need conformation that
> they work, before i can proceed with more serious changes.
>
> Maarten.
Hello,

Ok, patch ../0004-NV50-Kill-the-connection-status-caching-which-was.patch =

breaks things for me, that is giving me a 1024x768 desktop.
I applied that patch on top of 4cf1bd9ef016a2c9fe7784fdc83f559bec464f9e plu=
s =

patches 0001 to 0003


I have added the xrandr -q output for the correct mode. If you need it, I c=
an =

give you output using the blob too. Just let me know.

BTW: The most my panel can do is 1280x1024 (it is a Hyundai ImageQuest L90D=
+)
so modes 1 + 2 in that output can't be achieved without scaling on my panel.
I am using DVI, can switch to VGA anytime if need be.

Let me know, if you need anything else

KoalaBR

P.S: To the list: Here is my first answer to stillunknown, for which I =

promptly forgot to CC the list :)
 ---------------------------------------------

Hello,

I just applied your combined patch on top of git commit =

460cb260c30467799fa31aef11946d1fe2dd6523. X came up, but didn't find my =

default mode of 1280x1024 and switched to 1024x768 instead.
The Xorg.log is attached (BTW: I always use the same xorg.conf for =

nouveau, so nothing changed on the config side of things). Output from =

xrandr -q:
*0 =A0 1024 x 768 =A0 =A0( 270mm x 203mm ) =A0*60
=A01 =A0 =A0800 x 600 =A0 =A0( 270mm x 203mm ) =A0 60
=A02 =A0 =A0640 x 480 =A0 =A0( 270mm x 203mm ) =A0 60
=A03 =A0 =A0512 x 384 =A0 =A0( 270mm x 203mm ) =A0 120
Current rotation - normal
Current reflection - none
Rotations possible - normal
Reflections possible - none
Which seems to be correct except for two things:
1. missing 1280x1024 mode which is set as default
2. Monitor is able to rotate to the right, resulting in =

=A0 =A01024x1280 resolution. If the output of xrandr depends on DDC or
=A0 =A0BIOS there is something wrong. =


Will now update to latest revision and redo the test. If that give me =

the same results, I will use the split patches.

KoalaBR
