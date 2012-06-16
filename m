From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50571] nouveau crashes with GeForce GT 520
Date: Sat, 16 Jun 2012 23:10:08 +0000
Message-ID: <bug-50571-8800-9d6CyxGrcB@http.bugs.freedesktop.org/>
References: <bug-50571-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50571-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=50571

--- Comment #11 from Gedalya <gedalya-UGXokjX7p+DR7s880joybQ@public.gmane.org> 2012-06-16 16:10:08 PDT ---
On 6/13/2012 9:43 PM, bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org wrote:
> If you can find the fix by bisecting, that would make me very happy.
>

I hope I got it all right, I tried to be very careful...


$ git bisect bad
4cbb0f8d2b06c72aae3552ff1a0a57814c6ce7d2 is the first bad commit
commit 4cbb0f8d2b06c72aae3552ff1a0a57814c6ce7d2
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Mar 12 15:23:44 2012 +1000

     drm/nvd0/disp: disconnect encoders before reprogramming them

     Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 4648bcf9d08c294fdb7ef76343e6f89e3cc2fe24 
2c31aa85ebf6c6f3b96fc6e91934a895bb42c0a3 M      drivers


$ git bisect log
# bad: [f8f5701bdaf9134b1f90e5044a82c66324d2073f] Linux 3.5-rc1
# good: [c16fa4f2ad19908a47c63d8fa436a1178438c7e7] Linux 3.3
git bisect start 'v3.5-rc1' 'v3.3' '--' 'drivers/gpu/drm/nouveau'
# bad: [4a206ffc0bfe8e8c3fc0468a052f5b0bb625a57b] drm/nouveau: oops, 
create m2mf for nvd9 too
git bisect bad 4a206ffc0bfe8e8c3fc0468a052f5b0bb625a57b
# good: [7d3a766b6aa4e293e72bfd6add477f05ac7fdf5a] drm/nouveau/pm: init 
only after display subsystem has been created
git bisect good 7d3a766b6aa4e293e72bfd6add477f05ac7fdf5a
# bad: [f1377998eede7a8caa124fcf6a589b02c9e2bac7] drm/nouveau: add 
userspace fallback hints.
git bisect bad f1377998eede7a8caa124fcf6a589b02c9e2bac7
# good: [c11dd0da5277596d0ccdccb745b273d69a94f2d7] drm/nouveau/pm: fix 
oops if chipset has no pm support at all
git bisect good c11dd0da5277596d0ccdccb745b273d69a94f2d7
# good: [6e83fda2c055f17780b2feef404f06803a49a261] drm/nvd0/disp: 
initial implementation of displayport
git bisect good 6e83fda2c055f17780b2feef404f06803a49a261
# good: [3488c57b983546e6bf4c9e0bfd0f7f2a1292267a] drm/nvd0/disp: move 
syncs/magic setup to or mode_set
git bisect good 3488c57b983546e6bf4c9e0bfd0f7f2a1292267a
# bad: [2f5394c3ed573de2ab18cdac503b8045cd16ac5e] drm/nouveau: map first 
page of mmio early and determine chipset earlier
git bisect bad 2f5394c3ed573de2ab18cdac503b8045cd16ac5e
# bad: [4cbb0f8d2b06c72aae3552ff1a0a57814c6ce7d2] drm/nvd0/disp: 
disconnect encoders before reprogramming them
git bisect bad 4cbb0f8d2b06c72aae3552ff1a0a57814c6ce7d2

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
