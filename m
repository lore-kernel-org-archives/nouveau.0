From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] Driver can't detect video output and xserver
 doesn't start
Date: Thu, 19 Jul 2012 02:51:53 +0000
Message-ID: <bug-21273-8800-GIKXDDraeD@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #70 from Andrey Gusev <ronne-cmBhpYW9OiY@public.gmane.org> 2012-07-18 19:51:53 PDT ---
Created attachment 64361
  --> https://bugs.freedesktop.org/attachment.cgi?id=64361
Patch to kernel to test fabricate of dcd output

I tried to shrink a bug. NV driver uses i2c bus for detection
[    71.463] (II) NV(0): I2C bus "DDC" initialized.
[    71.463] (II) NV(0): Probing for analog device on output A...
[    71.465] (--) NV(0):   ...can't find one
[    71.465] (II) NV(0): Probing for analog device on output B...
[    71.467] (--) NV(0):   ...can't find one
[    71.467] (II) NV(0): Probing for EDID on I2C bus A...
[    71.467] (II) NV(0): I2C device "DDC:ddc2" registered at address 0xA0.
[    71.470] (II) NV(0):   ... none found
[    71.470] (II) NV(0): Probing for EDID on I2C bus B...
[    71.519] (--) NV(0): DDC detected a DFP:
[    71.519] (II) NV(0): Manufacturer: GSM  Model: 4e3a  Serial#: 78597
[    71.519] (II) NV(0): Year: 2008  Week: 10
[    71.519] (II) NV(0): EDID Version: 1.3
Current code doesn't init i2c because it can't read dcb table. So I change
order of initialization and make initialization of i2c after parsing dcb table.
Code of initialization of i2c tries to read dcb table itself, but for my card
it is failed to do it.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
