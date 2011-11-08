From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Option "Rotate" is not used
Date: Wed, 09 Nov 2011 08:45:34 +1000
Message-ID: <1320792334.2188.1.camel@nisroch>
References: <CAN0CFw0f7yVR0hXFiNio4JKgce-GTKd3hU22ve1zNH1hDQsakw@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAN0CFw0f7yVR0hXFiNio4JKgce-GTKd3hU22ve1zNH1hDQsakw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Grant <emailgrant-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 2011-11-08 at 14:05 -0800, Grant wrote:
> I just switched from nvidia to nouveau and I get the following in Xorg.0.log:
> 
> (WW) NOUVEAU(0): Option "Rotate" is not used
> 
> I have the following in xorg.conf because I've rotated the LCD screen
> to change its orientation:
> 
> Option "Rotate" "CCW"
> 
> Can this be done with nouveau?  BTW, I can't say for sure that nouveau
> isn't rotating the screen image because the workstation is remote.
Sure it can, nouveau is a randr 1.2 driver - so adding 'Option "Rotate"
"Left"' to the monitor section of your xorg.conf will work instead.

Ben.

> 
> - Grant
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
