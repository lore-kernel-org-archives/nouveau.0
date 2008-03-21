From: Garnet MacPhee <garnet-vVazHDhchvNCCzmm7wA0Mw@public.gmane.org>
Subject: Re: GSOC '08 hardware accelerated video decoding
Date: Thu, 20 Mar 2008 18:25:54 -0600
Message-ID: <47E30092.9080808@signalpeak.net>
References: <586c2acd0803201155o6f33112ay4ce8421f979068f7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd0803201155o6f33112ay4ce8421f979068f7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes M <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi, I am one of those who doesn't care about 3D, but I would very much like to have a fast 2d driver to replace the nvidia 
closed-source one. My primary requirement is the ability to play 1080i video (HDTV). I am doing this now with the nvidia 
driver with good results. My hardware is a 6200A video card (NV4A), a DVI-D monitor with 1920x1200 resolution, and a 3ghz 
Pentium 4 cpu. I can achieve good results with just the blitter, and I do not have XvMC turned on.

Here is the mplayer control statement I use: mplayer dvb:// -ao alsa -vo xv:port=387 -fs

The nouveau driver is much too slow to play 1080i video, no matter which adapter is used.

Good luck with the project. I may be able to help a little with testing, but I do not have the knowledge necessary to 
contribute to the coding.

Garnet

Younes M wrote:
> Hi,
> 
> I'm considering submitting a project for this year's Google Summer of
> Code program that would involve making progress on hardware
> accelerated video decoding for the nouveau driver and wanted some
> feedback.
> 
> I know that this isn't a big priority at the moment amongst the
> regular contributors, but I think it would make a good GSOC project
> because of it's somewhat narrow scope. I think for a lot of people 3D
> eye candy isn't a feature they're desperate for, they just care about
> a functional and efficient 2D driver, and having video acceleration
> would complement that nicely and entice them to switch from the Nvidia
> binary driver and the old nv driver long before the people who want
> the 3D features.
> 
> I've read through jb17bsome's notes on XvMC and I think all the work
> he's done so far is a great head's up on what's involved. I've also
> read through the VAAPI page and I think that would also be a great
> feature to try and support given all the non-MPEG2 video content out
> there, it would probably entice even more people to use nouveau.
> 
> The only thing I'm concerned about at this point is that the only
> Nvidia hardware I currently have is a GeForce FX GO 5200, so I'm not
> sure how much help I could really be given the limited features of
> that GPU.
> 
> If anyone has any comments or suggestions on this, or thinks that some
> other area would make a better project I would love to hear your
> comments.
> 
> Thanks all.
