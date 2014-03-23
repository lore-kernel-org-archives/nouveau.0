From: Israel <israeldahl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Issue with nouveau drivers
Date: Sat, 22 Mar 2014 19:20:21 -0500
Message-ID: <532E28C5.4050009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,
I am unable to suspend using nouveau, so I have to use the NVIDIA 
drivers currently, which I do not like to do (they don't work as well 
for everything else and are proprietary)
So... to get to the basic info

01:00.0 VGA compatible controller: NVIDIA Corporation G84M [GeForce 
8600M GT] (rev a1)
3.13.0-16-generic Ubuntu x86_64 GNU/Linux
nvidia drivers version 331.38

If there is any more specific output from commands that will help you, 
let me know  I would be very willing to simply remove the proprietary 
drivers and run nouveau and try some kernel paramters, or log the hang 
up I would be glad to, as I REALLY want to use nouveau drivers.

What happens:
I suspend the machine.
When I open the lid to resume from suspend, the screen is black, or 
frozen and will hang.  I can occasionally get to the lightdm login 
screen, or to a tty, but the machine freezes within a few seconds of 
resume, and I have to do a hard reboot (which is why I use the 
proprietary drivers, as I need to use suspend)

Since I have the proprietary drivers I can run tests for you so you can 
find out what the drivers are doing on this particular card, or any 
other things you would like.

-- 
Regards
