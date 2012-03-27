From: Ian Pilcher <arequipeno-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: HDMI InfoFrames confusing my display
Date: Tue, 27 Mar 2012 10:23:24 -0500
Message-ID: <jksm1d$lrg$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I have bugzilla'ed a problem with the 3.3 kernel and my 1920x1200 LCD
display here:

  https://bugzilla.redhat.com/show_bug.cgi?id=806091

Since the InfoFrames appear to be confusing my display, I'm looking for
a way to disable them.  Is it possible to use the override_conntype
parameter to make the driver treat the DisplayPort connector as a DVI
connector (which would presumably stop it from sending the InfoFrames)?
I can't find any documentation on how to use this parameter.

Any other ideas?

Thanks!

-- 
========================================================================
Ian Pilcher                                         arequipeno-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
"If you're going to shift my paradigm ... at least buy me dinner first."
========================================================================
