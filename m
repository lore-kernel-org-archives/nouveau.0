From: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
Subject: Re: [RFC] nouveau: Add basic i2c sensor chip support
Date: Fri, 20 Nov 2009 20:02:56 +0000
Message-ID: <20091120200256.GA30470@srcf.ucam.org>
References: <1258671589-2079-1-git-send-email-mjg@redhat.com>
	<20091120184325.GA29058@srcf.ucam.org>
	<1258747177.31202.5.camel@balrog.2hip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1258747177.31202.5.camel-it3iGQysvyiGwK4wanZbFg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Nov 20, 2009 at 01:59:37PM -0600, Robert Noland wrote:
> On Fri, 2009-11-20 at 18:43 +0000, Matthew Garrett wrote:
> > This one works better, including some amount of support for the internal 
> > GPU sensor. It seems to give reasonable results on all the cards I have 
> > here.
> 
> So, I obviously have concerns/objections to allowing GPL code into drm.
> Especially, since this code doesn't do anything interesting or
> innovative that I can see.  It just reads registers via i2c... I mean
> how else would you do it?

It contains code cut and paste from nvclock (a GPLed codebase) and uses 
functions that are specific to the Linux kernel. I don't have the legal 
expertise to be able to claim it's not a derived work.

-- 
Matthew Garrett | mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org
