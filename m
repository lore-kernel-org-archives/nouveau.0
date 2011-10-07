From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: NVIDIA (including Optimus) laptop owners - please read!
Date: Fri, 07 Oct 2011 10:56:57 +1000
Message-ID: <1317949017.2403.18.camel@nisroch>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
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

Hi guys and gals,

I'm working on improving nouveau's support for MXM (Mobile PCI Express
Module) chips and need some more data to check my implementation.

To see if you can help, the first thing to do is jump over
to /sys/firmware/acpi/tables and run "grep MXMS *".

[root@nisroch tables]# grep MXMS *
Binary file DSDT matches
[root@nisroch tables]# 

If this isn't present, while running nouveau, using i2c-tools (fedora
package name) do the following as root:

modprobe i2c-dev
i2cdetect -l

Any you should see something like:

[root@nisroch ~]# i2cdetect -l
i2c-0	smbus     	SMBus I801 adapter at 1860 SMBus adapter
i2c-1	i2c       	nouveau-0000:01:00.0-2     I2C adapter
i2c-2	i2c       	nouveau-0000:01:00.0-0     I2C adapter
i2c-3	i2c       	nouveau-0000:01:00.0-10    I2C adapter
i2c-4	i2c       	nouveau-0000:01:00.0-6     I2C adapter
i2c-5	i2c       	nouveau-0000:01:00.0-11    I2C adapter
i2c-6	i2c       	nouveau-0000:01:00.0-12    I2C adapter
i2c-7	i2c       	nouveau-0000:01:00.0-8     I2C adapter

For every nouveau entry there, run "i2cdetect <bus>" (where number is
the i2c-<bus> in the above list).  If you see 0x54 or 0x56 appear on any
of the i2c busses, please save the output of "i2cdump <bus> <address>",
where <address> is 0x54 or 0x56 (whichever appears).

If you either the above is present, it would be a great help if you
could email the matching files along with a number of different vbios
images to mmio.dumps-Re5JQEeQqe9fmgfxC/sS/w@public.gmane.org

Now, onto the different vbios images.  To obtain these, install
envytools[1] and run the following:

nvagetbios -S PRAMIN > vbios_pramin.rom
nvagetbios -s PROM > vbios_prom.rom

If fetching the VBIOS from PROM fails with (for example):

[root@nisroch tables]# nvagetbios -s PROM >vbios.rom
Attempt to extract the vbios from card 0 (nva8) using PROM
Invalid signature(0x55aa). You may want to try another retrieval method.
[root@nisroch tables]# 

Then it's possible that we need to fetch it from ACPI instead.  The
easiest way is probably to reboot with "nouveau.vbios=ACPI" in your
kernel options, and then:

mount -t debugfs debugfs /sys/kernel/debug
cp /sys/kernel/debug/dri/0/vbios.rom ~/

Any questions, feel free to respond to this email or jump into #nouveau
on freenode and ping me (darktama).

Thanks in advance!
Ben.

[1]
http://nouveau.git.sourceforge.net/git/gitweb.cgi?p=nouveau/envytools;a=summary
