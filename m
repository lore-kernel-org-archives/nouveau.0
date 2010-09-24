From: =?ISO-8859-2?Q?Grzesiek_S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Subject: AMD768 & GeForce5200: nouveau bug??
Date: Fri, 24 Sep 2010 16:37:38 +0200
Message-ID: <4C9CB7B2.3010401@pfu.pl>
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

Hi there,

	Im using ASUS A7M266-D mainboard based on AMD768 chipset and Nvidia
GeForce FX5200 dual DVI graphics adapter. I'm forced to switch from
binary Nvidia drivers to nouveau but the problem is that nouveau.ko
would not load with AGP support turned on. Is it a nouveau/kernel bug??
	To build the kernel I used the kernel tree downloaded from the nouveau
repository about a week ago. The dmesg output with/without the AGP
support you can find at:
http://yen.ipipan.waw.pl/~gs159090/tmp/withAGP.txt.gz
http://yen.ipipan.waw.pl/~gs159090/tmp/withoutAGP.txt.gz
And here is lspci -vv output
http://yen.ipipan.waw.pl/~gs159090/tmp/lspci-vv.txt.gz

Thanks in advance for any help.

Regards
Greg
