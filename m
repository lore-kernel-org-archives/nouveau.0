From: Rolf Offermanns <rolf.offermanns-hi6Y0CQ0nG0@public.gmane.org>
Subject: Resume broken for all F17 kernels > 3.4.6-2 - Now on
 kernel.org git. Can I help out?
Date: Tue, 9 Oct 2012 00:04:56 +0200
Message-ID: <CAOS6Zj=y_rH=DTzJSCXs0BLiez2GsgCW1a5ZUr4d5XjySmc3aA@mail.gmail.com>
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

Hi All,

I am on F17 with a Sony Vaio Laptop.
NVidia chipset: 01:00.0 VGA compatible controller: nVidia Corporation
GF106 [GeForce GT 555M SDDR3] (rev a1)

Last working (distro) kernel with resume after s2ram was 3.4.6-2. I
guess this is what I see:
https://bugzilla.redhat.com/show_bug.cgi?id=845965

I am currently running a git kernel from today (kernel.org) and resume
is still broken.
The following messages show up in dmesg after resume:
[  404.312775] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcf8000]
[  404.312790] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  404.314079] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcf8000]
[  404.314093] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  404.315202] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcf8000]
[  404.315213] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  404.317131] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcf8000]
[  404.317143] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  404.318929] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcf8000]
[  404.318943] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  404.448818] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcf8000]
[  404.448832] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004020e
[  404.448984] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcf8000]
[  404.448993] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  404.449142] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fcf8000]
[  404.449150] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004020e
[...]

Please let me know, if there is something I can do to help fix this.

-Rolf
