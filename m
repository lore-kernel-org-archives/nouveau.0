From: "William Moss" <bill.m.moss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: custom monitor formats
Date: Mon, 31 Oct 2011 15:34:49 -0400
Message-ID: <op.v38d0basymuwjf@coyote.billshome>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
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

I recently updated from OpenSUSE 11.3 to 11.4.
The proprietary Nvidia driver will no longer work, even the latest  
NVIDIA...run.
I removed it and set up nouveau, which works fine except it ignores my  
customized
/etc/xorg.conf.d files and sets my monitor to 1024x768.

The monitor, an ACER AL1916W should be run at 1440x900 and this is the  
preferred
mode (modeline) in the configuration files. This is how it worked with the  
NVIDIA
drivers and should be still true.

Apparently, the nouveau module (driver) is ignoring the settings in the
/etc/xorg.d/50-device.conf and the associated conf files that are bound
in the server conf file.

I tested the setup with
	xinit -- :0
which works but at the incorrect resolution.

I even tried a customized and compiled 3.0.4 Kernel, to no avail.

Any help would be appreciated.
I have no problem with compiling and installing or even modifying source.




-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/
