From: Omari Stephens <xsdg-X4eXTMIVSMI@public.gmane.org>
Subject: nouveaufb handover not working properly from VGA on
	GTX460 (NVc0)
Date: Sat, 25 Feb 2012 00:09:35 +0000
Message-ID: <4F4826BF.5040500@xsdg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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

Howdy, y'all

I just got a GTX460 and I'm having a bit of trouble getting it running. 
  In particular, when I modprobe "nouveau," the display goes black (but 
doesn't enter power saving, so there's a signal of some sort).  After 
doing some searching, I found
http://nouveau.freedesktop.org/wiki/KernelModeSetting

If I unbind the nouveaufb driver, the console starts working again.  If 
I re-bind it, it freezes.  Other than the display not showing anything, 
the system seems to run properly.  So clearly, this seems like a 
handover problem.

Any suggestions for things I should try?  I am using plain VGA right 
now, which should work according to the page.

I currently have fbcon and nouveau modularized, but I'm going to try 
compiling them in just to see if that helps.  Since this is my main 
machine, I'd like to get X working first and foremost, and then I can 
tweak things afterward.

--xsdg
