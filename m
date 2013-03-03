From: Lijo Antony <lijo.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau not working on second monitor
Date: Sun, 03 Mar 2013 15:24:37 +0400
Message-ID: <513332F5.7030703@gmail.com>
References: <8CFE33A88AEDFDF-6CC-8332E@webmail-d214.sysops.aol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <8CFE33A88AEDFDF-6CC-8332E-n3SY6/QrmYWrbyn9oLO2vrQXJ8qk6zCwQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: rv0987-YDxpq3io04c@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 02/27/2013 11:48 PM, rv0987-YDxpq3io04c@public.gmane.org wrote:
> Hi,
>
> I have a problem that my nouveau driver does not properly load every
> time I boot my laptop.
>
> It either:
> - defaults to the vesa driver (always if my power cord is plugged into
> the laptop
> - starts nouveau but without the external monitor
> - starts nouveau WITH the external monitor (as it should be)
>
> (starting without the monitor attached and then connecting it always
> fails & crashes X)
>
> How/where can i find any help for this?
>
> Details:
> - Ubuntu 12.10.
> - card:  VGA compatible controller: NVIDIA Corporation G86 [GeForce
> 8400M GT] (rev a1)
> - kernel 3.5.0-25-generic
> - X.Org X Server 1.13.0 Release Date: 2012-09-05
> - all nv & nvidia drivers are blacklisted

 From the logs,

[   48.817085] nvidia: module license 'NVIDIA' taints kernel.
[   48.817093] Disabling lock debugging due to kernel taint
[   48.844991] vgaarb: device changed decodes: 
PCI:0000:01:00.0,olddecodes=io+mem,decodes=none:owns=io+mem
[   48.845046] NVRM: The NVIDIA GPU 0000:01:00.0 (PCI ID: 10de:0426)
[   48.845046] NVRM: installed in this system is not supported by the 304.64
[   48.845046] NVRM: NVIDIA Linux driver release.  Please see 'Appendix
[   48.845046] NVRM: A - Supported NVIDIA GPU Products' in this release's
[   48.845046] NVRM: README, available on the Linux driver download page
[   48.845046] NVRM: at www.nvidia.com.
[   48.845074] nvidia: probe of 0000:01:00.0 failed with error -1
[   48.845238] NVRM: The NVIDIA probe routine failed for 1 device(s).
[   48.845242] NVRM: None of the NVIDIA graphics adapters were initialized!

It seems nvidia proprietary driver is still being loaded.

-lijo
