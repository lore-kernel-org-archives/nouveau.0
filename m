From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau not working on second monitor
Date: Sat, 02 Mar 2013 20:02:40 +0000
Message-ID: <51325AE0.2050505@gmail.com>
References: <8CFE33A88AEDFDF-6CC-8332E@webmail-d214.sysops.aol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <8CFE33A88AEDFDF-6CC-8332E-n3SY6/QrmYWrbyn9oLO2vrQXJ8qk6zCwQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: rv0987-YDxpq3io04c@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 27/02/13 19:48, rv0987-YDxpq3io04c@public.gmane.org wrote:
> Hi,
> 
> I have a problem that my nouveau driver does not properly load every time I boot my laptop.
> 
> It either:
> - defaults to the vesa driver (always if my power cord is plugged into the laptop
> - starts nouveau but without the external monitor
> - starts nouveau WITH the external monitor (as it should be)
> 
> (starting without the monitor attached and then connecting it always fails & crashes X)
> 
> How/where can i find any help for this?
> 

A quick look at your dmesg indicates that the nvidia card is not
recognized. This can be caused by either one of
* Card is in a messed state(think kernel before nouveau)
* Your card is getting to the end of it's life (see [1])

With that said, does the system works correctly with the
blob(proprietary binary driver) ?
If so please file a bug following the instructions [2]


Emil

[1] http://news.cnet.com/8301-13554_3-10020782-33.html
[2] http://nouveau.freedesktop.org/wiki/Bugs
> Details:
> - Ubuntu 12.10.
> - card:  VGA compatible controller: NVIDIA Corporation G86 [GeForce 8400M GT] (rev a1)
> - kernel 3.5.0-25-generic
> - X.Org X Server 1.13.0 Release Date: 2012-09-05
> - all nv & nvidia drivers are blacklisted
> - the problem has grown worse over the last 2 years
> 
> 
> 
> 
> 
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
> 
