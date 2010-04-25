From: Bob Gleitsmann <rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org>
Subject: uevent support in nouveau DDX
Date: Sun, 25 Apr 2010 14:16:49 -0400
Message-ID: <201004251416.49984.rjgleits@bellsouth.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

uevent support was added to the nouveau DDX in a recent commit. A test is made 
in configure.ac for libudev being present but there is no minimum version. I 
have had problems with this as I am using Fedora 11 which has udev-141 in it. 
This version does not support all of the functions required by the DDX and 
will crash Xorg. At least this function is missing: 
udev_monitor_filter_add_match_subsystem_devtype
I don't know when this was added to udev, but it was definitely after 141. In 
the mean time, I will endeavor to fudge the configuration so that it doesn't 
think that udev is installed. Hopefully this will result in a DDX that doesn't 
crash. 
I'm also going to try setting up a partition with Fedora 13 to see what 
happens with that.

Best Wishes,

Bob Gleitsmann
