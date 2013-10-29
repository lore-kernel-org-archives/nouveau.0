From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fw: Dual monitor question
Date: Tue, 29 Oct 2013 01:47:34 +0000
Message-ID: <526F13B6.9050002@gmail.com>
References: <20131028211518.5b4de9382493e53e24f3b1e4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20131028211518.5b4de9382493e53e24f3b1e4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Gmail <rsv869-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 29/10/13 01:15, Gmail wrote:
> Hello group -
> 
> Never heard a peep about this....wasn't sure it was actually posted.  Anyone seen this before?
> 
Peep, peep, it did get posted :P

> Thx
> 
> RSV869
> 
Top-posting as well as setting up your account name as "Gmail" is
considered a bad practice by some people.

> 
> Begin forwarded message:
> 
> Date: Sat, 26 Oct 2013 11:45:35 -0400
> From: Gmail <rsv869-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Subject: Dual monitor question
> 
> 
> Hello Nouveau group -
> 
> I am an OpenSuSE 12.3 user that's been struggling with a specific nouveau feature which I think should work, but not  so far for me.
> 
> I have this card installed in my laptop; 	02:00.0 VGA compatible controller
> 
Seems like you're missing the important part about your "VGA compatible
controller", apart from the fact that it is one :P

> These are my Nouveau libs:			libdrm_nouvear2	2.4.42-1.1.1
> 								xorg-x11-driver-video-nouveau	1.0.6-2.1.1
> 
> My goal is to configure my settings so I can run with the normal laptop screen when mobile but change to DVI output by plugging in the monitor, closing the laptop and have ALL video output go to the DVI.  So far I can't get that to work.
> 
> The desktop-settings config seems to recognize that the DVI is there, but no video actually appears on it. After I can see that that part works I want to change outputs from laptop to DVI port (secondary monitor) exclusively.
> 
So what you're saying is:
I have a laptop and I do not see anything on my TV/monitor when I
connect it in via DVI. Although "desktop-setting", seems to acknowledge
the that the TV/monitor is plugged in. Help :)

Nouveau supports outputs connected via DVI, and it should "just work".

With that said, I would recommend you go through the FAQ[1] and
Troubleshooting[2] sections in our wiki, and if things are still looking
bad file a bug[3].

Cheers
Emil


[1] http://nouveau.freedesktop.org/wiki/FAQ/
[2] http://nouveau.freedesktop.org/wiki/TroubleShooting/
[3] http://nouveau.freedesktop.org/wiki/Bugs/
> Thoughts welcome.
> 
> RSV869
> 
> 
