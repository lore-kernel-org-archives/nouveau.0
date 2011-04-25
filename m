From: Jonathan Andrews <jon-6sjJsz/Jqtu8qtKVGud/9w@public.gmane.org>
Subject: Minitor ID problem with KMS and nouveu
Date: Mon, 25 Apr 2011 08:25:09 +0100
Message-ID: <1303716309.21265.10.camel@jonspc>
Reply-To: jon-6sjJsz/Jqtu8qtKVGud/9w@public.gmane.org
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

I've recently installed a Debian machine. It has two older (identical
looking) 4x3 19" monitors, both capable of 1280x1024.

My problem is that one of the panels returns no monitor ID.  I've tried
using KMS kernel arguments but nothing useful happens.

My question is in the absence of a EDID why does the user specifying a
resolution in kernel arguments not force compliance from the driver.  IE
If the user manually states 1280x1024 why does nouveau not take the hint
rather than trying to comply with some generic monitor definition?

Many thanks,
Jon
