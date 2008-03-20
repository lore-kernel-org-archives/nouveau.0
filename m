From: "Younes M" <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: GSOC '08 hardware accelerated video decoding
Date: Thu, 20 Mar 2008 14:55:59 -0400
Message-ID: <586c2acd0803201155o6f33112ay4ce8421f979068f7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

I'm considering submitting a project for this year's Google Summer of
Code program that would involve making progress on hardware
accelerated video decoding for the nouveau driver and wanted some
feedback.

I know that this isn't a big priority at the moment amongst the
regular contributors, but I think it would make a good GSOC project
because of it's somewhat narrow scope. I think for a lot of people 3D
eye candy isn't a feature they're desperate for, they just care about
a functional and efficient 2D driver, and having video acceleration
would complement that nicely and entice them to switch from the Nvidia
binary driver and the old nv driver long before the people who want
the 3D features.

I've read through jb17bsome's notes on XvMC and I think all the work
he's done so far is a great head's up on what's involved. I've also
read through the VAAPI page and I think that would also be a great
feature to try and support given all the non-MPEG2 video content out
there, it would probably entice even more people to use nouveau.

The only thing I'm concerned about at this point is that the only
Nvidia hardware I currently have is a GeForce FX GO 5200, so I'm not
sure how much help I could really be given the limited features of
that GPU.

If anyone has any comments or suggestions on this, or thinks that some
other area would make a better project I would love to hear your
comments.

Thanks all.
