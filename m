From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NVIDIA (including Optimus) laptop owners - please
 read!
Date: Sun, 09 Oct 2011 13:38:36 +1000
Message-ID: <1318131516.2361.5.camel@nisroch>
References: <CAG2kNCycMfZ_p6RzZ3Tk0g4YYK8O6OAb5R3pj==jfcHAGDp4aQ@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAG2kNCycMfZ_p6RzZ3Tk0g4YYK8O6OAb5R3pj==jfcHAGDp4aQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Gianluca Cecchi <gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 2011-10-09 at 03:06 +0200, Gianluca Cecchi wrote:
> Hello,
Hey,

Thank you for looking at this.

> I have an Asus U36SD with nvidia optimus technology.
> OS is Fedora 15 + virt-preview repo. I have also win7 installed in
> another partition.
> I have the default nouveau drivers installed.
> Here below some infos:
Hmm, from the below info it looks very likely there's *no* outputs wired
up to the NVIDIA GPU on your system.  But, can you attach your dmesg
output so I can take a look.

Thank you,
Ben.

> 
> # lspci -vnnn|grep VGA
> 00:02.0 VGA compatible controller [0300]: Intel Corporation 2nd
> Generation Core Processor Family Integrated Graphics Controller
> [8086:0126] (rev 09) (prog-if 00 [VGA controller])
> 01:00.0 VGA compatible controller [0300]: nVidia Corporation Device
> [10de:1050] (rev a1) (prog-if 00 [VGA controller])
> 
> 
> # cd /sys/firmware/acpi/tables
> # ll
> total 0
> -r-------- 1 root root 0 Oct  9 02:56 APIC
> -r-------- 1 root root 0 Oct  9 02:56 ASF!
> -r-------- 1 root root 0 Oct  9 02:56 DBGP
> -r-------- 1 root root 0 Oct  9 02:56 DMAR
> -r-------- 1 root root 0 Oct  9 02:56 DSDT
> drwxr-xr-x 2 root root 0 Oct  9 02:56 dynamic
> -r-------- 1 root root 0 Oct  9 02:56 ECDT
> -r-------- 1 root root 0 Oct  9 02:56 FACP
> -r-------- 1 root root 0 Oct  9 02:56 FACS
> -r-------- 1 root root 0 Oct  9 02:56 HPET
> -r-------- 1 root root 0 Oct  9 02:56 MCFG
> -r-------- 1 root root 0 Oct  9 02:56 SLIC
> -r-------- 1 root root 0 Oct  9 02:56 SSDT1
> -r-------- 1 root root 0 Oct  9 02:56 SSDT2
> # grep MXMS *
> #
> 
> # modprobe i2c-dev
> # i2cdetect -l
> i2c-0	i2c       	i915 gmbus disabled             	I2C adapter
> i2c-1	i2c       	i915 gmbus ssc                  	I2C adapter
> i2c-2	i2c       	i915 GPIOB                      	I2C adapter
> i2c-3	i2c       	i915 gmbus vga                  	I2C adapter
> i2c-4	i2c       	i915 GPIOA                      	I2C adapter
> i2c-5	i2c       	i915 gmbus panel                	I2C adapter
> i2c-6	i2c       	i915 GPIOC                      	I2C adapter
> i2c-7	i2c       	i915 gmbus dpc                  	I2C adapter
> i2c-8	i2c       	i915 GPIOD                      	I2C adapter
> i2c-9	i2c       	i915 gmbus dpb                  	I2C adapter
> i2c-10	i2c       	i915 GPIOE                      	I2C adapter
> i2c-11	i2c       	i915 gmbus reserved             	I2C adapter
> i2c-12	i2c       	i915 gmbus dpd                  	I2C adapter
> i2c-13	i2c       	i915 GPIOF                      	I2C adapter
> i2c-14	i2c       	DPDDC-C                         	I2C adapter
> i2c-15	smbus     	SMBus I801 adapter at e040      	SMBus adapter
> 
> # lsmod|grep nou
> nouveau               545674  0
> ttm                    55273  1 nouveau
> drm_kms_helper         26474  2 nouveau,i915
> drm                   193955  6 nouveau,i915,ttm,drm_kms_helper
> i2c_algo_bit            5006  2 nouveau,i915
> i2c_core               25712  8
> i2c_dev,videodev,i2c_i801,nouveau,i915,drm_kms_helper,drm,i2c_algo_bit
> mxm_wmi                 1727  1 nouveau
> video                  12340  2 nouveau,i915
> 
> # cat /proc/cmdline
> ro root=UUID=10146a5d-4ae1-4fe0-87a5-691c8121c7dc rd_NO_LUKS rd_NO_LVM
> rd_NO_MD rd_NO_DM LANG=en_US.UTF-8 SYSFONT=latarcyrheb-sun16
> KEYTABLE=us rhgb quiet
> 
> Let me know if you need further info.
> 
> Gianluca
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
