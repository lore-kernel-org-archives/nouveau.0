From: Helge Hafting <helge.hafting-i5bjtSbraLbLX0NG8FE4ug@public.gmane.org>
Subject: Re: nouveau slower than nv and vesa on quadro 135M
Date: Mon, 15 Sep 2008 16:59:21 +0200
Message-ID: <48CE7849.20206@aitel.hist.no>
References: <48CCE4B0.1030709@aitel.hist.no>	
	<6d4bc9fc0809140419k3555a843nbb77806f3d7e44ef@mail.gmail.com>	
	<48CD0888.6020706@aitel.hist.no>	
	<6d4bc9fc0809140629l6155dfd4xa9cd7c92defa54db@mail.gmail.com>	
	<48CE432A.9040001@aitel.hist.no>	
	<6d4bc9fc0809150431w1d57d228n1046fad9e437a7@mail.gmail.com>	
	<48CE4F66.6060805@aitel.hist.no>
	<6d4bc9fc0809150545q2b58a65cr74cea5d9caf37d99@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0809150545q2b58a65cr74cea5d9caf37d99-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

Maarten Maathuis wrote:

> The 1st and the 2nd problem are different. Let's focus on the first initially.
> 
ok.
> I think for a callgraph you need to specify a depth, --callgraph=5 for
> example, please experiment with that to see if you can actually see
> who is calling those pixman functions (for the navit case). Currently
> it just points to itself which is a (rather poor) way of showing that
> it doesn't know.
> 
I have no luck with this. I started out with --callgraph=6, like the 
example in the wiki.  I tried increasing to 10 and then to 16, that 
didn't seem to help.  There is very little documentation for this 
option, such as what numbers are supported.
I tried --callgraph=25, and then opreport -c gave me error messages only.

> If you could attach an xorg log, that would allow me to check if
> things are as i expect them to be.

Here are files from my attempts with --callgraph=16
http://www.aitel.hist.no/~helgehaf/oprofile/navit5/opreport-c
http://www.aitel.hist.no/~helgehaf/oprofile/navit5/opreport-l
http://www.aitel.hist.no/~helgehaf/oprofile/navit5/Xorg.0.log

Many calls is not unexpected. A city map has lots of roads, divided into
hundreds and hundreds of straight line segments. These are typically 
painted twice with slightly different width, so as to get a road with 
edges. There are also a lot of filled polygons (buildings, parks, river,...)

Painting a big map quickly is sometimes too much for weak processors 
like a phone with gps. It is normally not a problem for a PC, even
with unaccelerated framebuffer graphics.

Helge Hafting
