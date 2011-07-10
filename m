From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38687] Wrong resolution on LCD TV's
Date: Sat,  9 Jul 2011 22:49:36 -0700 (PDT)
Message-ID: <20110710054936.50C5F130171@annarchy.freedesktop.org>
References: <bug-38687-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38687-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38687

--- Comment #12 from Damian <damianatorrpm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-07-09 22:49:35 PDT ---
XXXXX@XXXXXXX:~> sudo ls /sys/class/
root's password:
ata_device  backlight  bsg  firmware  hidraw       input  mdio_bus  msr     
power_supply  regulator    scsi_disk     sound       tty  video4linux
ata_link    bdi        dma  gpio      hwmon        leds   mem       net     
ppdev         rtc          scsi_generic  spi_master  usb  vtconsole
ata_port    block      dmi  graphics  i2c-adapter  lirc   misc      pci_bus  rc
           scsi_device  scsi_host     thermal     vc

XXXXX@XXXXXXXX:~> sudo ls /sys/class/graphics/
fb0  fbcon

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
